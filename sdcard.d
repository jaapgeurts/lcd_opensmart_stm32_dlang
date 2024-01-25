/* Module to talk to SPI sd sdcard
 * connection (uno pins):
 * SPI  : UNO : STM NUCLEO
 * CS   : D5  : PB4
 * SCK  :     : PC10
 * MISO :     : PC12
 * MOSI :     : PC11
 *
 * the lcd is connected to alternate function AF06, SPI3
 */

module sdcard;

import mcudruntime;
import io;

import libopencm3.stm32.rcc;
import libopencm3.stm32.gpio;
import libopencm3.stm32.spi;

enum SDCARD_CS = GPIO4;
enum SPI3_SCK = GPIO10;
enum SPI3_MISO = GPIO11;
enum SPI3_MOSI = GPIO12;


// read
ubyte sdcard_read() {
    ubyte i = 8;
    ubyte r;
    do {
        sdcard_send(0xff); // send another byte to trigger the next response
        r = cast(ubyte)spi_read(SPI3);
        i--;
    } while (r == 0xff && i > 0);
    return r;
}

// Blocking write
void sdcard_send(ubyte data) {
  spi_send(SPI3,data);
}

// blocking write + read
void sdcard_send(ubyte[6] data) {
    ubyte r;
    foreach(b; data)
        spi_send(SPI3,b);
}

void init_sdcard() {

    rcc_periph_clock_enable(RCC_GPIOB|RCC_GPIOC);
    rcc_periph_clock_enable(RCC_SPI3);

    /* Chip select line. set idle = HIGH*/
	gpio_set(GPIOB, SDCARD_CS);
	gpio_mode_setup(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, SDCARD_CS);

	// MISO
    //gpio_mode_setup(GPIOC, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SPI3_MISO);

	// SCK, MISO, MOSI setup
    gpio_mode_setup(GPIOC, GPIO_MODE_AF, GPIO_PUPD_NONE, SPI3_SCK | SPI3_MISO | SPI3_MOSI);
    // SETUP alternate function 5 (SPI) for three pins.
	gpio_set_af(GPIOC, GPIO_AF6, SPI3_SCK | SPI3_MISO | SPI3_MOSI);

	// // scard transfer mode perhaps 50MHz
    // gpio_set_output_options(GPIOC, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, SPI3_SCK | SPI3_MOSI);

    spi_init_master(SPI3,
                    SPI_CR1_BAUDRATE_FPCLK_DIV_256, //  84Mhz / 256 =~ 380Khz
					SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE,
					SPI_CR1_CPHA_CLK_TRANSITION_1,
					SPI_CR1_DFF_8BIT,
					SPI_CR1_MSBFIRST);

    //spi_set_full_duplex_mode(SPI3);
    spi_disable_crc(SPI3);
    spi_enable_software_slave_management(SPI3);
    spi_set_nss_high(SPI3);

    spi_enable(SPI3);

    writeln("Init SDCard");

    // wait at least 1ms
    delay(1000);

    // Send at least 74 clocks with CS high
    foreach(i; 0..10) {
        sdcard_send(0xff);
    }

    gpio_clear(GPIOB,SDCARD_CS); // pull CS low (active low)

    // CMD0 (go to idle state)
    ubyte[6] data  = [0x40,0x00,0x00,0x00,0x00,0x95 ];
    sdcard_send(data);
    ubyte r = sdcard_read();
    writeln("done: ",cast(ushort)r);

    // CMD8 (interface condition)
    data = [0x48, 0x00, 0x00, 0x01, 0xAA,  0x87];
    sdcard_send(data);
    write("cmd8: ");
    do {
        r = sdcard_read();
        write(cast(ushort)r,',');
    } while (r != 0xff);
    writeln();

    // // CMD58 (read OCR)
    // data = [0x7A, 0x00, 0x00, 0x00, 0x00, 0xFD];
    // sdcard_send(data);
    // write("cmd58: ");
    // do {
    //     r = sdcard_read();
    //     write(cast(ushort)r,',');
    // } while (r != 0xff);
    // writeln();

    do {
        // CMD55 (next cmd is app specific)
        data = [0x77, 0x00, 0x00, 0x00, 0x00, 0x65];
        sdcard_send(data);
        write("cmd55: ");
        do {
            r = sdcard_read();
            write(cast(ushort)r,',');
        } while (r != 0xff);
        writeln();

        // ACMD41 (send operation condition)
        data = [0x69,0x40,0x00,0x00,0x00,0x77];
        sdcard_send(data);
        write("ACMD41: ");
        do {
            r = sdcard_read();
            write(cast(ushort)r,',');
        } while (r == 0xff);
    } while (r == 0x01);
    writeln("Ready");


    // // CMD58 (read OCR)
    data = [0x7A, 0x00, 0x00, 0x00, 0x00, 0x7e];
    sdcard_send(data);
    write("cmd58: ");
    do {
        r = sdcard_read();
        write(cast(ushort)r,',');
    } while (r != 0xff);
    writeln();

    // CMD17 (read single block)
    data = [0x51, 0x00, 0x00, 0x00, 0x00, 0xFD];
    sdcard_send(data);
    write("cmd17: ");
    r = sdcard_read();
    if (r != 0xff) {
        do {
            sdcard_send(0xff);
            r = cast(ubyte)spi_read(SPI3);
        } while (r == 0xff);
        if (r == 0xfe) {
          writeln("Block:");
          foreach(i;0..512) {
            sdcard_send(0xff);
            r = cast(ubyte)spi_read(SPI3);
            write(cast(ushort)r,' ');
          }
        }
    }

    gpio_set(GPIOB,SDCARD_CS); // set CS high

    writeln("Init SDCard finished.");


}


