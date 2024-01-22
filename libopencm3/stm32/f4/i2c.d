module libopencm3.stm32.f4.i2c;

public import libopencm3.stm32.common.i2c_common_v1;

/**
@addtogroup i2c_defines
@{*/

/** FLTR register (I2Cx_FLTR) (noise filter) */
enum I2C_FLTR(uint i2c_base) = MMIO32!(i2c_base + 0x24);
// extern (D) auto I2C_FLTR(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x24);
// }

enum I2C1_FLTR = I2C_FLTR!(I2C1);
enum I2C2_FLTR = I2C_FLTR!(I2C2);
enum I2C3_FLTR = I2C_FLTR!(I2C3);

/**
 * Bits [3:0] DNF - Digital noise filter
 * These bits configure a digital noise filter on SDA and SCL pins.
 * Value sets minimum pulse width needed to trigger i2c operations.
 * 0 disables, 1 - 15 set minimum width to 'n' * TPCLK1
 */
enum I2C_FLTR_DNF_MASK = 0xF;
enum I2C_FLTR_DNF_SHIFT = 0;

/**
 * Bit 4 - Analog Noise filter disable
 * Turns off the built in analog noise filter.
 */
enum I2C_FLTR_ANOFF = 1 << 4;

/**@}*/
