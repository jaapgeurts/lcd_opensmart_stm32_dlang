module libopencm3.stm32.common.adc_common_v1_multi;


public import libopencm3.stm32.common.adc_common_v1;

/* --- Convenience macros -------------------------------------------------- */

/* ADC common (shared) registers */
enum ADC_COMMON_REGISTERS_BASE = ADC1_BASE + 0x300;
enum ADC_CSR = MMIO32!(ADC_COMMON_REGISTERS_BASE + 0x0);
enum ADC_CCR = MMIO32!(ADC_COMMON_REGISTERS_BASE + 0x4);
enum ADC_CDR = MMIO32!(ADC_COMMON_REGISTERS_BASE + 0x8);

/* --- ADC Channels ------------------------------------------------------- */

/* --- ADC_SR values ------------------------------------------------------- */

/** @defgroup adc_sr_values ADC Status Register Flags
 * @ingroup adc_defines
 *@{*/

/* OVR:*/ /** Overrun */
enum ADC_SR_OVR = 1 << 5;
/**@}*/

/* OVRIE: Overrun interrupt enable */
enum ADC_CR1_OVRIE = 1 << 26;

/* RES[1:0]: Resolution */
/****************************************************************************/
/** @defgroup adc_cr1_res ADC Resolution.
@ingroup adc_defines

@{*/
enum ADC_CR1_RES_12BIT = 0x0 << 24;
enum ADC_CR1_RES_10BIT = 0x1 << 24;
enum ADC_CR1_RES_8BIT = 0x2 << 24;
enum ADC_CR1_RES_6BIT = 0x3 << 24;
/**@}*/
enum ADC_CR1_RES_MASK = 0x3 << 24;
enum ADC_CR1_RES_SHIFT = 24;

/* Note: Bits [21:16] are reserved, and must be kept at reset value. */

/* --- ADC_CR2 values ------------------------------------------------------ */

/* SWSTART: Start conversion of regular channels. */
enum ADC_CR2_SWSTART = 1 << 30;

/* EXTEN[1:0]: External trigger enable for regular channels. */
/****************************************************************************/
enum ADC_CR2_EXTEN_SHIFT = 28;
enum ADC_CR2_EXTEN_MASK = 0x3 << ADC_CR2_EXTEN_SHIFT;
/** @defgroup adc_trigger_polarity_regular ADC Trigger Polarity
@ingroup adc_defines
@{*/
enum ADC_CR2_EXTEN_DISABLED = 0x0 << ADC_CR2_EXTEN_SHIFT;
enum ADC_CR2_EXTEN_RISING_EDGE = 0x1 << ADC_CR2_EXTEN_SHIFT;
enum ADC_CR2_EXTEN_FALLING_EDGE = 0x2 << ADC_CR2_EXTEN_SHIFT;
enum ADC_CR2_EXTEN_BOTH_EDGES = 0x3 << ADC_CR2_EXTEN_SHIFT;
/**@}*/

/* EXTSEL[3:0]: External event selection for regular group. */
/****************************************************************************/
/* Note: Selection values are family-dependent. */
enum ADC_CR2_EXTSEL_MASK = 0xF << 24;
enum ADC_CR2_EXTSEL_SHIFT = 24;

/* Bit 23 is reserved */

/* JSWSTART: Start conversion of injected channels. */
enum ADC_CR2_JSWSTART = 1 << 22;

/* JEXTEN[1:0]: External trigger enable for injected channels. */
/****************************************************************************/
enum ADC_CR2_JEXTEN_SHIFT = 20;
enum ADC_CR2_JEXTEN_MASK = 0x3 << ADC_CR2_JEXTEN_SHIFT;
/** @defgroup adc_trigger_polarity_injected ADC Injected Trigger Polarity
@ingroup adc_defines
@{*/
enum ADC_CR2_JEXTEN_DISABLED = 0x0 << ADC_CR2_JEXTEN_SHIFT;
enum ADC_CR2_JEXTEN_RISING_EDGE = 0x1 << ADC_CR2_JEXTEN_SHIFT;
enum ADC_CR2_JEXTEN_FALLING_EDGE = 0x2 << ADC_CR2_JEXTEN_SHIFT;
enum ADC_CR2_JEXTEN_BOTH_EDGES = 0x3 << ADC_CR2_JEXTEN_SHIFT;
/**@}*/

/* JEXTSEL[3:0]: External event selection for injected group. */
/****************************************************************************/
/* Note: Selection values are family-dependent. */
enum ADC_CR2_JEXTSEL_SHIFT = 16;
enum ADC_CR2_JEXTSEL_MASK = 0xF << ADC_CR2_JEXTSEL_SHIFT;

/* ALIGN: Data alignement. */
enum ADC_CR2_ALIGN_RIGHT = 0 << 11;
enum ADC_CR2_ALIGN_LEFT = 1 << 11;
enum ADC_CR2_ALIGN = 1 << 11;

/* EOCS: End of conversion selection. */
enum ADC_CR2_EOCS = 1 << 10;

/* DDS: DMA disable selection */
enum ADC_CR2_DDS = 1 << 9;

/* DMA: Direct memory access mode. (ADC1 and ADC3 only!) */
enum ADC_CR2_DMA = 1 << 8;

/* Note: Bits [7:2] are reserved and must be kept at reset value. */

/* CONT: Continuous conversion. */
enum ADC_CR2_CONT = 1 << 1;

/* ADON: A/D converter On/Off. */
/* Note: If any other bit in this register apart from ADON is changed at the
 * same time, then conversion is not triggered. This is to prevent triggering
 * an erroneous conversion.
 * Conclusion: Must be separately written.
 */
enum ADC_CR2_ADON = 1 << 0;

/* --- ADC_SMPRx values --------------------------------------------------- */
/****************************************************************************/

enum ADC_SQRx_MASK = 0x1f;

/* --- ADC_JDRx, ADC_DR values --------------------------------------------- */

enum ADC_JDATA_LSB = 0;
enum ADC_DATA_LSB = 0;
enum ADC_JDATA_MSK = 0xffff << ADC_JDATA_LSB;
// TODO: ADC_DA is unknown
//enum ADC_DATA_MSK = 0xffff << ADC_DA;

/* --- Common Registers ---------------------------------------------------- */

/* --- ADC_CSR values (read only images) ------------------------------------ */

/* OVR3: Overrun ADC3. */
enum ADC_CSR_OVR3 = 1 << 21;

/* STRT3: Regular channel start ADC3. */
enum ADC_CSR_STRT3 = 1 << 20;

/* JSTRT3: Injected channel start ADC3. */
enum ADC_CSR_JSTRT3 = 1 << 19;

/* JEOC3: Injected channel end of conversion ADC3. */
enum ADC_CSR_JEOC3 = 1 << 18;

/* EOC3: Regular channel end of conversion ADC3. */
enum ADC_CSR_EOC3 = 1 << 17;

/* EOC3: Regular channel end of conversion ADC3. */
enum ADC_CSR_AWD3 = 1 << 16;

/* Bits 15:14 Reserved, must be kept at reset value */

/* OVR2: Overrun ADC2. */
enum ADC_CSR_OVR2 = 1 << 13;

/* STRT2: Regular channel start ADC2. */
enum ADC_CSR_STRT2 = 1 << 12;

/* JSTRT2: Injected channel start ADC2. */
enum ADC_CSR_JSTRT2 = 1 << 11;

/* JEOC2: Injected channel end of conversion ADC2. */
enum ADC_CSR_JEOC2 = 1 << 10;

/* EOC2: Regular channel end of conversion ADC2. */
enum ADC_CSR_EOC2 = 1 << 9;

/* EOC2: Regular channel end of conversion ADC2. */
enum ADC_CSR_AWD2 = 1 << 8;

/* Bits 7:6 Reserved, must be kept at reset value */

/* OVR1: Overrun ADC1. */
enum ADC_CSR_OVR1 = 1 << 5;

/* STRT1: Regular channel start ADC1. */
enum ADC_CSR_STRT1 = 1 << 4;

/* JSTRT1: Injected channel start ADC1. */
enum ADC_CSR_JSTRT1 = 1 << 3;

/* JEOC1: Injected channel end of conversion ADC1. */
enum ADC_CSR_JEOC1 = 1 << 2;

/* EOC1: Regular channel end of conversion ADC1. */
enum ADC_CSR_EOC1 = 1 << 1;

/* EOC1: Regular channel end of conversion ADC1. */
enum ADC_CSR_AWD1 = 1 << 0;

/* --- ADC_CCR values ------------------------------------------------------ */

/* TSVREFE: Temperature sensor and Vrefint enable. */
enum ADC_CCR_TSVREFE = 1 << 23;

/* VBATE: VBat enable. */
enum ADC_CCR_VBATE = 1 << 22;

/* Bit 18:21 reserved, must be kept at reset value. */

/* DMA: Direct memory access mode for multi ADC mode. */
/****************************************************************************/
/** @defgroup adc_dma_mode ADC DMA mode for multi ADC mode
@ingroup adc_defines

@{*/
enum ADC_CCR_DMA_DISABLE = 0x0 << 14;
enum ADC_CCR_DMA_MODE_1 = 0x1 << 14;
enum ADC_CCR_DMA_MODE_2 = 0x2 << 14;
enum ADC_CCR_DMA_MODE_3 = 0x3 << 14;
/**@}*/
enum ADC_CCR_DMA_MASK = 0x3 << 14;
enum ADC_CCR_DMA_SHIFT = 14;

/* DDS: DMA disable selection (for multi-ADC mode). */
enum ADC_CCR_DDS = 1 << 13;

/* Bit 12 reserved, must be kept at reset value */

/* DELAY: Delay between 2 sampling phases. */
/****************************************************************************/
/** @defgroup adc_delay ADC Delay between 2 sampling phases
@ingroup adc_defines

@{*/
enum ADC_CCR_DELAY_5ADCCLK = 0x0 << 8;
enum ADC_CCR_DELAY_6ADCCLK = 0x1 << 8;
enum ADC_CCR_DELAY_7ADCCLK = 0x2 << 8;
enum ADC_CCR_DELAY_8ADCCLK = 0x3 << 8;
enum ADC_CCR_DELAY_9ADCCLK = 0x4 << 8;
enum ADC_CCR_DELAY_10ADCCLK = 0x5 << 8;
enum ADC_CCR_DELAY_11ADCCLK = 0x6 << 8;
enum ADC_CCR_DELAY_12ADCCLK = 0x7 << 8;
enum ADC_CCR_DELAY_13ADCCLK = 0x8 << 8;
enum ADC_CCR_DELAY_14ADCCLK = 0x9 << 8;
enum ADC_CCR_DELAY_15ADCCLK = 0xa << 8;
enum ADC_CCR_DELAY_16ADCCLK = 0xb << 8;
enum ADC_CCR_DELAY_17ADCCLK = 0xc << 8;
enum ADC_CCR_DELAY_18ADCCLK = 0xd << 8;
enum ADC_CCR_DELAY_19ADCCLK = 0xe << 8;
enum ADC_CCR_DELAY_20ADCCLK = 0xf << 8;
/**@}*/
enum ADC_CCR_DELAY_MASK = 0xf << 8;
enum ADC_CCR_DELAY_SHIFT = 8;

/* Bit 7:5 reserved, must be kept at reset value */

/* MULTI: Multi ADC mode selection. */
/****************************************************************************/
/** @defgroup adc_multi_mode ADC Multi mode selection
@ingroup adc_defines

@{*/

/** All ADCs independent */
enum ADC_CCR_MULTI_INDEPENDENT = 0x00 << 0;

/* Dual modes (ADC1 + ADC2) */
/**
 * Dual modes (ADC1 + ADC2) Combined regular simultaneous +
 * injected simultaneous mode.
 */
enum ADC_CCR_MULTI_DUAL_REG_SIMUL_AND_INJECTED_SIMUL = 0x01 << 0;
/**
 * Dual modes (ADC1 + ADC2) Combined regular simultaneous +
 * alternate trigger mode.
 */
enum ADC_CCR_MULTI_DUAL_REG_SIMUL_AND_ALTERNATE_TRIG = 0x02 << 0;
/** Dual modes (ADC1 + ADC2) Injected simultaneous mode only. */
enum ADC_CCR_MULTI_DUAL_INJECTED_SIMUL = 0x05 << 0;
/** Dual modes (ADC1 + ADC2) Regular simultaneous mode only. */
enum ADC_CCR_MULTI_DUAL_REGULAR_SIMUL = 0x06 << 0;
/** Dual modes (ADC1 + ADC2) Interleaved mode only. */
enum ADC_CCR_MULTI_DUAL_INTERLEAVED = 0x07 << 0;
/** Dual modes (ADC1 + ADC2) Alternate trigger mode only. */
enum ADC_CCR_MULTI_DUAL_ALTERNATE_TRIG = 0x09 << 0;

/* Triple modes (ADC1 + ADC2 + ADC3) */
/**
 * Triple modes (ADC1 + ADC2 + ADC3) Combined regular simultaneous +
 * injected simultaneous mode.
 */
enum ADC_CCR_MULTI_TRIPLE_REG_SIMUL_AND_INJECTED_SIMUL = 0x11 << 0;
/**
 * Triple modes (ADC1 + ADC2 + ADC3) Combined regular simultaneous +
 * alternate trigger mode.
 */
enum ADC_CCR_MULTI_TRIPLE_REG_SIMUL_AND_ALTERNATE_TRIG = 0x12 << 0;
/** Triple modes (ADC1 + ADC2 + ADC3) Injected simultaneous mode only. */
enum ADC_CCR_MULTI_TRIPLE_INJECTED_SIMUL = 0x15 << 0;
/** Triple modes (ADC1 + ADC2 + ADC3) Regular simultaneous mode only. */
enum ADC_CCR_MULTI_TRIPLE_REGULAR_SIMUL = 0x16 << 0;
/** Triple modes (ADC1 + ADC2 + ADC3) Interleaved mode only. */
enum ADC_CCR_MULTI_TRIPLE_INTERLEAVED = 0x17 << 0;
/** Triple modes (ADC1 + ADC2 + ADC3) Alternate trigger mode only. */
enum ADC_CCR_MULTI_TRIPLE_ALTERNATE_TRIG = 0x19 << 0;
/**@}*/

enum ADC_CCR_MULTI_MASK = 0x1f << 0;
enum ADC_CCR_MULTI_SHIFT = 0;

/* --- ADC_CDR values ------------------------------------------------------ */

enum ADC_CDR_DATA2_MASK = 0xffff << 16;
enum ADC_CDR_DATA2_SHIFT = 16;

enum ADC_CDR_DATA1_MASK = 0xffff << 0;
enum ADC_CDR_DATA1_SHIFT = 0;

extern(C) {
void adc_set_clk_prescale (uint prescaler);
void adc_enable_external_trigger_regular (
    uint adc,
    uint trigger,
    uint polarity);
void adc_enable_external_trigger_injected (
    uint adc,
    uint trigger,
    uint polarity);
void adc_set_resolution (uint adc, uint resolution);
void adc_enable_overrun_interrupt (uint adc);
void adc_disable_overrun_interrupt (uint adc);
bool adc_get_overrun_flag (uint adc);
void adc_clear_overrun_flag (uint adc);
bool adc_awd (uint adc);
void adc_eoc_after_each (uint adc);
void adc_eoc_after_group (uint adc);
void adc_set_dma_continue (uint adc);
void adc_set_dma_terminate (uint adc);
void adc_enable_temperature_sensor ();
void adc_disable_temperature_sensor ();
}
/** @cond */

/** @endcond */
/**@}*/
