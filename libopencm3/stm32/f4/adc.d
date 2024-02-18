module libopencm3.stm32.f4.adc;

public import libopencm3.stm32.common.adc_common_v1_multi;



/** @defgroup adc_channel ADC Channel Numbers
 * @ingroup adc_defines
 * Thanks ST! F40x and F41x are on 16, F42x and F43x are on 18!
 *@{*/
enum ADC_CHANNEL_TEMP_F40 = 16;
enum ADC_CHANNEL_TEMP_F42 = 18;
enum ADC_CHANNEL_VREF = 17;
enum ADC_CHANNEL_VBAT = 18;
/**@}*/

/* --- ADC_CR1 values (note some of these are defined elsewhere) ----------- */
enum ADC_CR1_AWDCH_MAX = 18;

/* --- Convenience macros -------------------------------------------------- */
/* EXTSEL[3:0]: External event selection for regular group. */
/****************************************************************************/
/** @defgroup adc_trigger_regular ADC Trigger Identifier for Regular group
@ingroup adc_defines

@{*/
/** Timer 1 Compare Output 1 */
enum ADC_CR2_EXTSEL_TIM1_CC1 = 0x0 << 24;
/** Timer 1 Compare Output 2 */
enum ADC_CR2_EXTSEL_TIM1_CC2 = 0x1 << 24;
/** Timer 1 Compare Output 3 */
enum ADC_CR2_EXTSEL_TIM1_CC3 = 0x2 << 24;
/** Timer 2 Compare Output 2 */
enum ADC_CR2_EXTSEL_TIM2_CC2 = 0x3 << 24;
/** Timer 2 Compare Output 3 */
enum ADC_CR2_EXTSEL_TIM2_CC3 = 0x4 << 24;
/** Timer 2 Compare Output 4 */
enum ADC_CR2_EXTSEL_TIM2_CC4 = 0x5 << 24;
/** Timer 2 TRGO Event */
enum ADC_CR2_EXTSEL_TIM2_TRGO = 0x6 << 24;
/** Timer 3 Compare Output 1 */
enum ADC_CR2_EXTSEL_TIM3_CC1 = 0x7 << 24;
/** Timer 3 TRGO Event */
enum ADC_CR2_EXTSEL_TIM3_TRGO = 0x8 << 24;
/** Timer 4 Compare Output 4 */
enum ADC_CR2_EXTSEL_TIM4_CC4 = 0x9 << 24;
/** Timer 5 Compare Output 1 */
enum ADC_CR2_EXTSEL_TIM5_CC1 = 0xA << 24;
/** Timer 5 Compare Output 2 */
enum ADC_CR2_EXTSEL_TIM5_CC2 = 0xB << 24;
/** Timer 5 Compare Output 3 */
enum ADC_CR2_EXTSEL_TIM5_CC3 = 0xC << 24;
/** Timer 8 Compare Output 1 */
enum ADC_CR2_EXTSEL_TIM8_CC1 = 0xD << 24;
/** Timer 8 TRGO Event */
enum ADC_CR2_EXTSEL_TIM8_TRGO = 0xE << 24;
/** EXTI Line 11 Event */
enum ADC_CR2_EXTSEL_EXTI_LINE_11 = 0xF << 24;
/**@}*/

/* JEXTSEL[3:0]: External event selection for injected group. */
/****************************************************************************/
/** @defgroup adc_trigger_injected ADC Trigger Identifier for Injected group
@ingroup adc_defines

@{*/
enum ADC_CR2_JEXTSEL_TIM1_CC4 = 0x0 << 16;
enum ADC_CR2_JEXTSEL_TIM1_TRGO = 0x1 << 16;
enum ADC_CR2_JEXTSEL_TIM2_CC1 = 0x2 << 16;
enum ADC_CR2_JEXTSEL_TIM2_TRGO = 0x3 << 16;
enum ADC_CR2_JEXTSEL_TIM3_CC2 = 0x4 << 16;
enum ADC_CR2_JEXTSEL_TIM3_CC4 = 0x5 << 16;
enum ADC_CR2_JEXTSEL_TIM4_CC1 = 0x6 << 16;
enum ADC_CR2_JEXTSEL_TIM4_CC2 = 0x7 << 16;
enum ADC_CR2_JEXTSEL_TIM4_CC3 = 0x8 << 16;
enum ADC_CR2_JEXTSEL_TIM4_TRGO = 0x9 << 16;
enum ADC_CR2_JEXTSEL_TIM5_CC4 = 0xA << 16;
enum ADC_CR2_JEXTSEL_TIM5_TRGO = 0xB << 16;
enum ADC_CR2_JEXTSEL_TIM8_CC2 = 0xC << 16;
enum ADC_CR2_JEXTSEL_TIM8_CC3 = 0xD << 16;
enum ADC_CR2_JEXTSEL_TIM8_CC4 = 0xE << 16;
enum ADC_CR2_JEXTSEL_EXTI_LINE_15 = 0xF << 16;
/**@}*/

/* ADC_SMPRG ADC Sample Time Selection for Channels */
/** @defgroup adc_sample_rg ADC Sample Time Selection for All Channels
@ingroup adc_defines

@{*/
enum ADC_SMPR_SMP_3CYC = 0x0;
enum ADC_SMPR_SMP_15CYC = 0x1;
enum ADC_SMPR_SMP_28CYC = 0x2;
enum ADC_SMPR_SMP_56CYC = 0x3;
enum ADC_SMPR_SMP_84CYC = 0x4;
enum ADC_SMPR_SMP_112CYC = 0x5;
enum ADC_SMPR_SMP_144CYC = 0x6;
enum ADC_SMPR_SMP_480CYC = 0x7;
/**@}*/

/* --- ADC_SQR1 values ----------------------------------------------------- */
enum ADC_SQR1_L_MSK = 0xf << ADC_SQR1_L_LSB;

enum ADC_SQR_MAX_CHANNELS_REGULAR = 16;

/* ADCPRE: ADC prescaler. */
/****************************************************************************/
/** @defgroup adc_ccr_adcpre ADC Prescale
@ingroup adc_defines

@{*/
enum ADC_CCR_ADCPRE_BY2 = 0x0 << 16;
enum ADC_CCR_ADCPRE_BY4 = 0x1 << 16;
enum ADC_CCR_ADCPRE_BY6 = 0x2 << 16;
enum ADC_CCR_ADCPRE_BY8 = 0x3 << 16;
/**@}*/
enum ADC_CCR_ADCPRE_MASK = 0x3 << 16;
enum ADC_CCR_ADCPRE_SHIFT = 16;

extern(C) {
void adc_set_multi_mode (uint mode);
void adc_enable_vbat_sensor ();
void adc_disable_vbat_sensor ();
}
