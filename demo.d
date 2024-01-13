import core.stdc.stdio;

import stmbridge;
import io;
import clock;
import mcudruntime;
import button;

import ili9327;

ILI9327 lcd;

void gpio_setup()
{
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);
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

    delay(10000);
    writeln("Hello world");

    lcd_setup(lcd);

    device_code_read();

    set_display_off(lcd);

    writeln("Sent all data");

}
