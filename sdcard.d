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

import diskio;

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
    // This line doesn't work.
    // return cast(ubyte)spi_xfer(SPI3,data);
    sdcard_send(data); // send a to trigger the next response
    return cast(ubyte)spi_read(SPI3);
}

ubyte sdcard_read() {
    return cast(ubyte)spi_read(SPI3);
}

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

    sdcard_select();

    // CMD0::r1 (go to idle state)
    sdcard_send_cmd(SDCardCommand.CMD0,0);
    ubyte r = sdcard_read_r1();
    writeln("done: ",cast(ushort)r);

    // CMD8::r3 (interface condition)
    sdcard_send_cmd(SDCardCommand.CMD8,0x01AA);
    write("cmd8: ");
    uint trail;
    r = sdcard_read_r3r7(trail);
    write(cast(ushort)r,',');
    writeln(trail);
    writeln();

    do {
        // CMD55::R1 (next cmd is app specific)
        sdcard_send_cmd(SDCardCommand.CMD55,0);
        r = sdcard_read_r1();
        // ACMD41:R1 (send operation condition)
        sdcard_send_cmd(SDCardCommand.ACMD41,0x40000000);
        r = sdcard_read_r1();
        write('.');
    } while (r == 0x01);
    writeln("Ready");


    // // CMD58::R3 (read OCR)
    sdcard_send_cmd(SDCardCommand.CMD58,0);
    write("cmd58: ");
    r = sdcard_read_r3r7(trail);
    write(cast(ushort)r,',');
    writeln(trail);

    // set baudrate faster: 84Mhz / 4 =~ 21 MHz

    spi_set_baudrate_prescaler(SPI3,SPI_CR1_BAUDRATE_FPCLK_DIV_4); //

    // setblocksize to 512
    // prolly already was 512
    // sdcard_send_cmd(SDCardCommand.CMD16,512);
    // write("cmd16: ");
    // r = sdcard_read_r1();
    // writeln(cast(ushort)r);

    sdcard_release();

    writeln("Init SDCard finished.");


}

private void sdcard_release()
{
    sdcard_send(0xff);// finish the last transaction
    gpio_set(GPIOB,SDCARD_CS); // set CS high
    sdcard_send(0xff);
}

private void sdcard_select()
{
    sdcard_send(0xff);// finish the last transaction
    gpio_clear(GPIOB,SDCARD_CS); // set CS high
    sdcard_send(0xff);

}

void sdcard_readblock(uint addr, ref ubyte[512] buf) {


    // connect SPI

    sdcard_select();

    // CMD17:address:R1 (read single block)
    sdcard_send_cmd(SDCardCommand.CMD17,addr);
    //write("cmd17: ");
    ubyte r = sdcard_read_r1();
    if (r != 0xff) {
        do {
            r = sdcard_xfer(0xff);
            // wait for start marker
        } while (r == 0xff);
        if (r == 0xfe) {
          //writeln("Block:");
          foreach(i;0..512) {
            buf[i] = sdcard_xfer(0xff);
            //write(cast(ushort)buf[i],' ');
          }
          // read 16 bit CRC but ignore for now
          sdcard_xfer(0xff);
          sdcard_xfer(0xff);
        }
    }

    sdcard_release();

    // disconnect SPI
}



//********************************
// FAT functions

extern (C) {

DSTATUS disk_initialize ()
{
    return RES_OK;
}

DRESULT disk_readp (ubyte* buff, uint sector, uint offset, uint count)
{
    sdcard_select();


    if (count > 512)
        writeln("read size larger than buf: ", count);

    // CMD17:address:R1 (read single block)
    sdcard_send_cmd(SDCardCommand.CMD17,sector);
    //write("cmd17: ");
    ubyte r = sdcard_read_r1();
    if (r != 0xff) {
        do {
            r = sdcard_xfer(0xff);
            // wait for start marker
        } while (r == 0xff);
        if (r == 0xfe) {
            uint skip = 514 - offset - count;
            foreach(i;0..offset)
                sdcard_xfer(0xff); // skip bytes
            foreach(i;0..count) {
                buff[i] = sdcard_xfer(0xff);
                //write(cast(ushort)buff[i],' ');
            }
            // read 16 bit CRC but ignore for now
            foreach(i;0..skip)
                sdcard_xfer(0xff);
            // sdcard_xfer(0xff);
            // sdcard_xfer(0xff);
            // sdcard_xfer(0xff);
        }
    }

    sdcard_release();

    return RES_OK;
}

DRESULT disk_writep (const(ubyte)* buff, uint sc)
{
    return RES_ERROR;
}

}

