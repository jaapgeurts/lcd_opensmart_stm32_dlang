import core.stdc.stdio;

import libopencm3.stm32.rcc;

import io;
import clock;
import mcudruntime;

import ili9327;
import lm75a;

import sdcard;

import pff;

ILI9327 lcd;

void gpio_setup()
{
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);
}

ubyte[512] buf;

struct Color {
ubyte r;
ubyte g;
ubyte b;
}
Color[7] cols = [
  {0x1f,0x3f,0x1f},
  {0x1f,0x3f,0x00},
  {0x00,0x3f,0x00},
  {0x00,0x3f,0x1f},
  {0x00,0x00,0x1f},
  {0x1f,0x00,0x1f},
  {0x1f,0x00,0x00},
];


void read_dir() {
    FATFS fatfs;
    DIR dir;
    FRESULT rc;
    FILINFO fno;

    writeln("Mounting SDcard");

    rc = pf_mount(&fatfs);
    if (rc) {
        writeln("failed mounting: ", rc);
        return;
    }

    // open root dir
    rc = pf_opendir(&dir, "");
    if (rc) {
        writeln("failed open dir: ",rc);
        return;
    }

    writeln("Reading dir");
	while(true) {
		rc = pf_readdir(&dir, &fno);	/* Read a directory item */
		if (rc || fno.fname[0] == 0) {
            writeln("Nothing: ", rc);
            break;	/* Error or end of dir */
        }
		if (fno.fattrib & AM_DIR)
			writeln("* ",cast(string)(fno.fname[0..strlen(&fno.fname[0])]));
		else
            writeln("  ",cast(string)(fno.fname[0..strlen(&fno.fname[0])]),":",fno.fsize);
	}
	if (rc) {
        writeln("Failure: ", rc);
        return;
	}
}

extern(C) void main()
{

    rt_start();

    // string a;
    // a ~= "a";
    clock_setup();
    systick_setup();

    gpio_setup();
    setupIO();

    writeln("STM32F401RE Dlang LibOpenCM3 demo");

    // TODO: unify setup naming convention
//    init_lm72a();
    lcd_setup(lcd);
    device_code_read();

    init_sdcard();

    read_dir();

    start_write();
    foreach(j; 0..810) { // 810 blocks of 512 bytes
        sdcard_readblock(j,buf);
        foreach(i; 0..128) { // data is RGBA (128*4 = 512)
            send_pixel(buf[i*4],buf[i*4+1],buf[i*4+2]);
        }
    }
    end_write();
    writeln("Loaded");
    while(true) {
       delay(5000);
    }

    while(true) {
        writeln("Temperature: ",read_temp());
        delay(1000);
    }

    while(true) {
        // RGB 5-6-5
        foreach(i; 0..7) {
            fill_display(cols[i].r,cols[i].g,cols[i].b);
            delay(10000);
        }
    }

    writeln("Sent all data");

}
