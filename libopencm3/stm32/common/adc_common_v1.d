module libopencm3.stm32.common.adc_common_v1.d;

public import libopencm3.cm3.common;
public import libopencm3.stm32.memorymap;

/* --- Convenience macros -------------------------------------------------- */

/* ADC port base addresses (for convenience) */
/****************************************************************************/
/** @defgroup adc_reg_base ADC register base addresses
@ingroup STM32xx_adc_defines

@{*/
enum ADC1 = ADC1_BASE;
/**@}*/

/* --- ADC registers ------------------------------------------------------- */

/* ADC status register (ADC_SR) */
enum ADC_SR(uint block) = MMIO32!(block + 0x00);
// extern (D) auto ADC_SR(T)(auto ref T block)
// {
//     return MMIO32(block + 0x00);
// }

/* ADC control register 1 (ADC_CR1) */
enum ADC_CR1(uint block) = MMIO32!(block + 0x04);
// extern (D) auto ADC_CR1(T)(auto ref T block)
// {
//     return MMIO32(block + 0x04);
// }

/* ADC control register 2 (ADC_CR2) */
enum ADC_CR2(uint block) = MMIO32!(block + 0x08);
// extern (D) auto ADC_CR2(T)(auto ref T block)
// {
//     return MMIO32(block + 0x08);
// }

/* ADC sample time register 1 (ADC_SMPR1) */
enum ADC_SMPR1(uint block) = MMIO32!(block + 0x0c);
// extern (D) auto ADC_SMPR1(T)(auto ref T block)
// {
//     return MMIO32(block + 0x0c);
// }

/* ADC sample time register 2 (ADC_SMPR2) */
enum ADC_SMPR2(uint block) = MMIO32!(block + 0x10);
// extern (D) auto ADC_SMPR2(T)(auto ref T block)
// {
//     return MMIO32(block + 0x10);
// }

/* ADC injected channel data offset register x (ADC_JOFRx) (x=1..4) */
enum ADC_JOFR1(uint block) = MMIO32!(block + 0x14);
// extern (D) auto ADC_JOFR1(T)(auto ref T block)
// {
//     return MMIO32(block + 0x14);
// }

enum ADC_JOFR2(uint block) = MMIO32!(block + 0x18);
//extern (D) auto ADC_JOFR2(T)(auto ref T block)
// {
//     return MMIO32(block + 0x18);
// }

enum ADC_JOFR3(uint block) = MMIO32!(block + 0x1c);
// extern (D) auto ADC_JOFR3(T)(auto ref T block)
// {
//     return MMIO32(block + 0x1c);
// }

enum ADC_JOFR4(uint block) = MMIO32!(block + 0x20);
// extern (D) auto ADC_JOFR4(T)(auto ref T block)
// {
//     return MMIO32(block + 0x20);
// }

/* ADC watchdog high threshold register (ADC_HTR) */
enum ADC_HTR(uint block) = MMIO32!(block + 0x24);
// extern (D) auto ADC_HTR(T)(auto ref T block)
// {
//     return MMIO32(block + 0x24);
// }

/* ADC watchdog low threshold register (ADC_LTR) */
enum ADC_LTR(uint block) = MMIO32!(block + 0x28);
// extern (D) auto ADC_LTR(T)(auto ref T block)
// {
//     return MMIO32(block + 0x28);
// }

/* ADC regular sequence register 1 (ADC_SQR1) */
enum ADC_SQR1(uint block) = MMIO32!(block + 0x2c);
// extern (D) auto ADC_SQR1(T)(auto ref T block)
// {
//     return MMIO32(block + 0x2c);
// }

/* ADC regular sequence register 2 (ADC_SQR2) */
enum ADC_SQR2(uint block) = MMIO32!(block + 0x30);
// extern (D) auto ADC_SQR2(T)(auto ref T block)
// {
//     return MMIO32(block + 0x30);
// }

/* ADC regular sequence register 3 (ADC_SQR3) */
enum ADC_SQR3(uint block) = MMIO32!(block + 0x34);
// extern (D) auto ADC_SQR3(T)(auto ref T block)
// {
//     return MMIO32(block + 0x34);
// }

/* ADC injected sequence register (ADC_JSQR) */
enum ADC_JSQR(uint block) = MMIO32!(block + 0x38);
// extern (D) auto ADC_JSQR(T)(auto ref T block)
// {
//     return MMIO32(block + 0x38);
// }

/* ADC injected data register x (ADC_JDRx) (x=1..4) */
enum ADC_JDR1(uint block) = MMIO32!(block + 0x3c);
// extern (D) auto ADC_JDR1(T)(auto ref T block)
// {
//     return MMIO32(block + 0x3c);
// }

enum ADC_JDR2(uint block) = MMIO32!(block + 0x40);
// extern (D) auto ADC_JDR2(T)(auto ref T block)
// {
//     return MMIO32(block + 0x40);
// }

enum ADC_JDR3(uint block) = MMIO32!(block + 0x44);
// extern (D) auto ADC_JDR3(T)(auto ref T block)
// {
//     return MMIO32(block + 0x44);
// }

enum ADC_JDR4(uint block) = MMIO32!(block + 0x48);
// extern (D) auto ADC_JDR4(T)(auto ref T block)
// {
//     return MMIO32(block + 0x48);
// }

/* ADC regular data register (ADC_DR) */
enum ADC_DR(uint block) = MMIO32!(block + 0x4c);
// extern (D) auto ADC_DR(T)(auto ref T block)
// {
//     return MMIO32(block + 0x4c);
// }

enum ADC1_SR = ADC_SR!(ADC1);
enum ADC1_CR1 = ADC_CR1!(ADC1);
enum ADC1_CR2 = ADC_CR2!(ADC1);
enum ADC1_SMPR1 = ADC_SMPR1!(ADC1);
enum ADC1_SMPR2 = ADC_SMPR2!(ADC1);

enum ADC1_JOFR1 = ADC_JOFR1!(ADC1);
enum ADC1_JOFR2 = ADC_JOFR2!(ADC1);
enum ADC1_JOFR3 = ADC_JOFR3!(ADC1);
enum ADC1_JOFR4 = ADC_JOFR4!(ADC1);

enum ADC1_HTR = ADC_HTR!(ADC1);
enum ADC1_LTR = ADC_LTR!(ADC1);

enum ADC1_SQR1 = ADC_SQR1!(ADC1);
enum ADC1_SQR2 = ADC_SQR2!(ADC1);
enum ADC1_SQR3 = ADC_SQR3!(ADC1);
enum ADC1_JSQR = ADC_JSQR!(ADC1);

enum ADC1_JDR1 = ADC_JDR1!(ADC1);
enum ADC1_JDR2 = ADC_JDR2!(ADC1);
enum ADC1_JDR3 = ADC_JDR3!(ADC1);
enum ADC1_JDR4 = ADC_JDR4!(ADC1);
enum ADC1_DR = ADC_DR!(ADC1);

enum ADC2 = ADC2_BASE;
enum ADC2_SR = ADC_SR!(ADC2);
enum ADC2_CR1 = ADC_CR1!(ADC2);
enum ADC2_CR2 = ADC_CR2!(ADC2);
enum ADC2_SMPR1 = ADC_SMPR1!(ADC2);
enum ADC2_SMPR2 = ADC_SMPR2!(ADC2);

enum ADC2_JOFR1 = ADC_JOFR1!(ADC2);
enum ADC2_JOFR2 = ADC_JOFR2!(ADC2);
enum ADC2_JOFR3 = ADC_JOFR3!(ADC2);
enum ADC2_JOFR4 = ADC_JOFR4!(ADC2);

/* ADC watchdog high threshold register (ADC_HTR) */
enum ADC2_HTR = ADC_HTR!(ADC2);
/* ADC watchdog low threshold register (ADC_LTR) */
enum ADC2_LTR = ADC_LTR!(ADC2);

/* ADC regular sequence register 1 (ADC_SQR1) */
enum ADC2_SQR1 = ADC_SQR1!(ADC2);
/* ADC regular sequence register 2 (ADC_SQR2) */
enum ADC2_SQR2 = ADC_SQR2!(ADC2);
/* ADC regular sequence register 3 (ADC_SQR3) */
enum ADC2_SQR3 = ADC_SQR3!(ADC2);
/* ADC injected sequence register (ADC_JSQR) */
enum ADC2_JSQR = ADC_JSQR!(ADC2);

/* ADC injected data register x (ADC_JDRx) (x=1..4) */
enum ADC2_JDR1 = ADC_JDR1!(ADC2);
enum ADC2_JDR2 = ADC_JDR2!(ADC2);
enum ADC2_JDR3 = ADC_JDR3!(ADC2);
enum ADC2_JDR4 = ADC_JDR4!(ADC2);
/* ADC regular data register (ADC_DR) */
enum ADC2_DR = ADC_DR!(ADC2);

enum ADC3 = ADC3_BASE;
enum ADC3_SR = ADC_SR!(ADC3);
enum ADC3_CR1 = ADC_CR1!(ADC3);
enum ADC3_CR2 = ADC_CR2!(ADC3);
enum ADC3_SMPR1 = ADC_SMPR1!(ADC3);
enum ADC3_SMPR2 = ADC_SMPR2!(ADC3);

enum ADC3_JOFR1 = ADC_JOFR1!(ADC3);
enum ADC3_JOFR2 = ADC_JOFR2!(ADC3);
enum ADC3_JOFR3 = ADC_JOFR3!(ADC3);
enum ADC3_JOFR4 = ADC_JOFR4!(ADC3);

enum ADC3_HTR = ADC_HTR!(ADC3);
enum ADC3_LTR = ADC_LTR!(ADC3);

enum ADC3_SQR1 = ADC_SQR1!(ADC3);
enum ADC3_SQR2 = ADC_SQR2!(ADC3);
enum ADC3_SQR3 = ADC_SQR3!(ADC3);
enum ADC3_JSQR = ADC_JSQR!(ADC3);

enum ADC3_JDR1 = ADC_JDR1!(ADC3);
enum ADC3_JDR2 = ADC_JDR2!(ADC3);
enum ADC3_JDR3 = ADC_JDR3!(ADC3);
enum ADC3_JDR4 = ADC_JDR4!(ADC3);
enum ADC3_DR = ADC_DR!(ADC3);

/* --- ADC Channels ------------------------------------------------------- */

/****************************************************************************/
/** @defgroup adc_channel ADC Channel Numbers
@ingroup STM32xx_adc_defines

@{*/
enum ADC_CHANNEL0 = 0x00;
enum ADC_CHANNEL1 = 0x01;
enum ADC_CHANNEL2 = 0x02;
enum ADC_CHANNEL3 = 0x03;
enum ADC_CHANNEL4 = 0x04;
enum ADC_CHANNEL5 = 0x05;
enum ADC_CHANNEL6 = 0x06;
enum ADC_CHANNEL7 = 0x07;
enum ADC_CHANNEL8 = 0x08;
enum ADC_CHANNEL9 = 0x09;
enum ADC_CHANNEL10 = 0x0A;
enum ADC_CHANNEL11 = 0x0B;
enum ADC_CHANNEL12 = 0x0C;
enum ADC_CHANNEL13 = 0x0D;
enum ADC_CHANNEL14 = 0x0E;
enum ADC_CHANNEL15 = 0x0F;
enum ADC_CHANNEL16 = 0x10;
enum ADC_CHANNEL17 = 0x11;
enum ADC_CHANNEL18 = 0x12;
/**@}*/
enum ADC_CHANNEL_MASK = 0x1F;

/* --- ADC_SR values ------------------------------------------------------- */
/****************************************************************************/
/** @defgroup adc_sr_values ADC Status Register Flags
@ingroup STM32xx_adc_defines

@{*/

/* STRT:*/ /** Regular channel Start flag */
enum ADC_SR_STRT = 1 << 4;

/* JSTRT:*/ /** Injected channel Start flag */
enum ADC_SR_JSTRT = 1 << 3;

/* JEOC:*/ /** Injected channel end of conversion */
enum ADC_SR_JEOC = 1 << 2;

/* EOC:*/ /** End of conversion */
enum ADC_SR_EOC = 1 << 1;

/* AWD:*/ /** Analog watchdog flag */
enum ADC_SR_AWD = 1 << 0;
/**@}*/

/* --- ADC_CR1 values ------------------------------------------------------ */

/* AWDEN: Analog watchdog enable on regular channels */
enum ADC_CR1_AWDEN = 1 << 23;

/* JAWDEN: Analog watchdog enable on injected channels */
enum ADC_CR1_JAWDEN = 1 << 22;

/* Note: Bits [21:20] are reserved, and must be kept at reset value. */

/* DISCNUM[2:0]: Discontinuous mode channel count. */
/****************************************************************************/
/** @defgroup adc_cr1_discnum ADC Number of channels in discontinuous mode.
@ingroup STM32_adc_defines

@{*/
enum ADC_CR1_DISCNUM_1CHANNELS = 0x0 << 13;
enum ADC_CR1_DISCNUM_2CHANNELS = 0x1 << 13;
enum ADC_CR1_DISCNUM_3CHANNELS = 0x2 << 13;
enum ADC_CR1_DISCNUM_4CHANNELS = 0x3 << 13;
enum ADC_CR1_DISCNUM_5CHANNELS = 0x4 << 13;
enum ADC_CR1_DISCNUM_6CHANNELS = 0x5 << 13;
enum ADC_CR1_DISCNUM_7CHANNELS = 0x6 << 13;
enum ADC_CR1_DISCNUM_8CHANNELS = 0x7 << 13;
/**@}*/
enum ADC_CR1_DISCNUM_MASK = 0x7 << 13;
enum ADC_CR1_DISCNUM_SHIFT = 13;

/* JDISCEN: */ /** Discontinuous mode on injected channels. */
enum ADC_CR1_JDISCEN = 1 << 12;

/* DISCEN: */ /** Discontinuous mode on regular channels. */
enum ADC_CR1_DISCEN = 1 << 11;

/* JAUTO: */ /** Automatic Injection Group conversion. */
enum ADC_CR1_JAUTO = 1 << 10;

/* AWDSGL: */ /** Enable the watchdog on a single channel in scan mode. */
enum ADC_CR1_AWDSGL = 1 << 9;

/* SCAN: */ /** Scan mode. */
enum ADC_CR1_SCAN = 1 << 8;

/* JEOCIE: */ /** Interrupt enable for injected channels. */
enum ADC_CR1_JEOCIE = 1 << 7;

/* AWDIE: */ /** Analog watchdog interrupt enable. */
enum ADC_CR1_AWDIE = 1 << 6;

/* EOCIE: */ /** Interrupt enable EOC. */
enum ADC_CR1_EOCIE = 1 << 5;

/* AWDCH[4:0]: Analog watchdog channel bits. (Up to 17 other values reserved) */
/* Notes: Depending on part, and ADC peripheral, some channels are connected
 * to V_SS, or to temperature/reference/battery inputs
 */
/****************************************************************************/
/* ADC_CR1 AWDCH[4:0] ADC watchdog channel */
/** @defgroup adc_watchdog_channel ADC watchdog channel
@ingroup STM32xx_adc_defines

@{*/
enum ADC_CR1_AWDCH_CHANNEL0 = 0x00 << 0;
enum ADC_CR1_AWDCH_CHANNEL1 = 0x01 << 0;
enum ADC_CR1_AWDCH_CHANNEL2 = 0x02 << 0;
enum ADC_CR1_AWDCH_CHANNEL3 = 0x03 << 0;
enum ADC_CR1_AWDCH_CHANNEL4 = 0x04 << 0;
enum ADC_CR1_AWDCH_CHANNEL5 = 0x05 << 0;
enum ADC_CR1_AWDCH_CHANNEL6 = 0x06 << 0;
enum ADC_CR1_AWDCH_CHANNEL7 = 0x07 << 0;
enum ADC_CR1_AWDCH_CHANNEL8 = 0x08 << 0;
enum ADC_CR1_AWDCH_CHANNEL9 = 0x09 << 0;
enum ADC_CR1_AWDCH_CHANNEL10 = 0x0A << 0;
enum ADC_CR1_AWDCH_CHANNEL11 = 0x0B << 0;
enum ADC_CR1_AWDCH_CHANNEL12 = 0x0C << 0;
enum ADC_CR1_AWDCH_CHANNEL13 = 0x0D << 0;
enum ADC_CR1_AWDCH_CHANNEL14 = 0x0E << 0;
enum ADC_CR1_AWDCH_CHANNEL15 = 0x0F << 0;
enum ADC_CR1_AWDCH_CHANNEL16 = 0x10 << 0;
enum ADC_CR1_AWDCH_CHANNEL17 = 0x11 << 0;
/**@}*/
enum ADC_CR1_AWDCH_MASK = 0x1F << 0;
enum ADC_CR1_AWDCH_SHIFT = 0;

/* --- ADC_CR2 values ------------------------------------------------------ */

/* ALIGN: Data alignement. */
enum ADC_CR2_ALIGN_RIGHT = 0 << 11;
enum ADC_CR2_ALIGN_LEFT = 1 << 11;
enum ADC_CR2_ALIGN = 1 << 11;

/* DMA: Direct memory access mode. (ADC1 and ADC3 only!) */
enum ADC_CR2_DMA = 1 << 8;

/* CONT: Continuous conversion. */
enum ADC_CR2_CONT = 1 << 1;

/* ADON: A/D converter On/Off. */
/* Note: If any other bit in this register apart from ADON is changed at the
 * same time, then conversion is not triggered. This is to prevent triggering
 * an erroneous conversion.
 * Conclusion: Must be separately written.
 */
enum ADC_CR2_ADON = 1 << 0;

/* --- ADC_JOFRx, ADC_HTR, ADC_LTR values ---------------------------------- */

enum ADC_JOFFSET_LSB = 0;
enum ADC_JOFFSET_MSK = 0xfff;
enum ADC_HT_LSB = 0;
enum ADC_HT_MSK = 0xfff;
enum ADC_LT_LSB = 0;
enum ADC_LT_MSK = 0xfff;

/* --- ADC_SQR1 values ----------------------------------------------------- */
/* The sequence length field is always in the same place, but sized
 * differently on various parts */
enum ADC_SQR1_L_LSB = 20;

/* --- ADC_JSQR values ----------------------------------------------------- */
enum ADC_JSQR_JL_LSB = 20;
enum ADC_JSQR_JSQ4_LSB = 15;
enum ADC_JSQR_JSQ3_LSB = 10;
enum ADC_JSQR_JSQ2_LSB = 5;
enum ADC_JSQR_JSQ1_LSB = 0;

/* JL[2:0]: Discontinous mode channel count injected channels. */
/****************************************************************************/
/** @defgroup adc_jsqr_jl ADC Number of channels in discontinuous injected mode
@ingroup STM32xx_adc_defines

@{*/
enum ADC_JSQR_JL_1CHANNELS = 0x0 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JL_2CHANNELS = 0x1 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JL_3CHANNELS = 0x2 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JL_4CHANNELS = 0x3 << ADC_JSQR_JL_LSB;
/**@}*/
enum ADC_JSQR_JL_MSK = 0x2 << ADC_JSQR_JL_LSB;
enum ADC_JSQR_JSQ4_MSK = 0x1f << ADC_JSQR_JSQ4_LSB;
enum ADC_JSQR_JSQ3_MSK = 0x1f << ADC_JSQR_JSQ3_LSB;
enum ADC_JSQR_JSQ2_MSK = 0x1f << ADC_JSQR_JSQ2_LSB;
enum ADC_JSQR_JSQ1_MSK = 0x1f << ADC_JSQR_JSQ1_LSB;

extern (D) auto ADC_JSQR_JSQ_VAL(T0, T1)(auto ref T0 n, auto ref T1 val)
{
    return val << ((n - 1) * 5);
}

extern (D) auto ADC_JSQR_JL_VAL(T)(auto ref T val)
{
    return (val - 1) << ADC_JSQR_JL_LSB;
}

/* --- Function prototypes ------------------------------------------------- */
extern(C) {
void adc_power_on (uint adc);
void adc_power_off (uint adc);
void adc_enable_analog_watchdog_regular (uint adc);
void adc_disable_analog_watchdog_regular (uint adc);
void adc_enable_analog_watchdog_injected (uint adc);
void adc_disable_analog_watchdog_injected (uint adc);
void adc_enable_discontinuous_mode_regular (uint adc, ubyte length);
void adc_disable_discontinuous_mode_regular (uint adc);
void adc_enable_discontinuous_mode_injected (uint adc);
void adc_disable_discontinuous_mode_injected (uint adc);
void adc_enable_automatic_injected_group_conversion (uint adc);
void adc_disable_automatic_injected_group_conversion (uint adc);
void adc_enable_analog_watchdog_on_all_channels (uint adc);
void adc_enable_analog_watchdog_on_selected_channel (uint adc, ubyte channel);
void adc_enable_scan_mode (uint adc);
void adc_disable_scan_mode (uint adc);
void adc_enable_eoc_interrupt_injected (uint adc);
void adc_disable_eoc_interrupt_injected (uint adc);
void adc_enable_awd_interrupt (uint adc);
void adc_disable_awd_interrupt (uint adc);
void adc_enable_eoc_interrupt (uint adc);
void adc_disable_eoc_interrupt (uint adc);
void adc_set_left_aligned (uint adc);
void adc_set_right_aligned (uint adc);
bool adc_eoc (uint adc);
bool adc_eoc_injected (uint adc);
uint adc_read_regular (uint adc);
uint adc_read_injected (uint adc, ubyte reg);
void adc_set_continuous_conversion_mode (uint adc);
void adc_set_single_conversion_mode (uint adc);
void adc_set_regular_sequence (uint adc, ubyte length, ubyte* channel);
void adc_set_injected_sequence (uint adc, ubyte length, ubyte* channel);
void adc_set_injected_offset (uint adc, ubyte reg, uint offset);
void adc_set_watchdog_high_threshold (uint adc, ushort threshold);
void adc_set_watchdog_low_threshold (uint adc, ushort threshold);
void adc_start_conversion_regular (uint adc);
void adc_start_conversion_injected (uint adc);
void adc_enable_dma (uint adc);
void adc_disable_dma (uint adc);
bool adc_get_flag (uint adc, uint flag);
void adc_clear_flag (uint adc, uint flag);

/* common methods that have slight differences */
void adc_set_sample_time (uint adc, ubyte channel, ubyte time);
void adc_set_sample_time_on_all_channels (uint adc, ubyte time);
void adc_disable_external_trigger_regular (uint adc);
void adc_disable_external_trigger_injected (uint adc);
}
/** @cond */

/** @endcond */
/**@}*/

