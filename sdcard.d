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
import crc7;

import libopencm3.stm32.rcc;
import libopencm3.stm32.gpio;
import libopencm3.stm32.spi;

enum SDCARD_CS = GPIO4;
enum SPI3_SCK = GPIO10;
enum SPI3_MISO = GPIO11;
enum SPI3_MOSI = GPIO12;

enum SDCardCommand {
  CMD0 = 0,     // goto idle
  CMD1 = 1,     // start init process. Prefer ACMD41
  CMD8 = 8,     // check voltage range
  CMD9 = 9,     // read CSD register
  CMD10 = 10,   // read CID register
  CMD12 = 12,   // Stop to read data
  CMD16 = 16,   // Change R/W block size
  CMD17 = 17,   // Read a block
  CMD18 = 18,   // Read multiple blocks
  CMD23 = 23,   // (only MMC) define # of blocks for next transfer multi block cmd
  CMD24 = 24,   // Write a block
  CMD25 = 25,   // Write multiple blocks
  CMD55 = 55,   // Start a APP_CMD ACMD<N>
  CMD58 = 58,   // Read OCR
  ACMD23 = 23,  // (only MMC) define # of blocks to pre-erase with next multiblock write
  ACMD41 = 41,  // Start init process
}

void sdcard_send(ubyte data) {
    spi_send(SPI3,data);
}

void sdcard_send_cmd(ubyte cmd, uint arg) {

    // Send command
    cmd |= 0x40;
    ubyte crc = CRCAdd(0, cmd);
    sdcard_send(cmd);

    foreach(i; 0..4) {
        import io;
        // send data
        ubyte data = cast(ubyte) (arg >> (24-(i<<3)));
        crc = CRCAdd(crc,data);
        sdcard_send(data);
    }
    sdcard_send(cast(ubyte)(crc << 1 | 1));
}

ubyte sdcard_read_r1() {
    ubyte i = 8;
    ubyte r;
    do {
        r = sdcard_xfer(0xff);
        i--;
    } while(r == 0xff && i > 0);

    return r;
}

ubyte sdcard_read_r3r7(ref uint resp) {
    ubyte r1 = sdcard_read_r1();

    resp = 0x00;
    foreach(i; 0..4) {
        resp <<= 8;
        resp |= sdcard_xfer(0xff);
    }

    return r1;
}

ubyte sdcard_xfer(ubyte data) {
    // return cast(ubyte)spi_xfer(SPI3,data);
    sdcard_send(data); // send a to trigger the next response
    return cast(ubyte)spi_read(SPI3);
}

ubyte sdcard_read() {
    return cast(ubyte)spi_read(SPI3);
}

// // read
// ubyte sdcard_poll_result() {
//     ubyte i = 8;
//     ubyte r;
//     do {
//         r = sdcard_xfer(0xff);
//         i--;
//     } while(r == 0xff && i > 0);
//
//     return r;
// }
//
// // Blocking write
// void sdcard_send(ubyte data) {
//   spi_send(SPI3,data);
// }
//
// // blocking write
// void sdcard_send(ubyte[6] data) {
//     foreach(b; data)
//         spi_send(SPI3,b);
// }

private void init_spi() {
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
}

void init_sdcard() {

    init_spi();

    writeln("Init SDCard");

    // wait at least 1ms
    delay(1000);

    // Send at least 74 clocks with CS high
    foreach(i; 0..10) {
        sdcard_send(0xff);
    }

    sdcard_send(0xff);
    // pull CS low (active low)
    gpio_clear(GPIOB,SDCARD_CS);
    sdcard_send(0xff);

    // CMD0 (go to idle state)
    sdcard_send_cmd(SDCardCommand.CMD0,0);
    ubyte r = sdcard_read_r1();
    sdcard_send(0xff);
    writeln("done: ",cast(ushort)r);

    // CMD8 (interface condition)
    sdcard_send_cmd(SDCardCommand.CMD8,0x01AA);
    write("cmd8: ");
    uint trail;
    r = sdcard_read_r3r7(trail);
    write(cast(ushort)r,",");
    writeln(trail);
    sdcard_send(0xff);
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
        // CMD55:R1 (next cmd is app specific)
        sdcard_send_cmd(SDCardCommand.CMD55,0);
        r = sdcard_read_r1();
        // ACMD41:R1 (send operation condition)
        sdcard_send_cmd(SDCardCommand.ACMD41,0x40000000);
        r = sdcard_read_r1();
        write('.');
    } while (r == 0x01);
    writeln("Ready");


    // // CMD58:R3 (read OCR)
    sdcard_send_cmd(SDCardCommand.CMD58,0);
    write("cmd58: ");
    r = sdcard_read_r3r7(trail);
    write(cast(ushort)r,",");
    writeln(trail);
    sdcard_send(0xff);

    // CMD17 (read single block)
    sdcard_send_cmd(SDCardCommand.CMD17,0);
    write("cmd17: ");
    r = sdcard_read_r1();
    if (r != 0xff) {
        do {
            r = sdcard_xfer(0xff);
            // wait for start marker
        } while (r == 0xff);
        if (r == 0xfe) {
          writeln("Block:");
          foreach(i;0..512) {
            r = sdcard_xfer(0xff);
            write(cast(ushort)r,' ');
          }
        }
    }
    sdcard_send(0xff);// finish the last transaction

    gpio_set(GPIOB,SDCARD_CS); // set CS high

    writeln("Init SDCard finished.");


}


