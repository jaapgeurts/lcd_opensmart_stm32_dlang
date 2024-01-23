import core.stdc.stdio;

import libopencm3.stm32.rcc;

import io;
import clock;
import mcudruntime;

import ili9327;
import lm75a;

import sdcard;

ILI9327 lcd;

void gpio_setup()
{
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);
}

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

extern(C) void main()
{

    rt_start();

    // string a;
    // a ~= "a";
    clock_setup();
    systick_setup();

    gpio_setup();
    setupIO();

    writeln("Hello world");

    // TODO: unify setup naming convention
//    init_lm72a();
//    lcd_setup(lcd);
//    device_code_read();

    init_sdcard();
    writeln("SDCard init");
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
