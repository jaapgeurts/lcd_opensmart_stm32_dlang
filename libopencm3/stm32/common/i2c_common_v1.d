module libopencm3.stm32.common.i2c_common_v1;

public import libopencm3.cm3.common;
public import libopencm3.stm32.memorymap;


/* --- Convenience macros -------------------------------------------------- */

/* I2C register base addresses (for convenience) */
/****************************************************************************/
/** @defgroup i2c_reg_base I2C register base address
@ingroup i2c_defines

@{*/
enum I2C1 = I2C1_BASE;
enum I2C2 = I2C2_BASE;

enum I2C3 = I2C3_BASE;

/**@}*/

/* --- I2C registers ------------------------------------------------------- */

/* Control register 1 (I2Cx_CR1) */
enum I2C_CR1(uint i2c_base) = MMIO32!(i2c_base + 0x00);
// extern (D) auto I2C_CR1(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x00);
// }

enum I2C1_CR1 = I2C_CR1!(I2C1);
enum I2C2_CR1 = I2C_CR1!(I2C2);

/* Control register 2 (I2Cx_CR2) */
enum I2C_CR2(uint i2c_base) = MMIO32!(i2c_base + 0x04);
// extern (D) auto I2C_CR2(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x04);
// }

enum I2C1_CR2 = I2C_CR2!(I2C1);
enum I2C2_CR2 = I2C_CR2!(I2C2);

/* Own address register 1 (I2Cx_OAR1) */
enum I2C_OAR1(uint i2c_base) = MMIO32!(i2c_base + 0x08);
// extern (D) auto I2C_OAR1(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x08);
// }

enum I2C1_OAR1 = I2C_OAR1!(I2C1);
enum I2C2_OAR1 = I2C_OAR1!(I2C2);

/* Own address register 2 (I2Cx_OAR2) */
enum I2C_OAR2(uint i2c_base) = MMIO32!(i2c_base + 0x0c);
// extern (D) auto I2C_OAR2(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x0c);
// }

enum I2C1_OAR2 = I2C_OAR2!(I2C1);
enum I2C2_OAR2 = I2C_OAR2!(I2C2);

/* Data register (I2Cx_DR) */
enum I2C_DR(uint i2c_base) = MMIO32!(i2c_base + 0x10);
// extern (D) auto I2C_DR(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x10);
// }

enum I2C1_DR = I2C_DR!(I2C1);
enum I2C2_DR = I2C_DR!(I2C2);

/* Status register 1 (I2Cx_SR1) */
enum I2C_SR1(uint i2c_base) = MMIO32!(i2c_base + 0x14);
// extern (D) auto I2C_SR1(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x14);
// }

enum I2C1_SR1 = I2C_SR1!(I2C1);
enum I2C2_SR1 = I2C_SR1!(I2C2);

/* Status register 2 (I2Cx_SR2) */
enum I2C_SR2(uint i2c_base) = MMIO32!(i2c_base + 0x18);
// extern (D) auto I2C_SR2(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x18);
// }

enum I2C1_SR2 = I2C_SR2!(I2C1);
enum I2C2_SR2 = I2C_SR2!(I2C2);

/* Clock control register (I2Cx_CCR) */
enum I2C_CCR(uint i2c_base) = MMIO32!(i2c_base + 0x1c);
// extern (D) auto I2C_CCR(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x1c);
// }

enum I2C1_CCR = I2C_CCR!(I2C1);
enum I2C2_CCR = I2C_CCR!(I2C2);

/* TRISE register (I2Cx_CCR) */
enum I2C_TRISE(uint i2c_base) = MMIO32!(i2c_base + 0x20);
// extern (D) auto I2C_TRISE(T)(auto ref T i2c_base)
// {
//     return MMIO32(i2c_base + 0x20);
// }

enum I2C1_TRISE = I2C_TRISE!(I2C1);
enum I2C2_TRISE = I2C_TRISE!(I2C2);

/* Not all parts have i2c3 */

enum I2C3_CR1 = I2C_CR1!(I2C3);
enum I2C3_CR2 = I2C_CR2!(I2C3);
enum I2C3_OAR1 = I2C_OAR1!(I2C3);
enum I2C3_OAR2 = I2C_OAR2!(I2C3);
enum I2C3_DR = I2C_DR!(I2C3);
enum I2C3_SR1 = I2C_SR1!(I2C3);
enum I2C3_SR2 = I2C_SR2!(I2C3);
enum I2C3_CCR = I2C_CCR!(I2C3);
enum I2C3_TRISE = I2C_TRISE!(I2C3);

/* --- I2Cx_CR1 values ----------------------------------------------------- */

/* SWRST: Software reset */
enum I2C_CR1_SWRST = 1 << 15;

/* Note: Bit 14 is reserved, and forced to 0 by hardware. */

/* ALERT: SMBus alert */
enum I2C_CR1_ALERT = 1 << 13;

/* PEC: Packet error checking */
enum I2C_CR1_PEC = 1 << 12;

/* POS: Acknowledge / PEC position */
enum I2C_CR1_POS = 1 << 11;

/* ACK: Acknowledge enable */
enum I2C_CR1_ACK = 1 << 10;

/* STOP: STOP generation */
enum I2C_CR1_STOP = 1 << 9;

/* START: START generation */
enum I2C_CR1_START = 1 << 8;

/* NOSTRETCH: Clock stretching disable (slave mode) */
enum I2C_CR1_NOSTRETCH = 1 << 7;

/* ENGC: General call enable */
enum I2C_CR1_ENGC = 1 << 6;

/* ENPEC: Enable PEC */
enum I2C_CR1_ENPEC = 1 << 5;

/* ENARP: ARP enable */
enum I2C_CR1_ENARP = 1 << 4;

/* SMBTYPE: SMBus type */
enum I2C_CR1_SMBTYPE = 1 << 3;

/* Note: Bit 2 is reserved, and forced to 0 by hardware. */

/* SMBUS: SMBus mode */
enum I2C_CR1_SMBUS = 1 << 1;

/* PE: Peripheral enable */
enum I2C_CR1_PE = 1 << 0;

/* --- I2Cx_CR2 values ----------------------------------------------------- */

/* Note: Bits [15:13] are reserved, and forced to 0 by hardware. */

/* LAST: DMA last transfer */
enum I2C_CR2_LAST = 1 << 12;

/* DMAEN: DMA requests enable */
enum I2C_CR2_DMAEN = 1 << 11;

/* ITBUFEN: Buffer interrupt enable */
enum I2C_CR2_ITBUFEN = 1 << 10;

/* ITEVTEN: Event interrupt enable */
enum I2C_CR2_ITEVTEN = 1 << 9;

/* ITERREN: Error interrupt enable */
enum I2C_CR2_ITERREN = 1 << 8;

/* Note: Bits [7:6] are reserved, and forced to 0 by hardware. */

enum i2c_cr2_freq_values
{
    I2C_CR2_FREQ_2MHZ = 2,
    I2C_CR2_FREQ_3MHZ = 3,
    I2C_CR2_FREQ_4MHZ = 4,
    I2C_CR2_FREQ_5MHZ = 5,
    I2C_CR2_FREQ_6MHZ = 6,
    I2C_CR2_FREQ_7MHZ = 7,
    I2C_CR2_FREQ_8MHZ = 8,
    I2C_CR2_FREQ_9MHZ = 9,
    I2C_CR2_FREQ_10MHZ = 10,
    I2C_CR2_FREQ_11MHZ = 11,
    I2C_CR2_FREQ_12MHZ = 12,
    I2C_CR2_FREQ_13MHZ = 13,
    I2C_CR2_FREQ_14MHZ = 14,
    I2C_CR2_FREQ_15MHZ = 15,
    I2C_CR2_FREQ_16MHZ = 16,
    I2C_CR2_FREQ_17MHZ = 17,
    I2C_CR2_FREQ_18MHZ = 18,
    I2C_CR2_FREQ_19MHZ = 19,
    I2C_CR2_FREQ_20MHZ = 20,
    I2C_CR2_FREQ_21MHZ = 21,
    I2C_CR2_FREQ_22MHZ = 22,
    I2C_CR2_FREQ_23MHZ = 23,
    I2C_CR2_FREQ_24MHZ = 24,
    I2C_CR2_FREQ_25MHZ = 25,
    I2C_CR2_FREQ_26MHZ = 26,
    I2C_CR2_FREQ_27MHZ = 27,
    I2C_CR2_FREQ_28MHZ = 28,
    I2C_CR2_FREQ_29MHZ = 29,
    I2C_CR2_FREQ_30MHZ = 30,
    I2C_CR2_FREQ_31MHZ = 31,
    I2C_CR2_FREQ_32MHZ = 32,
    I2C_CR2_FREQ_33MHZ = 33,
    I2C_CR2_FREQ_34MHZ = 34,
    I2C_CR2_FREQ_35MHZ = 35,
    I2C_CR2_FREQ_36MHZ = 36,
    I2C_CR2_FREQ_37MHZ = 37,
    I2C_CR2_FREQ_38MHZ = 38,
    I2C_CR2_FREQ_39MHZ = 39,
    I2C_CR2_FREQ_40MHZ = 40,
    I2C_CR2_FREQ_41MHZ = 41,
    I2C_CR2_FREQ_42MHZ = 42
}

alias I2C_CR2_FREQ_2MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_2MHZ;
alias I2C_CR2_FREQ_3MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_3MHZ;
alias I2C_CR2_FREQ_4MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_4MHZ;
alias I2C_CR2_FREQ_5MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_5MHZ;
alias I2C_CR2_FREQ_6MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_6MHZ;
alias I2C_CR2_FREQ_7MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_7MHZ;
alias I2C_CR2_FREQ_8MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_8MHZ;
alias I2C_CR2_FREQ_9MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_9MHZ;
alias I2C_CR2_FREQ_10MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_10MHZ;
alias I2C_CR2_FREQ_11MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_11MHZ;
alias I2C_CR2_FREQ_12MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_12MHZ;
alias I2C_CR2_FREQ_13MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_13MHZ;
alias I2C_CR2_FREQ_14MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_14MHZ;
alias I2C_CR2_FREQ_15MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_15MHZ;
alias I2C_CR2_FREQ_16MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_16MHZ;
alias I2C_CR2_FREQ_17MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_17MHZ;
alias I2C_CR2_FREQ_18MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_18MHZ;
alias I2C_CR2_FREQ_19MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_19MHZ;
alias I2C_CR2_FREQ_20MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_20MHZ;
alias I2C_CR2_FREQ_21MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_21MHZ;
alias I2C_CR2_FREQ_22MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_22MHZ;
alias I2C_CR2_FREQ_23MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_23MHZ;
alias I2C_CR2_FREQ_24MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_24MHZ;
alias I2C_CR2_FREQ_25MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_25MHZ;
alias I2C_CR2_FREQ_26MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_26MHZ;
alias I2C_CR2_FREQ_27MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_27MHZ;
alias I2C_CR2_FREQ_28MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_28MHZ;
alias I2C_CR2_FREQ_29MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_29MHZ;
alias I2C_CR2_FREQ_30MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_30MHZ;
alias I2C_CR2_FREQ_31MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_31MHZ;
alias I2C_CR2_FREQ_32MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_32MHZ;
alias I2C_CR2_FREQ_33MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_33MHZ;
alias I2C_CR2_FREQ_34MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_34MHZ;
alias I2C_CR2_FREQ_35MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_35MHZ;
alias I2C_CR2_FREQ_36MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_36MHZ;
alias I2C_CR2_FREQ_37MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_37MHZ;
alias I2C_CR2_FREQ_38MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_38MHZ;
alias I2C_CR2_FREQ_39MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_39MHZ;
alias I2C_CR2_FREQ_40MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_40MHZ;
alias I2C_CR2_FREQ_41MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_41MHZ;
alias I2C_CR2_FREQ_42MHZ = i2c_cr2_freq_values.I2C_CR2_FREQ_42MHZ;

/* --- I2Cx_OAR1 values ---------------------------------------------------- */

/* ADDMODE: Addressing mode (slave mode) */
enum I2C_OAR1_ADDMODE = 1 << 15;
enum I2C_OAR1_ADDMODE_7BIT = 0;
enum I2C_OAR1_ADDMODE_10BIT = 1;

/* Note: Bit 14 should always be kept at 1 by software! */

/* Note: Bits [13:10] are reserved, and forced to 0 by hardware. */

/* ADD: Address bits: [7:1] in 7-bit mode, bits [9:0] in 10-bit mode */

/* --- I2Cx_OAR2 values ---------------------------------------------------- */

/* Note: Bits [15:8] are reserved, and forced to 0 by hardware. */

/* ADD2[7:1]: Interface address (bits [7:1] in dual addressing mode) */

/* ENDUAL: Dual addressing mode enable */
enum I2C_OAR2_ENDUAL = 1 << 0;

/* --- I2Cx_DR values ------------------------------------------------------ */

/* Note: Bits [15:8] are reserved, and forced to 0 by hardware. */

/* DR[7:0] 8-bit data register */

/* --- I2Cx_SR1 values ----------------------------------------------------- */

/* SMBALERT: SMBus alert */
enum I2C_SR1_SMBALERT = 1 << 15;

/* TIMEOUT: Timeout or Tlow Error */
enum I2C_SR1_TIMEOUT = 1 << 14;

/* Note: Bit 13 is reserved, and forced to 0 by hardware. */

/* PECERR: PEC Error in reception */
enum I2C_SR1_PECERR = 1 << 12;

/* OVR: Overrun/Underrun */
enum I2C_SR1_OVR = 1 << 11;

/* AF: Acknowledge failure */
enum I2C_SR1_AF = 1 << 10;

/* ARLO: Arbitration lost (master mode) */
enum I2C_SR1_ARLO = 1 << 9;

/* BERR: Bus error */
enum I2C_SR1_BERR = 1 << 8;

/* TxE: Data register empty (transmitters) */
enum I2C_SR1_TxE = 1 << 7;

/* RxNE: Data register not empty (receivers) */
enum I2C_SR1_RxNE = 1 << 6;

/* Note: Bit 5 is reserved, and forced to 0 by hardware. */

/* STOPF: STOP detection (slave mode) */
enum I2C_SR1_STOPF = 1 << 4;

/* ADD10: 10-bit header sent (master mode) */
enum I2C_SR1_ADD10 = 1 << 3;

/* BTF: Byte transfer finished */
enum I2C_SR1_BTF = 1 << 2;

/* ADDR: Address sent (master mode) / address matched (slave mode) */
enum I2C_SR1_ADDR = 1 << 1;

/* SB: Start bit (master mode) */
enum I2C_SR1_SB = 1 << 0;

/* --- I2Cx_SR2 values ----------------------------------------------------- */

/* Bits [15:8]: PEC[7:0]: Packet error checking register */

/* DUALF: Dual flag (slave mode) */
enum I2C_SR2_DUALF = 1 << 7;

/* SMBHOST: SMBus host header (slave mode) */
enum I2C_SR2_SMBHOST = 1 << 6;

/* SMBDEFAULT: SMBus device default address (slave mode) */
enum I2C_SR2_SMBDEFAULT = 1 << 5;

/* GENCALL: General call address (slave mode) */
enum I2C_SR2_GENCALL = 1 << 4;

/* Note: Bit 3 is reserved, and forced to 0 by hardware. */

/* TRA: Transmitter / receiver */
enum I2C_SR2_TRA = 1 << 2;

/* BUSY: Bus busy */
enum I2C_SR2_BUSY = 1 << 1;

/* MSL: Master / slave */
enum I2C_SR2_MSL = 1 << 0;

/* --- I2Cx_CCR values ----------------------------------------------------- */

/* F/S: I2C Master mode selection (fast / standard) */
enum I2C_CCR_FS = 1 << 15;

/* DUTY: Fast Mode Duty Cycle */
/** @defgroup i2c_duty_cycle I2C peripheral clock duty cycles
@ingroup i2c_defines

@{*/
enum I2C_CCR_DUTY = 1 << 14;
enum I2C_CCR_DUTY_DIV2 = 0;
enum I2C_CCR_DUTY_16_DIV_9 = 1;
/**@}*/

/* Note: Bits [13:12] are reserved, and forced to 0 by hardware. */

/*
 * Bits [11:0]:
 * CCR[11:0]: Clock control register in Fast/Standard mode (master mode)
 */

/* --- I2Cx_TRISE values --------------------------------------------------- */

/* Note: Bits [15:6] are reserved, and forced to 0 by hardware. */

/*
 * Bits [5:0]:
 * TRISE[5:0]: Maximum rise time in Fast/Standard mode (master mode)
 */

/* --- I2C constant definitions -------------------------------------------- */

/****************************************************************************/
/** @defgroup i2c_rw I2C Read/Write bit
@ingroup i2c_defines

@{*/
enum I2C_WRITE = 0;
enum I2C_READ = 1;
/**@}*/

/* --- I2C function prototypes---------------------------------------------- */

/**
 * I2C speed modes.
 */
enum i2c_speeds
{
    i2c_speed_sm_100k = 0,
    i2c_speed_fm_400k = 1,
    i2c_speed_fmp_1m = 2,
    i2c_speed_unknown = 3
}

alias i2c_speed_sm_100k = i2c_speeds.i2c_speed_sm_100k;
alias i2c_speed_fm_400k = i2c_speeds.i2c_speed_fm_400k;
alias i2c_speed_fmp_1m = i2c_speeds.i2c_speed_fmp_1m;
alias i2c_speed_unknown = i2c_speeds.i2c_speed_unknown;

extern (C) {

void i2c_peripheral_enable (uint i2c);
void i2c_peripheral_disable (uint i2c);
void i2c_send_start (uint i2c);
void i2c_send_stop (uint i2c);
void i2c_clear_stop (uint i2c);
void i2c_set_own_7bit_slave_address (uint i2c, ubyte slave);
void i2c_set_own_10bit_slave_address (uint i2c, ushort slave);
void i2c_set_own_7bit_slave_address_two (uint i2c, ubyte slave);
void i2c_enable_dual_addressing_mode (uint i2c);
void i2c_disable_dual_addressing_mode (uint i2c);
void i2c_set_clock_frequency (uint i2c, ubyte freq);
void i2c_send_data (uint i2c, ubyte data);
void i2c_set_fast_mode (uint i2c);
void i2c_set_standard_mode (uint i2c);
void i2c_set_ccr (uint i2c, ushort freq);
void i2c_set_trise (uint i2c, ushort trise);
void i2c_send_7bit_address (uint i2c, ubyte slave, ubyte readwrite);
ubyte i2c_get_data (uint i2c);
void i2c_enable_interrupt (uint i2c, uint interrupt);
void i2c_disable_interrupt (uint i2c, uint interrupt);
void i2c_enable_ack (uint i2c);
void i2c_disable_ack (uint i2c);
void i2c_nack_next (uint i2c);
void i2c_nack_current (uint i2c);
void i2c_set_dutycycle (uint i2c, uint dutycycle);
void i2c_enable_dma (uint i2c);
void i2c_disable_dma (uint i2c);
void i2c_set_dma_last_transfer (uint i2c);
void i2c_clear_dma_last_transfer (uint i2c);
void i2c_transfer7 (uint i2c, ubyte addr, const(ubyte)* w, size_t wn, ubyte* r, size_t rn);
void i2c_set_speed (uint i2c, i2c_speeds speed, uint clock_megahz);

}

/** @cond */

/** @endcond */
/**@}*/

