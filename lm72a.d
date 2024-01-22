/*
 * temperature sensor module
 * Device: lm72a
 * i2c address: 0x48
 * connection (uno pins):
 * SDA: D14
 * SCL: D15
 */

module lm72a;

import libopencm3.stm32.gpio;
import libopencm3.stm32.i2c;
import libopencm3.stm32.rcc;

enum LM75_I2C_ADDRESS = 0x48;

enum LM75Register {
    // Temperature register: contains two 8-bit data bytes; to store the measured Temp data
    Temp = 0,
    // Configuration register: contains a single 8-bit data byte; to set the device operating condition; default = 0
    Conf = 1,
    // Hysteresis register: contains two 8-bit data bytes; to store the hysteresis T hyst limit; default = 75°C
    Thyst = 2,
    // Overtemperature shutdown threshold register: contains two 8-bit data bytes; to store the overtemperature shutdown Tos limit; default = 80°C.
    Tos = 3,
}

LM75Register regs;

// values to shift by
enum LM75Conf{
 Shutdown = 0,
 Os_Comp_Int = 1,
 Os_Pol = 2,
 Os_F_Que = 3,
}

void init_lm72a() {
    rcc_periph_clock_enable(RCC_I2C1); //RCC_I2C1,RCC_I2C2,RCC_I2C3
    i2c_peripheral_disable(I2C1);

    // Set GPIO B8/B9 alternate function to IC2
    gpio_mode_setup(GPIOB, GPIO_MODE_AF, GPIO_PUPD_PULLUP, GPIO8 | GPIO9);
    gpio_set_output_options(GPIOB, GPIO_OTYPE_OD, GPIO_OSPEED_25MHZ, GPIO8 | GPIO9);
    gpio_set_af(GPIOB, GPIO_AF4, GPIO8 | GPIO9);

    i2c_set_speed(I2C1, i2c_speed_sm_100k, 8);

    i2c_set_standard_mode(I2C1);
    i2c_peripheral_enable(I2C1);
}

short read_temp() {
    ubyte[2] buf;
    const ubyte t = LM75Register.Temp;
    i2c_transfer7(I2C1,LM75_I2C_ADDRESS,&t,1,buf.ptr,2);
    return cast(short)((buf[0] << 8) | buf[1]);
}
