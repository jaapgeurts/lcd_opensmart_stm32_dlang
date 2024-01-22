module libopencm3.stm32.f4.rcc;

import libopencm3.stm32.f4.memorymap;
import libopencm3.stm32.pwr;

/** @defgroup rcc_registers RCC Registers
 * @brief Reset / Clock Control Registers
@{*/
/** Clock control register */
enum RCC_CR = MMIO32!(RCC_BASE + 0x00);
/** PLL Configuration register */
enum RCC_PLLCFGR = MMIO32!(RCC_BASE + 0x04);
/** Clock Configuration register */
enum RCC_CFGR = MMIO32!(RCC_BASE + 0x08);
/** Clock interrupt register */
enum RCC_CIR = MMIO32!(RCC_BASE + 0x0c);
/** AHB1 peripheral reset register */
enum RCC_AHB1RSTR = MMIO32!(RCC_BASE + 0x10);
/** AHB2 peripheral reset register */
enum RCC_AHB2RSTR = MMIO32!(RCC_BASE + 0x14);
/** AHB3 peripheral reset register */
enum RCC_AHB3RSTR = MMIO32!(RCC_BASE + 0x18);
/* RCC_BASE + 0x1c Reserved */
/** APB1 peripheral reset register */
enum RCC_APB1RSTR = MMIO32!(RCC_BASE + 0x20);
/** APB2 peripheral reset register */
enum RCC_APB2RSTR = MMIO32!(RCC_BASE + 0x24);
/* RCC_BASE + 0x28 Reserved */
/* RCC_BASE + 0x2c Reserved */
/** AHB1 peripheral enable register */
enum RCC_AHB1ENR = MMIO32!(RCC_BASE + 0x30);
/** AHB2 peripheral enable register */
enum RCC_AHB2ENR = MMIO32!(RCC_BASE + 0x34);
/** AHB3 peripheral enable register */
enum RCC_AHB3ENR = MMIO32!(RCC_BASE + 0x38);
/* RCC_BASE + 0x3c Reserved */
/** APB1 peripheral enable register */
enum RCC_APB1ENR = MMIO32!(RCC_BASE + 0x40);
/** APB2 peripheral enable register */
enum RCC_APB2ENR = MMIO32!(RCC_BASE + 0x44);
/* RCC_BASE + 0x48 Reserved */
/* RCC_BASE + 0x4c Reserved */
/** AHB1 peripheral enable in low power register */
enum RCC_AHB1LPENR = MMIO32!(RCC_BASE + 0x50);
/** AHB2 peripheral enable in low power register */
enum RCC_AHB2LPENR = MMIO32!(RCC_BASE + 0x54);
/** AHB3 peripheral enable in low power register */
enum RCC_AHB3LPENR = MMIO32!(RCC_BASE + 0x58);
/* RCC_BASE + 0x5c Reserved */
/** APB1 peripheral enable in low power register */
enum RCC_APB1LPENR = MMIO32!(RCC_BASE + 0x60);
/** APB2 peripheral enable in low power register */
enum RCC_APB2LPENR = MMIO32!(RCC_BASE + 0x64);
/* RCC_BASE + 0x68 Reserved */
/* RCC_BASE + 0x6c Reserved */
/** Backup Domain control register */
enum RCC_BDCR = MMIO32!(RCC_BASE + 0x70);
/** Clock control and status register */
enum RCC_CSR = MMIO32!(RCC_BASE + 0x74);
/* RCC_BASE + 0x78 Reserved */
/* RCC_BASE + 0x7c Reserved */
/** Spread spectrum clock generation register */
enum RCC_SSCGR = MMIO32!(RCC_BASE + 0x80);
/** PLLI2S configuration register */
enum RCC_PLLI2SCFGR = MMIO32!(RCC_BASE + 0x84);
/** PLLSAI configuration register */
enum RCC_PLLSAICFGR = MMIO32!(RCC_BASE + 0x88);
/** Dedicated clocks configuration register */
enum RCC_DCKCFGR = MMIO32!(RCC_BASE + 0x8C);
/** RCC clocks gated enable register */
enum RCC_CKGATENR = MMIO32!(RCC_BASE + 0x90);
/** RCC Dedicated Clocks Configuration Register 2 */
enum RCC_DCKCFGR2 = MMIO32!(RCC_BASE + 0x94);
/**@}*/

/** @defgroup rcc_cr_values RCC_CR values
 * @ingroup rcc_registers
 * @brief Clock Control register values
@{*/
enum RCC_CR_PLLSAIRDY = 1 << 29;
enum RCC_CR_PLLSAION = 1 << 28;
enum RCC_CR_PLLI2SRDY = 1 << 27;
enum RCC_CR_PLLI2SON = 1 << 26;
enum RCC_CR_PLLRDY = 1 << 25;
enum RCC_CR_PLLON = 1 << 24;
enum RCC_CR_CSSON = 1 << 19;
enum RCC_CR_HSEBYP = 1 << 18;
enum RCC_CR_HSERDY = 1 << 17;
enum RCC_CR_HSEON = 1 << 16;
/* HSICAL: [15:8] */
/* HSITRIM: [7:3] */
enum RCC_CR_HSITRIM_SHIFT = 3;
enum RCC_CR_HSITRIM_MASK = 0x1f;
enum RCC_CR_HSIRDY = 1 << 1;
enum RCC_CR_HSION = 1 << 0;
/**@}*/

/** @defgroup rcc_pllcfgr_values RCC_PLLCFGR values
 * @ingroup rcc_registers
 * @brief PLL Configuration register values
@{*/
/* PLLR: [30:28] */
enum RCC_PLLCFGR_PLLR_SHIFT = 28;
enum RCC_PLLCFGR_PLLR_MASK = 0x7;
/* PLLQ: [27:24] */
enum RCC_PLLCFGR_PLLQ_SHIFT = 24;
enum RCC_PLLCFGR_PLLQ_MASK = 0xf;
enum RCC_PLLCFGR_PLLSRC = 1 << 22;
/* PLLP: [17:16] */
enum RCC_PLLCFGR_PLLP_SHIFT = 16;
enum RCC_PLLCFGR_PLLP_MASK = 0x3;
/* PLLN: [14:6] */
enum RCC_PLLCFGR_PLLN_SHIFT = 6;
enum RCC_PLLCFGR_PLLN_MASK = 0x1ff;
/* PLLM: [5:0] */
enum RCC_PLLCFGR_PLLM_SHIFT = 0;
enum RCC_PLLCFGR_PLLM_MASK = 0x3f;
/**@}*/

/** @defgroup rcc_cfgr_values RCC_CFGR values
 * @ingroup rcc_registers
 * @brief Clock Configuration register values
@{*/
/* MCO2: Microcontroller clock output 2 */
enum RCC_CFGR_MCO2_SHIFT = 30;
enum RCC_CFGR_MCO2_MASK = 0x3;
enum RCC_CFGR_MCO2_SYSCLK = 0x0;
enum RCC_CFGR_MCO2_PLLI2S = 0x1;
enum RCC_CFGR_MCO2_HSE = 0x2;
enum RCC_CFGR_MCO2_PLL = 0x3;

/* MCO1/2PRE: MCO Prescalers */
enum RCC_CFGR_MCO2PRE_SHIFT = 27;
enum RCC_CFGR_MCO2PRE_MASK = 0x7;
enum RCC_CFGR_MCO1PRE_SHIFT = 24;
enum RCC_CFGR_MCO1PRE_MASK = 0x7;
enum RCC_CFGR_MCOPRE_DIV_NONE = 0x0;
enum RCC_CFGR_MCOPRE_DIV_2 = 0x4;
enum RCC_CFGR_MCOPRE_DIV_3 = 0x5;
enum RCC_CFGR_MCOPRE_DIV_4 = 0x6;
enum RCC_CFGR_MCOPRE_DIV_5 = 0x7;

/* PLLSRC: PLL entry clock source */
enum RCC_CFGR_PLLSRC_HSI_CLK = 0x0;
enum RCC_CFGR_PLLSRC_HSE_CLK = 0x1;

/* I2SSRC: I2S clock selection */
enum RCC_CFGR_I2SSRC = 1 << 23;

/* MCO1: Microcontroller clock output 1 */
enum RCC_CFGR_MCO1_SHIFT = 21;
enum RCC_CFGR_MCO1_MASK = 0x3;
enum RCC_CFGR_MCO1_HSI = 0x0;
enum RCC_CFGR_MCO1_LSE = 0x1;
enum RCC_CFGR_MCO1_HSE = 0x2;
enum RCC_CFGR_MCO1_PLL = 0x3;
enum RCC_CFGR_MCO_SHIFT = RCC_CFGR_MCO1_SHIFT;
enum RCC_CFGR_MCO_MASK = RCC_CFGR_MCO1_MASK;

/* RTCPRE: HSE division factor for RTC clock */
enum RCC_CFGR_RTCPRE_SHIFT = 16;
enum RCC_CFGR_RTCPRE_MASK = 0x1f;

enum RCC_CFGR_PPRE2_SHIFT = 13;
enum RCC_CFGR_PPRE2_MASK = 0x7;
enum RCC_CFGR_PPRE1_SHIFT = 10;
enum RCC_CFGR_PPRE1_MASK = 0x7;
/** @defgroup rcc_cfgr_apbxpre RCC_CFGR APBx prescale factors
 * These can be used for both APB1 and APB2 prescaling
 * @{
 */
enum RCC_CFGR_PPRE_NODIV = 0x0;
enum RCC_CFGR_PPRE_DIV2 = 0x4;
enum RCC_CFGR_PPRE_DIV4 = 0x5;
enum RCC_CFGR_PPRE_DIV8 = 0x6;
enum RCC_CFGR_PPRE_DIV16 = 0x7;
/**@}*/

enum RCC_CFGR_HPRE_SHIFT = 4;
enum RCC_CFGR_HPRE_MASK = 0xf;
/** @defgroup rcc_cfgr_ahbpre RCC_CFGR AHB prescale factors
@{*/
enum RCC_CFGR_HPRE_NODIV = 0x0;
enum RCC_CFGR_HPRE_DIV2 = 0x8 + 0;
enum RCC_CFGR_HPRE_DIV4 = 0x8 + 1;
enum RCC_CFGR_HPRE_DIV8 = 0x8 + 2;
enum RCC_CFGR_HPRE_DIV16 = 0x8 + 3;
enum RCC_CFGR_HPRE_DIV64 = 0x8 + 4;
enum RCC_CFGR_HPRE_DIV128 = 0x8 + 5;
enum RCC_CFGR_HPRE_DIV256 = 0x8 + 6;
enum RCC_CFGR_HPRE_DIV512 = 0x8 + 7;
/**@}*/

/* SWS: System clock switch status */
enum RCC_CFGR_SWS_SHIFT = 2;
enum RCC_CFGR_SWS_MASK = 0x3;
enum RCC_CFGR_SWS_HSI = 0x0;
enum RCC_CFGR_SWS_HSE = 0x1;
enum RCC_CFGR_SWS_PLL = 0x2;

/* SW: System clock switch */
enum RCC_CFGR_SW_SHIFT = 0;
enum RCC_CFGR_SW_HSI = 0x0;
enum RCC_CFGR_SW_HSE = 0x1;
enum RCC_CFGR_SW_PLL = 0x2;
/**@}*/

/** Older compatible definitions to ease migration
 * @defgroup rcc_cfgr_deprecated RCC_CFGR Deprecated dividers
 * @deprecated Use _CFGR_xPRE_DIVn form instead, across all families
 * @{
 */
enum RCC_CFGR_PPRE_DIV_NONE = 0x0;
enum RCC_CFGR_PPRE_DIV_2 = 0x4;
enum RCC_CFGR_PPRE_DIV_4 = 0x5;
enum RCC_CFGR_PPRE_DIV_8 = 0x6;
enum RCC_CFGR_PPRE_DIV_16 = 0x7;

enum RCC_CFGR_HPRE_DIV_NONE = 0x0;
enum RCC_CFGR_HPRE_DIV_2 = 0x8 + 0;
enum RCC_CFGR_HPRE_DIV_4 = 0x8 + 1;
enum RCC_CFGR_HPRE_DIV_8 = 0x8 + 2;
enum RCC_CFGR_HPRE_DIV_16 = 0x8 + 3;
enum RCC_CFGR_HPRE_DIV_64 = 0x8 + 4;
enum RCC_CFGR_HPRE_DIV_128 = 0x8 + 5;
enum RCC_CFGR_HPRE_DIV_256 = 0x8 + 6;
enum RCC_CFGR_HPRE_DIV_512 = 0x8 + 7;
/**@}*/

/** @defgroup rcc_cir_values RCC_CIR values
 * @ingroup rcc_registers
 * @brief Clock Interrupt register values
@{*/
/* Clock security system interrupt clear bit */
enum RCC_CIR_CSSC = 1 << 23;

/* OSC ready interrupt clear bits */
enum RCC_CIR_PLLSAIRDYC = 1 << 22;
enum RCC_CIR_PLLI2SRDYC = 1 << 21;
enum RCC_CIR_PLLRDYC = 1 << 20;
enum RCC_CIR_HSERDYC = 1 << 19;
enum RCC_CIR_HSIRDYC = 1 << 18;
enum RCC_CIR_LSERDYC = 1 << 17;
enum RCC_CIR_LSIRDYC = 1 << 16;

/* OSC ready interrupt enable bits */
enum RCC_CIR_PLLSAIRDYIE = 1 << 14;
enum RCC_CIR_PLLI2SRDYIE = 1 << 13;
enum RCC_CIR_PLLRDYIE = 1 << 12;
enum RCC_CIR_HSERDYIE = 1 << 11;
enum RCC_CIR_HSIRDYIE = 1 << 10;
enum RCC_CIR_LSERDYIE = 1 << 9;
enum RCC_CIR_LSIRDYIE = 1 << 8;

/* Clock security system interrupt flag bit */
enum RCC_CIR_CSSF = 1 << 7;

/* OSC ready interrupt flag bits */
enum RCC_CIR_PLLSAIRDYF = 1 << 6;
enum RCC_CIR_PLLI2SRDYF = 1 << 5;
enum RCC_CIR_PLLRDYF = 1 << 4;
enum RCC_CIR_HSERDYF = 1 << 3;
enum RCC_CIR_HSIRDYF = 1 << 2;
enum RCC_CIR_LSERDYF = 1 << 1;
enum RCC_CIR_LSIRDYF = 1 << 0;
/**@}*/

/** @defgroup rcc_ahbrstr_rst RCC_AHBxRSTR reset values (full set)
@{*/
/** @defgroup rcc_ahb1rstr_rst RCC_AHB1RSTR reset values
@{*/
enum RCC_AHB1RSTR_OTGHSRST = 1 << 29;
enum RCC_AHB1RSTR_ETHMACRST = 1 << 25;
enum RCC_AHB1RSTR_DMA2DRST = 1 << 23;
enum RCC_AHB1RSTR_DMA2RST = 1 << 22;
enum RCC_AHB1RSTR_DMA1RST = 1 << 21;
enum RCC_AHB1RSTR_CRCRST = 1 << 12;
enum RCC_AHB1RSTR_GPIOKRST = 1 << 10;
enum RCC_AHB1RSTR_GPIOJRST = 1 << 9;
enum RCC_AHB1RSTR_GPIOIRST = 1 << 8;
enum RCC_AHB1RSTR_GPIOHRST = 1 << 7;
enum RCC_AHB1RSTR_GPIOGRST = 1 << 6;
enum RCC_AHB1RSTR_GPIOFRST = 1 << 5;
enum RCC_AHB1RSTR_GPIOERST = 1 << 4;
enum RCC_AHB1RSTR_GPIODRST = 1 << 3;
enum RCC_AHB1RSTR_GPIOCRST = 1 << 2;
enum RCC_AHB1RSTR_GPIOBRST = 1 << 1;
enum RCC_AHB1RSTR_GPIOARST = 1 << 0;
/**@}*/

/** @addtogroup deprecated_201802_rcc Deprecated 2018
 * @deprecated replace zzz_IOPxRST with zzz_GPIOxRST
 * @{
 */
enum RCC_AHB1RSTR_IOPKRST = RCC_AHB1RSTR_GPIOKRST;
enum RCC_AHB1RSTR_IOPJRST = RCC_AHB1RSTR_GPIOJRST;
enum RCC_AHB1RSTR_IOPIRST = RCC_AHB1RSTR_GPIOIRST;
enum RCC_AHB1RSTR_IOPHRST = RCC_AHB1RSTR_GPIOHRST;
enum RCC_AHB1RSTR_IOPGRST = RCC_AHB1RSTR_GPIOGRST;
enum RCC_AHB1RSTR_IOPFRST = RCC_AHB1RSTR_GPIOFRST;
enum RCC_AHB1RSTR_IOPERST = RCC_AHB1RSTR_GPIOERST;
enum RCC_AHB1RSTR_IOPDRST = RCC_AHB1RSTR_GPIODRST;
enum RCC_AHB1RSTR_IOPCRST = RCC_AHB1RSTR_GPIOCRST;
enum RCC_AHB1RSTR_IOPBRST = RCC_AHB1RSTR_GPIOBRST;
enum RCC_AHB1RSTR_IOPARST = RCC_AHB1RSTR_GPIOARST;
/**@}*/

/** @defgroup rcc_ahb2rstr_rst RCC_AHB2RSTR reset values
@{*/
enum RCC_AHB2RSTR_OTGFSRST = 1 << 7;
enum RCC_AHB2RSTR_RNGRST = 1 << 6;
enum RCC_AHB2RSTR_HASHRST = 1 << 5;
enum RCC_AHB2RSTR_CRYPRST = 1 << 4;
enum RCC_AHB2RSTR_DCMIRST = 1 << 0;
/**@}*/

/** @defgroup rcc_ahb3rstr_rst RCC_AHB3RSTR reset values
@{*/
enum RCC_AHB3RSTR_QSPIRST = 1 << 1;
enum RCC_AHB3RSTR_FSMCRST = 1 << 0;
/**@}*/
/**@}*/

/** @defgroup rcc_apb1rstr_rst RCC_APB1RSTR reset values
@{*/
enum RCC_APB1RSTR_UART8RST = 1 << 31;
enum RCC_APB1RSTR_UART7RST = 1 << 30;
enum RCC_APB1RSTR_DACRST = 1 << 29;
enum RCC_APB1RSTR_PWRRST = 1 << 28;
enum RCC_APB1RSTR_CAN2RST = 1 << 26;
enum RCC_APB1RSTR_CAN1RST = 1 << 25;
enum RCC_APB1RSTR_I2C3RST = 1 << 23;
enum RCC_APB1RSTR_I2C2RST = 1 << 22;
enum RCC_APB1RSTR_I2C1RST = 1 << 21;
enum RCC_APB1RSTR_UART5RST = 1 << 20;
enum RCC_APB1RSTR_UART4RST = 1 << 19;
enum RCC_APB1RSTR_USART3RST = 1 << 18;
enum RCC_APB1RSTR_USART2RST = 1 << 17;
enum RCC_APB1RSTR_SPI3RST = 1 << 15;
enum RCC_APB1RSTR_SPI2RST = 1 << 14;
enum RCC_APB1RSTR_WWDGRST = 1 << 11;
enum RCC_APB1RSTR_TIM14RST = 1 << 8;
enum RCC_APB1RSTR_TIM13RST = 1 << 7;
enum RCC_APB1RSTR_TIM12RST = 1 << 6;
enum RCC_APB1RSTR_TIM7RST = 1 << 5;
enum RCC_APB1RSTR_TIM6RST = 1 << 4;
enum RCC_APB1RSTR_TIM5RST = 1 << 3;
enum RCC_APB1RSTR_TIM4RST = 1 << 2;
enum RCC_APB1RSTR_TIM3RST = 1 << 1;
enum RCC_APB1RSTR_TIM2RST = 1 << 0;
/**@}*/

/** @defgroup rcc_apb2rstr_rst RCC_APB2RSTR reset values
@{*/
enum RCC_APB2RSTR_DSIRST = 1 << 27;
enum RCC_APB2RSTR_LTDCRST = 1 << 26;
enum RCC_APB2RSTR_SAI1RST = 1 << 22;
enum RCC_APB2RSTR_SPI6RST = 1 << 21;
enum RCC_APB2RSTR_SPI5RST = 1 << 20;
enum RCC_APB2RSTR_TIM11RST = 1 << 18;
enum RCC_APB2RSTR_TIM10RST = 1 << 17;
enum RCC_APB2RSTR_TIM9RST = 1 << 16;
enum RCC_APB2RSTR_SYSCFGRST = 1 << 14;
enum RCC_APB2RSTR_SPI4RST = 1 << 13;
enum RCC_APB2RSTR_SPI1RST = 1 << 12;
enum RCC_APB2RSTR_SDIORST = 1 << 11;
enum RCC_APB2RSTR_ADCRST = 1 << 8;
enum RCC_APB2RSTR_USART6RST = 1 << 5;
enum RCC_APB2RSTR_USART1RST = 1 << 4;
enum RCC_APB2RSTR_TIM8RST = 1 << 1;
enum RCC_APB2RSTR_TIM1RST = 1 << 0;
/**@}*/

/** @defgroup rcc_ahbenr_en RCC_AHBxENR enable values (full set)
@{*/
/** @defgroup rcc_ahb1enr_en RCC_AHB1ENR enable values
@{*/
enum RCC_AHB1ENR_OTGHSULPIEN = 1 << 30;
enum RCC_AHB1ENR_OTGHSEN = 1 << 29;
enum RCC_AHB1ENR_ETHMACPTPEN = 1 << 28;
enum RCC_AHB1ENR_ETHMACRXEN = 1 << 27;
enum RCC_AHB1ENR_ETHMACTXEN = 1 << 26;
enum RCC_AHB1ENR_ETHMACEN = 1 << 25;
enum RCC_AHB1ENR_DMA2DEN = 1 << 23;
enum RCC_AHB1ENR_DMA2EN = 1 << 22;
enum RCC_AHB1ENR_DMA1EN = 1 << 21;
enum RCC_AHB1ENR_CCMDATARAMEN = 1 << 20;
enum RCC_AHB1ENR_BKPSRAMEN = 1 << 18;
enum RCC_AHB1ENR_CRCEN = 1 << 12;
enum RCC_AHB1ENR_GPIOKEN = 1 << 10;
enum RCC_AHB1ENR_GPIOJEN = 1 << 9;
enum RCC_AHB1ENR_GPIOIEN = 1 << 8;
enum RCC_AHB1ENR_GPIOHEN = 1 << 7;
enum RCC_AHB1ENR_GPIOGEN = 1 << 6;
enum RCC_AHB1ENR_GPIOFEN = 1 << 5;
enum RCC_AHB1ENR_GPIOEEN = 1 << 4;
enum RCC_AHB1ENR_GPIODEN = 1 << 3;
enum RCC_AHB1ENR_GPIOCEN = 1 << 2;
enum RCC_AHB1ENR_GPIOBEN = 1 << 1;
enum RCC_AHB1ENR_GPIOAEN = 1 << 0;
/**@}*/

/** @addtogroup deprecated_201802_rcc Deprecated 2018
 * @deprecated replace zzz_IOPxEN with zzz_GPIOxEN
 * @{
 */
enum RCC_AHB1ENR_IOPKEN = RCC_AHB1ENR_GPIOKEN;
enum RCC_AHB1ENR_IOPJEN = RCC_AHB1ENR_GPIOJEN;
enum RCC_AHB1ENR_IOPIEN = RCC_AHB1ENR_GPIOIEN;
enum RCC_AHB1ENR_IOPHEN = RCC_AHB1ENR_GPIOHEN;
enum RCC_AHB1ENR_IOPGEN = RCC_AHB1ENR_GPIOGEN;
enum RCC_AHB1ENR_IOPFEN = RCC_AHB1ENR_GPIOFEN;
enum RCC_AHB1ENR_IOPEEN = RCC_AHB1ENR_GPIOEEN;
enum RCC_AHB1ENR_IOPDEN = RCC_AHB1ENR_GPIODEN;
enum RCC_AHB1ENR_IOPCEN = RCC_AHB1ENR_GPIOCEN;
enum RCC_AHB1ENR_IOPBEN = RCC_AHB1ENR_GPIOBEN;
enum RCC_AHB1ENR_IOPAEN = RCC_AHB1ENR_GPIOAEN;
/**@}*/

/** @defgroup rcc_ahb2enr_en RCC_AHB2ENR enable values
@{*/
enum RCC_AHB2ENR_OTGFSEN = 1 << 7;
enum RCC_AHB2ENR_RNGEN = 1 << 6;
enum RCC_AHB2ENR_HASHEN = 1 << 5;
enum RCC_AHB2ENR_CRYPEN = 1 << 4;
enum RCC_AHB2ENR_DCMIEN = 1 << 0;
/**@}*/

/** @defgroup rcc_ahb3enr_en RCC_AHB3ENR enable values
@{*/
enum RCC_AHB3ENR_QSPIEN = 1 << 1;
enum RCC_AHB3ENR_FSMCEN = 1 << 0;
/* Alternate now that F429 has DRAM controller as well */
enum RCC_AHB3ENR_FMCEN = 1 << 0;
/**@}*/
/**@}*/

/** @defgroup rcc_apb1enr_en RCC_APB1ENR enable values
@{*/
enum RCC_APB1ENR_UART8EN = 1 << 31;
enum RCC_APB1ENR_UART7EN = 1 << 30;
enum RCC_APB1ENR_DACEN = 1 << 29;
enum RCC_APB1ENR_PWREN = 1 << 28;
enum RCC_APB1ENR_CAN2EN = 1 << 26;
enum RCC_APB1ENR_CAN1EN = 1 << 25;
enum RCC_APB1ENR_I2C3EN = 1 << 23;
enum RCC_APB1ENR_I2C2EN = 1 << 22;
enum RCC_APB1ENR_I2C1EN = 1 << 21;
enum RCC_APB1ENR_UART5EN = 1 << 20;
enum RCC_APB1ENR_UART4EN = 1 << 19;
enum RCC_APB1ENR_USART3EN = 1 << 18;
enum RCC_APB1ENR_USART2EN = 1 << 17;
enum RCC_APB1ENR_SPI3EN = 1 << 15;
enum RCC_APB1ENR_SPI2EN = 1 << 14;
enum RCC_APB1ENR_WWDGEN = 1 << 11;
enum RCC_APB1ENR_TIM14EN = 1 << 8;
enum RCC_APB1ENR_TIM13EN = 1 << 7;
enum RCC_APB1ENR_TIM12EN = 1 << 6;
enum RCC_APB1ENR_TIM7EN = 1 << 5;
enum RCC_APB1ENR_TIM6EN = 1 << 4;
enum RCC_APB1ENR_TIM5EN = 1 << 3;
enum RCC_APB1ENR_TIM4EN = 1 << 2;
enum RCC_APB1ENR_TIM3EN = 1 << 1;
enum RCC_APB1ENR_TIM2EN = 1 << 0;
/**@}*/

/** @defgroup rcc_apb2enr_en RCC_APB2ENR enable values
@{*/
enum RCC_APB2ENR_DSIEN = 1 << 27;
enum RCC_APB2ENR_LTDCEN = 1 << 26;
enum RCC_APB2ENR_SAI1EN = 1 << 22;
enum RCC_APB2ENR_SPI6EN = 1 << 21;
enum RCC_APB2ENR_SPI5EN = 1 << 20;
enum RCC_APB2ENR_TIM11EN = 1 << 18;
enum RCC_APB2ENR_TIM10EN = 1 << 17;
enum RCC_APB2ENR_TIM9EN = 1 << 16;
enum RCC_APB2ENR_SYSCFGEN = 1 << 14;
enum RCC_APB2ENR_SPI4EN = 1 << 13;
enum RCC_APB2ENR_SPI1EN = 1 << 12;
enum RCC_APB2ENR_SDIOEN = 1 << 11;
enum RCC_APB2ENR_ADC3EN = 1 << 10;
enum RCC_APB2ENR_ADC2EN = 1 << 9;
enum RCC_APB2ENR_ADC1EN = 1 << 8;
enum RCC_APB2ENR_USART6EN = 1 << 5;
enum RCC_APB2ENR_USART1EN = 1 << 4;
enum RCC_APB2ENR_TIM8EN = 1 << 1;
enum RCC_APB2ENR_TIM1EN = 1 << 0;
/**@}*/

/* --- RCC_AHB1LPENR values ------------------------------------------------- */

enum RCC_AHB1LPENR_OTGHSULPILPEN = 1 << 30;
enum RCC_AHB1LPENR_OTGHSLPEN = 1 << 29;
enum RCC_AHB1LPENR_ETHMACPTPLPEN = 1 << 28;
enum RCC_AHB1LPENR_ETHMACRXLPEN = 1 << 27;
enum RCC_AHB1LPENR_ETHMACTXLPEN = 1 << 26;
enum RCC_AHB1LPENR_ETHMACLPEN = 1 << 25;
enum RCC_AHB1LPENR_DMA2DLPEN = 1 << 23;
enum RCC_AHB1LPENR_DMA2LPEN = 1 << 22;
enum RCC_AHB1LPENR_DMA1LPEN = 1 << 21;
enum RCC_AHB1LPENR_SRAM3LPEN = 1 << 19;
enum RCC_AHB1LPENR_BKPSRAMLPEN = 1 << 18;
enum RCC_AHB1LPENR_SRAM2LPEN = 1 << 17;
enum RCC_AHB1LPENR_SRAM1LPEN = 1 << 16;
enum RCC_AHB1LPENR_FLITFLPEN = 1 << 15;
enum RCC_AHB1LPENR_CRCLPEN = 1 << 12;
enum RCC_AHB1LPENR_GPIOKLPEN = 1 << 10;
enum RCC_AHB1LPENR_GPIOJLPEN = 1 << 9;
enum RCC_AHB1LPENR_GPIOILPEN = 1 << 8;
enum RCC_AHB1LPENR_GPIOHLPEN = 1 << 7;
enum RCC_AHB1LPENR_GPIOGLPEN = 1 << 6;
enum RCC_AHB1LPENR_GPIOFLPEN = 1 << 5;
enum RCC_AHB1LPENR_GPIOELPEN = 1 << 4;
enum RCC_AHB1LPENR_GPIODLPEN = 1 << 3;
enum RCC_AHB1LPENR_GPIOCLPEN = 1 << 2;
enum RCC_AHB1LPENR_GPIOBLPEN = 1 << 1;
enum RCC_AHB1LPENR_GPIOALPEN = 1 << 0;

/** @addtogroup deprecated_201802_rcc Deprecated 2018
 * @deprecated replace zzz_IOPxLPEN with zzz_GPIOxLPEN
 * @{
 */
enum RCC_AHB1LPENR_IOPKLPEN = RCC_AHB1LPENR_GPIOKLPEN;
enum RCC_AHB1LPENR_IOPJLPEN = RCC_AHB1LPENR_GPIOJLPEN;
enum RCC_AHB1LPENR_IOPILPEN = RCC_AHB1LPENR_GPIOILPEN;
enum RCC_AHB1LPENR_IOPHLPEN = RCC_AHB1LPENR_GPIOHLPEN;
enum RCC_AHB1LPENR_IOPGLPEN = RCC_AHB1LPENR_GPIOGLPEN;
enum RCC_AHB1LPENR_IOPFLPEN = RCC_AHB1LPENR_GPIOFLPEN;
enum RCC_AHB1LPENR_IOPELPEN = RCC_AHB1LPENR_GPIOELPEN;
enum RCC_AHB1LPENR_IOPDLPEN = RCC_AHB1LPENR_GPIODLPEN;
enum RCC_AHB1LPENR_IOPCLPEN = RCC_AHB1LPENR_GPIOCLPEN;
enum RCC_AHB1LPENR_IOPBLPEN = RCC_AHB1LPENR_GPIOBLPEN;
enum RCC_AHB1LPENR_IOPALPEN = RCC_AHB1LPENR_GPIOALPEN;
/**@}*/

/* --- RCC_AHB2LPENR values ------------------------------------------------- */

enum RCC_AHB2LPENR_OTGFSLPEN = 1 << 7;
enum RCC_AHB2LPENR_RNGLPEN = 1 << 6;
enum RCC_AHB2LPENR_HASHLPEN = 1 << 5;
enum RCC_AHB2LPENR_CRYPLPEN = 1 << 4;
enum RCC_AHB2LPENR_DCMILPEN = 1 << 0;

/* --- RCC_AHB3LPENR values ------------------------------------------------- */

enum RCC_AHB3LPENR_QSPIEN = 1 << 1;
enum RCC_AHB3LPENR_FSMCLPEN = 1 << 0;
enum RCC_AHB3LPENR_FMCLPEN = 1 << 0;

/* --- RCC_APB1LPENR values ------------------------------------------------- */

/** @defgroup rcc_apblpenr_en RCC_APBxLPENR enable values (full set)
@{*/
enum RCC_APB1LPENR_UART8EN = 1 << 31;
enum RCC_APB1LPENR_UART7EN = 1 << 30;
enum RCC_APB1LPENR_DACLPEN = 1 << 29;
enum RCC_APB1LPENR_PWRLPEN = 1 << 28;
enum RCC_APB1LPENR_CAN2LPEN = 1 << 26;
enum RCC_APB1LPENR_CAN1LPEN = 1 << 25;
enum RCC_APB1LPENR_I2C3LPEN = 1 << 23;
enum RCC_APB1LPENR_I2C2LPEN = 1 << 22;
enum RCC_APB1LPENR_I2C1LPEN = 1 << 21;
enum RCC_APB1LPENR_UART5LPEN = 1 << 20;
enum RCC_APB1LPENR_UART4LPEN = 1 << 19;
enum RCC_APB1LPENR_USART3LPEN = 1 << 18;
enum RCC_APB1LPENR_USART2LPEN = 1 << 17;
enum RCC_APB1LPENR_SPI3LPEN = 1 << 15;
enum RCC_APB1LPENR_SPI2LPEN = 1 << 14;
enum RCC_APB1LPENR_WWDGLPEN = 1 << 11;
enum RCC_APB1LPENR_TIM14LPEN = 1 << 8;
enum RCC_APB1LPENR_TIM13LPEN = 1 << 7;
enum RCC_APB1LPENR_TIM12LPEN = 1 << 6;
enum RCC_APB1LPENR_TIM7LPEN = 1 << 5;
enum RCC_APB1LPENR_TIM6LPEN = 1 << 4;
enum RCC_APB1LPENR_TIM5LPEN = 1 << 3;
enum RCC_APB1LPENR_TIM4LPEN = 1 << 2;
enum RCC_APB1LPENR_TIM3LPEN = 1 << 1;
enum RCC_APB1LPENR_TIM2LPEN = 1 << 0;

/* --- RCC_APB2LPENR values ------------------------------------------------- */

enum RCC_APB2LPENR_DSILPEN = 1 << 27;
enum RCC_APB2LPENR_LTDCLPEN = 1 << 26;
enum RCC_APB2LPENR_SAI1LPEN = 1 << 22;
enum RCC_APB2LPENR_SPI6LPEN = 1 << 21;
enum RCC_APB2LPENR_SPI5LPEN = 1 << 20;
enum RCC_APB2LPENR_TIM11LPEN = 1 << 18;
enum RCC_APB2LPENR_TIM10LPEN = 1 << 17;
enum RCC_APB2LPENR_TIM9LPEN = 1 << 16;
enum RCC_APB2LPENR_SYSCFGLPEN = 1 << 14;
enum RCC_APB2LPENR_SPI1LPEN = 1 << 12;
enum RCC_APB2LPENR_SDIOLPEN = 1 << 11;
enum RCC_APB2LPENR_ADC3LPEN = 1 << 10;
enum RCC_APB2LPENR_ADC2LPEN = 1 << 9;
enum RCC_APB2LPENR_ADC1LPEN = 1 << 8;
enum RCC_APB2LPENR_USART6LPEN = 1 << 5;
enum RCC_APB2LPENR_USART1LPEN = 1 << 4;
enum RCC_APB2LPENR_TIM8LPEN = 1 << 1;
enum RCC_APB2LPENR_TIM1LPEN = 1 << 0;
/**@}*/

/** @defgroup rcc_bdcr_values RCC_BDCR values
 * @ingroup rcc_registers
 * @brief Backup Domain control register values
@{*/
enum RCC_BDCR_BDRST = 1 << 16;
enum RCC_BDCR_RTCEN = 1 << 15;
/* RCC_BDCR[9:8]: RTCSEL */
enum RCC_BDCR_RTCSEL_SHIFT = 8;
enum RCC_BDCR_RTCSEL_MASK = 0x3;
enum RCC_BDCR_RTCSEL_NONE = 0;
enum RCC_BDCR_RTCSEL_LSE = 1;
enum RCC_BDCR_RTCSEL_LSI = 2;
enum RCC_BDCR_RTCSEL_HSE = 3;
enum RCC_BDCR_LSEMOD = 1 << 3;
enum RCC_BDCR_LSEBYP = 1 << 2;
enum RCC_BDCR_LSERDY = 1 << 1;
enum RCC_BDCR_LSEON = 1 << 0;
/**@}*/

/** @defgroup rcc_csr_values RCC_CSR values
 * @ingroup rcc_registers
 * @brief Clock control and status register values
@{*/
enum RCC_CSR_LPWRRSTF = 1 << 31;
enum RCC_CSR_WWDGRSTF = 1 << 30;
enum RCC_CSR_IWDGRSTF = 1 << 29;
enum RCC_CSR_SFTRSTF = 1 << 28;
enum RCC_CSR_PORRSTF = 1 << 27;
enum RCC_CSR_PINRSTF = 1 << 26;
enum RCC_CSR_BORRSTF = 1 << 25;
enum RCC_CSR_RMVF = 1 << 24;
enum RCC_CSR_RESET_FLAGS = RCC_CSR_LPWRRSTF | RCC_CSR_WWDGRSTF | RCC_CSR_IWDGRSTF | RCC_CSR_SFTRSTF | RCC_CSR_PORRSTF | RCC_CSR_PINRSTF | RCC_CSR_BORRSTF;

enum RCC_CSR_LSIRDY = 1 << 1;
enum RCC_CSR_LSION = 1 << 0;
/**@}*/

/** @defgroup rcc_sscgr_values RCC_SSCGR values
 * @ingroup rcc_registers
 * @brief Spread spectrum clock generation register values
@{*/
/* PLL spread spectrum clock generation documented in Datasheet. */

enum RCC_SSCGR_SSCGEN = 1 << 31;
enum RCC_SSCGR_SPREADSEL = 1 << 30;
/* RCC_SSCGR[27:13]: INCSTEP */
enum RCC_SSCGR_INCSTEP_SHIFT = 13;
enum RCC_SSCGR_INCSTEP_MASK = 0x7fff;
/* RCC_SSCGR[15:0]: MODPER */
enum RCC_SSCGR_MODPER_SHIFT = 0;
enum RCC_SSCGR_MODPER_MASK = 0x1fff;
/**@}*/

/** @defgroup rcc_pllded_values RCC_PLLxxx/DCKy values
 * @ingroup rcc_registers
 * @brief PLL and other dedicated clock register values
@{*/
/* --- RCC_PLLI2SCFGR values ----------------------------------------------- */

/* RCC_PLLI2SCFGR[30:28]: PLLI2SR */
enum RCC_PLLI2SCFGR_PLLI2SR_SHIFT = 28;
enum RCC_PLLI2SCFGR_PLLI2SR_MASK = 0x7;
/* RCC_PLLI2SCFGR[27:24] PLLI2SQ */
enum RCC_PLLI2SCFGR_PLLI2SQ_SHIFT = 24;
enum RCC_PLLI2SCFGR_PLLI2SQ_MASK = 0xf;
/* RCC_PLLI2SCFGR[14:6]: PLLI2SN */
enum RCC_PLLI2SCFGR_PLLI2SN_SHIFT = 6;
enum RCC_PLLI2SCFGR_PLLI2SN_MASK = 0x1ff;

/* --- RCC_PLLSAICFGR values ----------------------------------------------- */

/* RCC_PLLSAICFGR[30:28]: PLLSAIR */
enum RCC_PLLSAICFGR_PLLSAIR_SHIFT = 28;
enum RCC_PLLSAICFGR_PLLSAIR_MASK = 0x7;

/* RCC_PLLSAICFGR[27:24]: PLLSAIQ */
enum RCC_PLLSAICFGR_PLLSAIQ_SHIFT = 24;
enum RCC_PLLSAICFGR_PLLSAIQ_MASK = 0xF;

/* RCC_PLLSAICFGR[18:16]: PLLSAIP */
enum RCC_PLLSAICFGR_PLLSAIP_SHIFT = 16;
enum RCC_PLLSAICFGR_PLLSAIP_MASK = 0x3;
/** @defgroup rcc_pllsaicfgr_pllsaip PLLSAICFGR PLLSAIP values
@ingroup rcc_defines
@{*/
enum RCC_PLLSAICFGR_PLLSAIP_DIV2 = 0x0;
enum RCC_PLLSAICFGR_PLLSAIP_DIV4 = 0x1;
enum RCC_PLLSAICFGR_PLLSAIP_DIV6 = 0x2;
enum RCC_PLLSAICFGR_PLLSAIP_DIV8 = 0x3;
/**@}*/

/* RCC_PLLSAICFGR[14:6]: PLLSAIN */
enum RCC_PLLSAICFGR_PLLSAIN_SHIFT = 6;
enum RCC_PLLSAICFGR_PLLSAIN_MASK = 0x1FF;

/* --- RCC_DCKCFGR values -------------------------------------------------- */
enum RCC_DCKCFGR_DSISEL = 1 << 29;
enum RCC_DCKCFGR_SDMMCSEL = 1 << 28;
enum RCC_DCKCFGR_48MSEL = 1 << 27;
enum RCC_DCKCFGR_TIMPRE = 1 << 24;

enum RCC_DCKCFGR_SAI1BSRC_SHIFT = 22;
enum RCC_DCKCFGR_SAI1BSRC_MASK = 0x3;

enum RCC_DCKCFGR_SAI1ASRC_SHIFT = 20;
enum RCC_DCKCFGR_SAI1ASRC_MASK = 0x3;

/* Values for the BSRC and ASRC fields */
enum RCC_DCKCFGR_SAI1SRC_SAIQ = 0x0;
enum RCC_DCKCFGR_SAI1SRC_I2SQ = 0x1;
enum RCC_DCKCFGR_SAI1SRC_ALT = 0x2;
enum RCC_DCKCFGR_SAI1SRC_ERROR = 0x3;

enum RCC_DCKCFGR_PLLSAIDIVR_SHIFT = 16;
enum RCC_DCKCFGR_PLLSAIDIVR_MASK = 0x3;
enum RCC_DCKCFGR_PLLSAIDIVR_DIVR_2 = 0x0;
enum RCC_DCKCFGR_PLLSAIDIVR_DIVR_4 = 0x1;
enum RCC_DCKCFGR_PLLSAIDIVR_DIVR_8 = 0x2;
enum RCC_DCKCFGR_PLLSAIDIVR_DIVR_16 = 0x3;

enum RCC_DCKCFGR_PLLSAIDIVQ_SHIFT = 8;
enum RCC_DCKCFGR_PLLSAIDIVQ_MASK = 0x1f;

enum RCC_DCKCFGR_PLLI2SDIVQ_SHIFT = 0;
enum RCC_DCKCFGR_PLLI2SDIVQ_MASK = 0x1f;
/**@}*/

/** @defgroup rcc_ckgatenr_values RCC_CKGATENR bits
 * @ingroup rcc_registers
 * @brief Allows to enable or disable the clock gating for the specified IPs.
@{*/
enum RCC_CKGATENR_EVTCL_CKEN = 1 << 7;
enum RCC_CKGATENR_RCC_CKEN = 1 << 6;
enum RCC_CKGATENR_FLITF_CKEN = 1 << 5;
enum RCC_CKGATENR_SRAM_CKEN = 1 << 4;
enum RCC_CKGATENR_SPARE_CKEN = 1 << 3;
enum RCC_CKGATENR_CM4DBG_CKEN = 1 << 2;
enum RCC_CKGATENR_AHB2APB2_CKEN = 1 << 1;
enum RCC_CKGATENR_AHB2APB1_CKEN = 1 << 0;
/**@}*/

/* --- Variable definitions ------------------------------------------------ */
extern __gshared uint rcc_ahb_frequency;
extern __gshared uint rcc_apb1_frequency;
extern __gshared uint rcc_apb2_frequency;

/* --- Function prototypes ------------------------------------------------- */

enum rcc_clock_3v3
{
    RCC_CLOCK_3V3_84MHZ = 0,
    RCC_CLOCK_3V3_96MHZ = 1,
    RCC_CLOCK_3V3_168MHZ = 2,
    RCC_CLOCK_3V3_180MHZ = 3,
    RCC_CLOCK_3V3_END = 4
}

alias RCC_CLOCK_3V3_84MHZ = rcc_clock_3v3.RCC_CLOCK_3V3_84MHZ;
alias RCC_CLOCK_3V3_96MHZ = rcc_clock_3v3.RCC_CLOCK_3V3_96MHZ;
alias RCC_CLOCK_3V3_168MHZ = rcc_clock_3v3.RCC_CLOCK_3V3_168MHZ;
alias RCC_CLOCK_3V3_180MHZ = rcc_clock_3v3.RCC_CLOCK_3V3_180MHZ;
alias RCC_CLOCK_3V3_END = rcc_clock_3v3.RCC_CLOCK_3V3_END;

struct rcc_clock_scale
{
    ubyte pllm;
    ushort plln;
    ubyte pllp;
    ubyte pllq;
    ubyte pllr;
    ubyte pll_source;
    uint flash_config;
    ubyte hpre;
    ubyte ppre1;
    ubyte ppre2;
    pwr_vos_scale voltage_scale;
    uint ahb_frequency;
    uint apb1_frequency;
    uint apb2_frequency;
}

extern (C) {
extern __gshared const(rcc_clock_scale)[RCC_CLOCK_3V3_END] rcc_hsi_configs;
extern __gshared const(rcc_clock_scale)[RCC_CLOCK_3V3_END] rcc_hse_8mhz_3v3;
extern __gshared const(rcc_clock_scale)[RCC_CLOCK_3V3_END] rcc_hse_12mhz_3v3;
extern __gshared const(rcc_clock_scale)[RCC_CLOCK_3V3_END] rcc_hse_16mhz_3v3;
extern __gshared const(rcc_clock_scale)[RCC_CLOCK_3V3_END] rcc_hse_25mhz_3v3;

}

enum rcc_osc
{
    RCC_PLL = 0,
    RCC_PLLSAI = 1,
    RCC_PLLI2S = 2,
    RCC_HSE = 3,
    RCC_HSI = 4,
    RCC_LSE = 5,
    RCC_LSI = 6
}

alias RCC_PLL = rcc_osc.RCC_PLL;
alias RCC_PLLSAI = rcc_osc.RCC_PLLSAI;
alias RCC_PLLI2S = rcc_osc.RCC_PLLI2S;
alias RCC_HSE = rcc_osc.RCC_HSE;
alias RCC_HSI = rcc_osc.RCC_HSI;
alias RCC_LSE = rcc_osc.RCC_LSE;
alias RCC_LSI = rcc_osc.RCC_LSI;

extern (D) auto _REG_BIT(T0, T1)(auto ref T0 base, auto ref T1 bit)
{
    return (base << 5) + bit;
}

enum rcc_periph_clken
{
    /* AHB1 peripherals*/
    RCC_GPIOA = _REG_BIT(0x30, 0),
    RCC_GPIOB = _REG_BIT(0x30, 1),
    RCC_GPIOC = _REG_BIT(0x30, 2),
    RCC_GPIOD = _REG_BIT(0x30, 3),
    RCC_GPIOE = _REG_BIT(0x30, 4),
    RCC_GPIOF = _REG_BIT(0x30, 5),
    RCC_GPIOG = _REG_BIT(0x30, 6),
    RCC_GPIOH = _REG_BIT(0x30, 7),
    RCC_GPIOI = _REG_BIT(0x30, 8),
    RCC_GPIOJ = _REG_BIT(0x30, 9),
    RCC_GPIOK = _REG_BIT(0x30, 10),
    RCC_CRC = _REG_BIT(0x30, 12),
    RCC_BKPSRAM = _REG_BIT(0x30, 18),
    RCC_CCMDATARAM = _REG_BIT(0x30, 20),
    RCC_DMA1 = _REG_BIT(0x30, 21),
    RCC_DMA2 = _REG_BIT(0x30, 22),
    RCC_DMA2D = _REG_BIT(0x30, 23),
    RCC_ETHMAC = _REG_BIT(0x30, 25),
    RCC_ETHMACTX = _REG_BIT(0x30, 26),
    RCC_ETHMACRX = _REG_BIT(0x30, 27),
    RCC_ETHMACPTP = _REG_BIT(0x30, 28),
    RCC_OTGHS = _REG_BIT(0x30, 29),
    RCC_OTGHSULPI = _REG_BIT(0x30, 30),

    /* AHB2 peripherals */
    RCC_DCMI = _REG_BIT(0x34, 0),
    RCC_CRYP = _REG_BIT(0x34, 4),
    RCC_HASH = _REG_BIT(0x34, 5),
    RCC_RNG = _REG_BIT(0x34, 6),
    RCC_OTGFS = _REG_BIT(0x34, 7),

    /* AHB3 peripherals */
    RCC_FSMC = _REG_BIT(0x38, 0),
    RCC_FMC = _REG_BIT(0x38, 0),
    RCC_QUADSPI = _REG_BIT(0x38, 1),

    /* APB1 peripherals*/
    RCC_TIM2 = _REG_BIT(0x40, 0),
    RCC_TIM3 = _REG_BIT(0x40, 1),
    RCC_TIM4 = _REG_BIT(0x40, 2),
    RCC_TIM5 = _REG_BIT(0x40, 3),
    RCC_TIM6 = _REG_BIT(0x40, 4),
    RCC_TIM7 = _REG_BIT(0x40, 5),
    RCC_TIM12 = _REG_BIT(0x40, 6),
    RCC_TIM13 = _REG_BIT(0x40, 7),
    RCC_TIM14 = _REG_BIT(0x40, 8),
    RCC_WWDG = _REG_BIT(0x40, 11),
    RCC_SPI2 = _REG_BIT(0x40, 14),
    RCC_SPI3 = _REG_BIT(0x40, 15),
    RCC_USART2 = _REG_BIT(0x40, 17),
    RCC_USART3 = _REG_BIT(0x40, 18),
    RCC_UART4 = _REG_BIT(0x40, 19),
    RCC_UART5 = _REG_BIT(0x40, 20),
    RCC_I2C1 = _REG_BIT(0x40, 21),
    RCC_I2C2 = _REG_BIT(0x40, 22),
    RCC_I2C3 = _REG_BIT(0x40, 23),
    RCC_CAN1 = _REG_BIT(0x40, 25),
    RCC_CAN2 = _REG_BIT(0x40, 26),
    RCC_PWR = _REG_BIT(0x40, 28),
    RCC_DAC = _REG_BIT(0x40, 29),
    RCC_UART7 = _REG_BIT(0x40, 30), /* F2xx, F3xx */
    RCC_UART8 = _REG_BIT(0x40, 31), /* F2xx, F3xx */

    /* APB2 peripherals */
    RCC_TIM1 = _REG_BIT(0x44, 0),
    RCC_TIM8 = _REG_BIT(0x44, 1),
    RCC_USART1 = _REG_BIT(0x44, 4),
    RCC_USART6 = _REG_BIT(0x44, 5),
    RCC_ADC1 = _REG_BIT(0x44, 8),
    RCC_ADC2 = _REG_BIT(0x44, 9),
    RCC_ADC3 = _REG_BIT(0x44, 10),
    RCC_SDIO = _REG_BIT(0x44, 11),
    RCC_SPI1 = _REG_BIT(0x44, 12),
    RCC_SPI4 = _REG_BIT(0x44, 13), /* F2xx, F3xx */
    RCC_SYSCFG = _REG_BIT(0x44, 14),
    RCC_TIM9 = _REG_BIT(0x44, 16),
    RCC_TIM10 = _REG_BIT(0x44, 17),
    RCC_TIM11 = _REG_BIT(0x44, 18),
    RCC_SPI5 = _REG_BIT(0x44, 20), /* F2xx, F3xx */
    RCC_SPI6 = _REG_BIT(0x44, 21), /* F2xx, F3xx */
    RCC_SAI1EN = _REG_BIT(0x44, 22), /* F42x, F43x */
    RCC_LTDC = _REG_BIT(0x44, 26), /* F42x, F43x */
    RCC_DSI = _REG_BIT(0x44, 27), /* F4x9, F4x9 */

    /* BDCR */
    RCC_RTC = _REG_BIT(0x70, 15),

    /* AHB1 peripherals*/
    SCC_GPIOA = _REG_BIT(0x50, 0),
    SCC_GPIOB = _REG_BIT(0x50, 1),
    SCC_GPIOC = _REG_BIT(0x50, 2),
    SCC_GPIOD = _REG_BIT(0x50, 3),
    SCC_GPIOE = _REG_BIT(0x50, 4),
    SCC_GPIOF = _REG_BIT(0x50, 5),
    SCC_GPIOG = _REG_BIT(0x50, 6),
    SCC_GPIOH = _REG_BIT(0x50, 7),
    SCC_GPIOI = _REG_BIT(0x50, 8),
    SCC_GPIOJ = _REG_BIT(0x50, 9),
    SCC_GPIOK = _REG_BIT(0x50, 10),
    SCC_CRC = _REG_BIT(0x50, 12),
    SCC_FLTIF = _REG_BIT(0x50, 15),
    SCC_SRAM1 = _REG_BIT(0x50, 16),
    SCC_SRAM2 = _REG_BIT(0x50, 17),
    SCC_BKPSRAM = _REG_BIT(0x50, 18),
    SCC_SRAM3 = _REG_BIT(0x50, 19), /* F2xx, F3xx */
    SCC_DMA1 = _REG_BIT(0x50, 21),
    SCC_DMA2 = _REG_BIT(0x50, 22),
    SCC_DMA2D = _REG_BIT(0x50, 23), /* F4x9 */
    SCC_ETHMAC = _REG_BIT(0x50, 25),
    SCC_ETHMACTX = _REG_BIT(0x50, 26),
    SCC_ETHMACRX = _REG_BIT(0x50, 27),
    SCC_ETHMACPTP = _REG_BIT(0x50, 28),
    SCC_OTGHS = _REG_BIT(0x50, 29),
    SCC_OTGHSULPI = _REG_BIT(0x50, 30),

    /* AHB2 peripherals */
    SCC_DCMI = _REG_BIT(0x54, 0),
    SCC_CRYP = _REG_BIT(0x54, 4),
    SCC_HASH = _REG_BIT(0x54, 5),
    SCC_RNG = _REG_BIT(0x54, 6),
    SCC_OTGFS = _REG_BIT(0x54, 7),

    /* AHB3 peripherals */
    SCC_QSPIC = _REG_BIT(0x58, 1),
    SCC_FMC = _REG_BIT(0x58, 0),
    SCC_FSMC = _REG_BIT(0x58, 0),

    /* APB1 peripherals*/
    SCC_TIM2 = _REG_BIT(0x60, 0),
    SCC_TIM3 = _REG_BIT(0x60, 1),
    SCC_TIM4 = _REG_BIT(0x60, 2),
    SCC_TIM5 = _REG_BIT(0x60, 3),
    SCC_TIM6 = _REG_BIT(0x60, 4),
    SCC_TIM7 = _REG_BIT(0x60, 5),
    SCC_TIM12 = _REG_BIT(0x60, 6),
    SCC_TIM13 = _REG_BIT(0x60, 7),
    SCC_TIM14 = _REG_BIT(0x60, 8),
    SCC_WWDG = _REG_BIT(0x60, 11),
    SCC_SPI2 = _REG_BIT(0x60, 14),
    SCC_SPI3 = _REG_BIT(0x60, 15),
    SCC_USART2 = _REG_BIT(0x60, 17),
    SCC_USART3 = _REG_BIT(0x60, 18),
    SCC_UART4 = _REG_BIT(0x60, 19),
    SCC_UART5 = _REG_BIT(0x60, 20),
    SCC_I2C1 = _REG_BIT(0x60, 21),
    SCC_I2C2 = _REG_BIT(0x60, 22),
    SCC_I2C3 = _REG_BIT(0x60, 23),
    SCC_CAN1 = _REG_BIT(0x60, 25),
    SCC_CAN2 = _REG_BIT(0x60, 26),
    SCC_PWR = _REG_BIT(0x60, 28),
    SCC_DAC = _REG_BIT(0x60, 29),
    SCC_UART7 = _REG_BIT(0x60, 30), /* F2xx, F3xx */
    SCC_UART8 = _REG_BIT(0x60, 31), /* F2xx, F3xx */

    /* APB2 peripherals */
    SCC_TIM1 = _REG_BIT(0x64, 0),
    SCC_TIM8 = _REG_BIT(0x64, 1),
    SCC_USART1 = _REG_BIT(0x64, 4),
    SCC_USART6 = _REG_BIT(0x64, 5),
    SCC_ADC1 = _REG_BIT(0x64, 8),
    SCC_ADC2 = _REG_BIT(0x64, 9),
    SCC_ADC3 = _REG_BIT(0x64, 10),
    SCC_SDIO = _REG_BIT(0x64, 11),
    SCC_SPI1 = _REG_BIT(0x64, 12),
    SCC_SPI4 = _REG_BIT(0x64, 13), /* F2xx, F3xx */
    SCC_SYSCFG = _REG_BIT(0x64, 14),
    SCC_TIM9 = _REG_BIT(0x64, 16),
    SCC_TIM10 = _REG_BIT(0x64, 17),
    SCC_TIM11 = _REG_BIT(0x64, 18),
    SCC_SPI5 = _REG_BIT(0x64, 20), /* F2xx, F3xx */
    SCC_SPI6 = _REG_BIT(0x64, 21), /* F2xx, F3xx */
    SCC_SAI1 = _REG_BIT(0x64, 22), /* F4x9 */
    SCC_LTDC = _REG_BIT(0x64, 26), /* F4x9 */
    SCC_DSI = _REG_BIT(0x64, 27) /* F4x9 */
}

alias RCC_GPIOA = rcc_periph_clken.RCC_GPIOA;
alias RCC_GPIOB = rcc_periph_clken.RCC_GPIOB;
alias RCC_GPIOC = rcc_periph_clken.RCC_GPIOC;
alias RCC_GPIOD = rcc_periph_clken.RCC_GPIOD;
alias RCC_GPIOE = rcc_periph_clken.RCC_GPIOE;
alias RCC_GPIOF = rcc_periph_clken.RCC_GPIOF;
alias RCC_GPIOG = rcc_periph_clken.RCC_GPIOG;
alias RCC_GPIOH = rcc_periph_clken.RCC_GPIOH;
alias RCC_GPIOI = rcc_periph_clken.RCC_GPIOI;
alias RCC_GPIOJ = rcc_periph_clken.RCC_GPIOJ;
alias RCC_GPIOK = rcc_periph_clken.RCC_GPIOK;
alias RCC_CRC = rcc_periph_clken.RCC_CRC;
alias RCC_BKPSRAM = rcc_periph_clken.RCC_BKPSRAM;
alias RCC_CCMDATARAM = rcc_periph_clken.RCC_CCMDATARAM;
alias RCC_DMA1 = rcc_periph_clken.RCC_DMA1;
alias RCC_DMA2 = rcc_periph_clken.RCC_DMA2;
alias RCC_DMA2D = rcc_periph_clken.RCC_DMA2D;
alias RCC_ETHMAC = rcc_periph_clken.RCC_ETHMAC;
alias RCC_ETHMACTX = rcc_periph_clken.RCC_ETHMACTX;
alias RCC_ETHMACRX = rcc_periph_clken.RCC_ETHMACRX;
alias RCC_ETHMACPTP = rcc_periph_clken.RCC_ETHMACPTP;
alias RCC_OTGHS = rcc_periph_clken.RCC_OTGHS;
alias RCC_OTGHSULPI = rcc_periph_clken.RCC_OTGHSULPI;
alias RCC_DCMI = rcc_periph_clken.RCC_DCMI;
alias RCC_CRYP = rcc_periph_clken.RCC_CRYP;
alias RCC_HASH = rcc_periph_clken.RCC_HASH;
alias RCC_RNG = rcc_periph_clken.RCC_RNG;
alias RCC_OTGFS = rcc_periph_clken.RCC_OTGFS;
alias RCC_FSMC = rcc_periph_clken.RCC_FSMC;
alias RCC_FMC = rcc_periph_clken.RCC_FMC;
alias RCC_QUADSPI = rcc_periph_clken.RCC_QUADSPI;
alias RCC_TIM2 = rcc_periph_clken.RCC_TIM2;
alias RCC_TIM3 = rcc_periph_clken.RCC_TIM3;
alias RCC_TIM4 = rcc_periph_clken.RCC_TIM4;
alias RCC_TIM5 = rcc_periph_clken.RCC_TIM5;
alias RCC_TIM6 = rcc_periph_clken.RCC_TIM6;
alias RCC_TIM7 = rcc_periph_clken.RCC_TIM7;
alias RCC_TIM12 = rcc_periph_clken.RCC_TIM12;
alias RCC_TIM13 = rcc_periph_clken.RCC_TIM13;
alias RCC_TIM14 = rcc_periph_clken.RCC_TIM14;
alias RCC_WWDG = rcc_periph_clken.RCC_WWDG;
alias RCC_SPI2 = rcc_periph_clken.RCC_SPI2;
alias RCC_SPI3 = rcc_periph_clken.RCC_SPI3;
alias RCC_USART2 = rcc_periph_clken.RCC_USART2;
alias RCC_USART3 = rcc_periph_clken.RCC_USART3;
alias RCC_UART4 = rcc_periph_clken.RCC_UART4;
alias RCC_UART5 = rcc_periph_clken.RCC_UART5;
alias RCC_I2C1 = rcc_periph_clken.RCC_I2C1;
alias RCC_I2C2 = rcc_periph_clken.RCC_I2C2;
alias RCC_I2C3 = rcc_periph_clken.RCC_I2C3;
alias RCC_CAN1 = rcc_periph_clken.RCC_CAN1;
alias RCC_CAN2 = rcc_periph_clken.RCC_CAN2;
alias RCC_PWR = rcc_periph_clken.RCC_PWR;
alias RCC_DAC = rcc_periph_clken.RCC_DAC;
alias RCC_UART7 = rcc_periph_clken.RCC_UART7;
alias RCC_UART8 = rcc_periph_clken.RCC_UART8;
alias RCC_TIM1 = rcc_periph_clken.RCC_TIM1;
alias RCC_TIM8 = rcc_periph_clken.RCC_TIM8;
alias RCC_USART1 = rcc_periph_clken.RCC_USART1;
alias RCC_USART6 = rcc_periph_clken.RCC_USART6;
alias RCC_ADC1 = rcc_periph_clken.RCC_ADC1;
alias RCC_ADC2 = rcc_periph_clken.RCC_ADC2;
alias RCC_ADC3 = rcc_periph_clken.RCC_ADC3;
alias RCC_SDIO = rcc_periph_clken.RCC_SDIO;
alias RCC_SPI1 = rcc_periph_clken.RCC_SPI1;
alias RCC_SPI4 = rcc_periph_clken.RCC_SPI4;
alias RCC_SYSCFG = rcc_periph_clken.RCC_SYSCFG;
alias RCC_TIM9 = rcc_periph_clken.RCC_TIM9;
alias RCC_TIM10 = rcc_periph_clken.RCC_TIM10;
alias RCC_TIM11 = rcc_periph_clken.RCC_TIM11;
alias RCC_SPI5 = rcc_periph_clken.RCC_SPI5;
alias RCC_SPI6 = rcc_periph_clken.RCC_SPI6;
alias RCC_SAI1EN = rcc_periph_clken.RCC_SAI1EN;
alias RCC_LTDC = rcc_periph_clken.RCC_LTDC;
alias RCC_DSI = rcc_periph_clken.RCC_DSI;
alias RCC_RTC = rcc_periph_clken.RCC_RTC;
alias SCC_GPIOA = rcc_periph_clken.SCC_GPIOA;
alias SCC_GPIOB = rcc_periph_clken.SCC_GPIOB;
alias SCC_GPIOC = rcc_periph_clken.SCC_GPIOC;
alias SCC_GPIOD = rcc_periph_clken.SCC_GPIOD;
alias SCC_GPIOE = rcc_periph_clken.SCC_GPIOE;
alias SCC_GPIOF = rcc_periph_clken.SCC_GPIOF;
alias SCC_GPIOG = rcc_periph_clken.SCC_GPIOG;
alias SCC_GPIOH = rcc_periph_clken.SCC_GPIOH;
alias SCC_GPIOI = rcc_periph_clken.SCC_GPIOI;
alias SCC_GPIOJ = rcc_periph_clken.SCC_GPIOJ;
alias SCC_GPIOK = rcc_periph_clken.SCC_GPIOK;
alias SCC_CRC = rcc_periph_clken.SCC_CRC;
alias SCC_FLTIF = rcc_periph_clken.SCC_FLTIF;
alias SCC_SRAM1 = rcc_periph_clken.SCC_SRAM1;
alias SCC_SRAM2 = rcc_periph_clken.SCC_SRAM2;
alias SCC_BKPSRAM = rcc_periph_clken.SCC_BKPSRAM;
alias SCC_SRAM3 = rcc_periph_clken.SCC_SRAM3;
alias SCC_DMA1 = rcc_periph_clken.SCC_DMA1;
alias SCC_DMA2 = rcc_periph_clken.SCC_DMA2;
alias SCC_DMA2D = rcc_periph_clken.SCC_DMA2D;
alias SCC_ETHMAC = rcc_periph_clken.SCC_ETHMAC;
alias SCC_ETHMACTX = rcc_periph_clken.SCC_ETHMACTX;
alias SCC_ETHMACRX = rcc_periph_clken.SCC_ETHMACRX;
alias SCC_ETHMACPTP = rcc_periph_clken.SCC_ETHMACPTP;
alias SCC_OTGHS = rcc_periph_clken.SCC_OTGHS;
alias SCC_OTGHSULPI = rcc_periph_clken.SCC_OTGHSULPI;
alias SCC_DCMI = rcc_periph_clken.SCC_DCMI;
alias SCC_CRYP = rcc_periph_clken.SCC_CRYP;
alias SCC_HASH = rcc_periph_clken.SCC_HASH;
alias SCC_RNG = rcc_periph_clken.SCC_RNG;
alias SCC_OTGFS = rcc_periph_clken.SCC_OTGFS;
alias SCC_QSPIC = rcc_periph_clken.SCC_QSPIC;
alias SCC_FMC = rcc_periph_clken.SCC_FMC;
alias SCC_FSMC = rcc_periph_clken.SCC_FSMC;
alias SCC_TIM2 = rcc_periph_clken.SCC_TIM2;
alias SCC_TIM3 = rcc_periph_clken.SCC_TIM3;
alias SCC_TIM4 = rcc_periph_clken.SCC_TIM4;
alias SCC_TIM5 = rcc_periph_clken.SCC_TIM5;
alias SCC_TIM6 = rcc_periph_clken.SCC_TIM6;
alias SCC_TIM7 = rcc_periph_clken.SCC_TIM7;
alias SCC_TIM12 = rcc_periph_clken.SCC_TIM12;
alias SCC_TIM13 = rcc_periph_clken.SCC_TIM13;
alias SCC_TIM14 = rcc_periph_clken.SCC_TIM14;
alias SCC_WWDG = rcc_periph_clken.SCC_WWDG;
alias SCC_SPI2 = rcc_periph_clken.SCC_SPI2;
alias SCC_SPI3 = rcc_periph_clken.SCC_SPI3;
alias SCC_USART2 = rcc_periph_clken.SCC_USART2;
alias SCC_USART3 = rcc_periph_clken.SCC_USART3;
alias SCC_UART4 = rcc_periph_clken.SCC_UART4;
alias SCC_UART5 = rcc_periph_clken.SCC_UART5;
alias SCC_I2C1 = rcc_periph_clken.SCC_I2C1;
alias SCC_I2C2 = rcc_periph_clken.SCC_I2C2;
alias SCC_I2C3 = rcc_periph_clken.SCC_I2C3;
alias SCC_CAN1 = rcc_periph_clken.SCC_CAN1;
alias SCC_CAN2 = rcc_periph_clken.SCC_CAN2;
alias SCC_PWR = rcc_periph_clken.SCC_PWR;
alias SCC_DAC = rcc_periph_clken.SCC_DAC;
alias SCC_UART7 = rcc_periph_clken.SCC_UART7;
alias SCC_UART8 = rcc_periph_clken.SCC_UART8;
alias SCC_TIM1 = rcc_periph_clken.SCC_TIM1;
alias SCC_TIM8 = rcc_periph_clken.SCC_TIM8;
alias SCC_USART1 = rcc_periph_clken.SCC_USART1;
alias SCC_USART6 = rcc_periph_clken.SCC_USART6;
alias SCC_ADC1 = rcc_periph_clken.SCC_ADC1;
alias SCC_ADC2 = rcc_periph_clken.SCC_ADC2;
alias SCC_ADC3 = rcc_periph_clken.SCC_ADC3;
alias SCC_SDIO = rcc_periph_clken.SCC_SDIO;
alias SCC_SPI1 = rcc_periph_clken.SCC_SPI1;
alias SCC_SPI4 = rcc_periph_clken.SCC_SPI4;
alias SCC_SYSCFG = rcc_periph_clken.SCC_SYSCFG;
alias SCC_TIM9 = rcc_periph_clken.SCC_TIM9;
alias SCC_TIM10 = rcc_periph_clken.SCC_TIM10;
alias SCC_TIM11 = rcc_periph_clken.SCC_TIM11;
alias SCC_SPI5 = rcc_periph_clken.SCC_SPI5;
alias SCC_SPI6 = rcc_periph_clken.SCC_SPI6;
alias SCC_SAI1 = rcc_periph_clken.SCC_SAI1;
alias SCC_LTDC = rcc_periph_clken.SCC_LTDC;
alias SCC_DSI = rcc_periph_clken.SCC_DSI;

enum rcc_periph_rst
{
    /* AHB1 peripherals*/
    RST_GPIOA = _REG_BIT(0x10, 0),
    RST_GPIOB = _REG_BIT(0x10, 1),
    RST_GPIOC = _REG_BIT(0x10, 2),
    RST_GPIOD = _REG_BIT(0x10, 3),
    RST_GPIOE = _REG_BIT(0x10, 4),
    RST_GPIOF = _REG_BIT(0x10, 5),
    RST_GPIOG = _REG_BIT(0x10, 6),
    RST_GPIOH = _REG_BIT(0x10, 7),
    RST_GPIOI = _REG_BIT(0x10, 8),
    RST_GPIOJ = _REG_BIT(0x10, 9),
    RST_GPIOK = _REG_BIT(0x10, 10),
    RST_CRC = _REG_BIT(0x10, 12),
    RST_DMA1 = _REG_BIT(0x10, 21),
    RST_DMA2 = _REG_BIT(0x10, 22),
    RST_DMA2D = _REG_BIT(0x10, 23),
    RST_ETHMAC = _REG_BIT(0x10, 25),
    RST_OTGHS = _REG_BIT(0x10, 29),

    /* AHB2 peripherals */
    RST_DCMI = _REG_BIT(0x14, 0),
    RST_CRYP = _REG_BIT(0x14, 4),
    RST_HASH = _REG_BIT(0x14, 5),
    RST_RNG = _REG_BIT(0x14, 6),
    RST_OTGFS = _REG_BIT(0x14, 7),

    /* AHB3 peripherals */
    RST_QSPI = _REG_BIT(0x18, 1), /* F4x9 */
    RST_FSMC = _REG_BIT(0x18, 0),
    RST_FMC = _REG_BIT(0x18, 0), /* F4x9 */

    /* APB1 peripherals*/
    RST_TIM2 = _REG_BIT(0x20, 0),
    RST_TIM3 = _REG_BIT(0x20, 1),
    RST_TIM4 = _REG_BIT(0x20, 2),
    RST_TIM5 = _REG_BIT(0x20, 3),
    RST_TIM6 = _REG_BIT(0x20, 4),
    RST_TIM7 = _REG_BIT(0x20, 5),
    RST_TIM12 = _REG_BIT(0x20, 6),
    RST_TIM13 = _REG_BIT(0x20, 7),
    RST_TIM14 = _REG_BIT(0x20, 8),
    RST_WWDG = _REG_BIT(0x20, 11),
    RST_SPI2 = _REG_BIT(0x20, 14),
    RST_SPI3 = _REG_BIT(0x20, 15),
    RST_USART2 = _REG_BIT(0x20, 17),
    RST_USART3 = _REG_BIT(0x20, 18),
    RST_UART4 = _REG_BIT(0x20, 19),
    RST_UART5 = _REG_BIT(0x20, 20),
    RST_I2C1 = _REG_BIT(0x20, 21),
    RST_I2C2 = _REG_BIT(0x20, 22),
    RST_I2C3 = _REG_BIT(0x20, 23),
    RST_CAN1 = _REG_BIT(0x20, 25),
    RST_CAN2 = _REG_BIT(0x20, 26),
    RST_PWR = _REG_BIT(0x20, 28),
    RST_DAC = _REG_BIT(0x20, 29),
    RST_UART7 = _REG_BIT(0x20, 30), /* F2xx, F3xx */
    RST_UART8 = _REG_BIT(0x20, 31), /* F2xx, F3xx */

    /* APB2 peripherals */
    RST_TIM1 = _REG_BIT(0x24, 0),
    RST_TIM8 = _REG_BIT(0x24, 1),
    RST_USART1 = _REG_BIT(0x24, 4),
    RST_USART6 = _REG_BIT(0x24, 5),
    RST_ADC = _REG_BIT(0x24, 8),
    RST_SDIO = _REG_BIT(0x24, 11),
    RST_SPI1 = _REG_BIT(0x24, 12),
    RST_SPI4 = _REG_BIT(0x24, 13), /* F2xx, F3xx */
    RST_SYSCFG = _REG_BIT(0x24, 14),
    RST_TIM9 = _REG_BIT(0x24, 16),
    RST_TIM10 = _REG_BIT(0x24, 17),
    RST_TIM11 = _REG_BIT(0x24, 18),
    RST_SPI5 = _REG_BIT(0x24, 20), /* F2xx, F3xx */
    RST_SPI6 = _REG_BIT(0x24, 21), /* F2xx, F3xx */
    RST_SAI1RST = _REG_BIT(0x24, 22), /* F42x, F43x */
    RST_LTDC = _REG_BIT(0x24, 26), /* F42x, F43x */
    RST_DSI = _REG_BIT(0x24, 27), /* F42x, F43x */

    /* Backup domain control */
    RST_BDCR = _REG_BIT(0x70, 16) /* BDCR[16] */
}

alias RST_GPIOA = rcc_periph_rst.RST_GPIOA;
alias RST_GPIOB = rcc_periph_rst.RST_GPIOB;
alias RST_GPIOC = rcc_periph_rst.RST_GPIOC;
alias RST_GPIOD = rcc_periph_rst.RST_GPIOD;
alias RST_GPIOE = rcc_periph_rst.RST_GPIOE;
alias RST_GPIOF = rcc_periph_rst.RST_GPIOF;
alias RST_GPIOG = rcc_periph_rst.RST_GPIOG;
alias RST_GPIOH = rcc_periph_rst.RST_GPIOH;
alias RST_GPIOI = rcc_periph_rst.RST_GPIOI;
alias RST_GPIOJ = rcc_periph_rst.RST_GPIOJ;
alias RST_GPIOK = rcc_periph_rst.RST_GPIOK;
alias RST_CRC = rcc_periph_rst.RST_CRC;
alias RST_DMA1 = rcc_periph_rst.RST_DMA1;
alias RST_DMA2 = rcc_periph_rst.RST_DMA2;
alias RST_DMA2D = rcc_periph_rst.RST_DMA2D;
alias RST_ETHMAC = rcc_periph_rst.RST_ETHMAC;
alias RST_OTGHS = rcc_periph_rst.RST_OTGHS;
alias RST_DCMI = rcc_periph_rst.RST_DCMI;
alias RST_CRYP = rcc_periph_rst.RST_CRYP;
alias RST_HASH = rcc_periph_rst.RST_HASH;
alias RST_RNG = rcc_periph_rst.RST_RNG;
alias RST_OTGFS = rcc_periph_rst.RST_OTGFS;
alias RST_QSPI = rcc_periph_rst.RST_QSPI;
alias RST_FSMC = rcc_periph_rst.RST_FSMC;
alias RST_FMC = rcc_periph_rst.RST_FMC;
alias RST_TIM2 = rcc_periph_rst.RST_TIM2;
alias RST_TIM3 = rcc_periph_rst.RST_TIM3;
alias RST_TIM4 = rcc_periph_rst.RST_TIM4;
alias RST_TIM5 = rcc_periph_rst.RST_TIM5;
alias RST_TIM6 = rcc_periph_rst.RST_TIM6;
alias RST_TIM7 = rcc_periph_rst.RST_TIM7;
alias RST_TIM12 = rcc_periph_rst.RST_TIM12;
alias RST_TIM13 = rcc_periph_rst.RST_TIM13;
alias RST_TIM14 = rcc_periph_rst.RST_TIM14;
alias RST_WWDG = rcc_periph_rst.RST_WWDG;
alias RST_SPI2 = rcc_periph_rst.RST_SPI2;
alias RST_SPI3 = rcc_periph_rst.RST_SPI3;
alias RST_USART2 = rcc_periph_rst.RST_USART2;
alias RST_USART3 = rcc_periph_rst.RST_USART3;
alias RST_UART4 = rcc_periph_rst.RST_UART4;
alias RST_UART5 = rcc_periph_rst.RST_UART5;
alias RST_I2C1 = rcc_periph_rst.RST_I2C1;
alias RST_I2C2 = rcc_periph_rst.RST_I2C2;
alias RST_I2C3 = rcc_periph_rst.RST_I2C3;
alias RST_CAN1 = rcc_periph_rst.RST_CAN1;
alias RST_CAN2 = rcc_periph_rst.RST_CAN2;
alias RST_PWR = rcc_periph_rst.RST_PWR;
alias RST_DAC = rcc_periph_rst.RST_DAC;
alias RST_UART7 = rcc_periph_rst.RST_UART7;
alias RST_UART8 = rcc_periph_rst.RST_UART8;
alias RST_TIM1 = rcc_periph_rst.RST_TIM1;
alias RST_TIM8 = rcc_periph_rst.RST_TIM8;
alias RST_USART1 = rcc_periph_rst.RST_USART1;
alias RST_USART6 = rcc_periph_rst.RST_USART6;
alias RST_ADC = rcc_periph_rst.RST_ADC;
alias RST_SDIO = rcc_periph_rst.RST_SDIO;
alias RST_SPI1 = rcc_periph_rst.RST_SPI1;
alias RST_SPI4 = rcc_periph_rst.RST_SPI4;
alias RST_SYSCFG = rcc_periph_rst.RST_SYSCFG;
alias RST_TIM9 = rcc_periph_rst.RST_TIM9;
alias RST_TIM10 = rcc_periph_rst.RST_TIM10;
alias RST_TIM11 = rcc_periph_rst.RST_TIM11;
alias RST_SPI5 = rcc_periph_rst.RST_SPI5;
alias RST_SPI6 = rcc_periph_rst.RST_SPI6;
alias RST_SAI1RST = rcc_periph_rst.RST_SAI1RST;
alias RST_LTDC = rcc_periph_rst.RST_LTDC;
alias RST_DSI = rcc_periph_rst.RST_DSI;
alias RST_BDCR = rcc_periph_rst.RST_BDCR;

/** @addtogroup rcc_defines
 *
 * @author @htmlonly &copy; @endhtmlonly 2013
 * Frantisek Burian <BuFran@seznam.cz>
 */
/*
 * This file is part of the libopencm3 project.
 *
 * Copyright (C) 2013 Frantisek Burian <BuFran@seznam.cz>
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

/* THIS FILE SHOULD NOT BE INCLUDED DIRECTLY, BUT ONLY VIA RCC.H
 * The order of header inclusion is important. rcc.h defines the device
 * specific enumerations before including this header file.
 */

/** @cond */

/** @endcond */

/**@{*/

extern(C) {


void rcc_peripheral_enable_clock (uint* reg, uint en);
void rcc_peripheral_disable_clock (uint* reg, uint en);
void rcc_peripheral_reset (uint* reg, uint reset);
void rcc_peripheral_clear_reset (uint* reg, uint clear_reset);

void rcc_periph_clock_enable (rcc_periph_clken clken);
void rcc_periph_clock_disable (rcc_periph_clken clken);
void rcc_periph_reset_pulse (rcc_periph_rst rst);
void rcc_periph_reset_hold (rcc_periph_rst rst);
void rcc_periph_reset_release (rcc_periph_rst rst);

void rcc_set_mco (uint mcosrc);
void rcc_osc_bypass_enable (rcc_osc osc);
void rcc_osc_bypass_disable (rcc_osc osc);

/**
 * Is the given oscillator ready?
 * @param osc Oscillator ID
 * @return true if the hardware indicates the oscillator is ready.
 */
bool rcc_is_osc_ready (rcc_osc osc);

/**
 * Wait for Oscillator Ready.
 * Block until the hardware indicates that the Oscillator is ready.
 * @param osc Oscillator ID
 */
void rcc_wait_for_osc_ready (rcc_osc osc);

/**
 * This will return the divisor 1/2/4/8/16/64/128/256/512 which is set as a
 * 4-bit value, typically used for hpre and other prescalers.
 * @param div_val  Masked and shifted divider value from register (e.g. RCC_CFGR)
 */
ushort rcc_get_div_from_hpre (ubyte div_val);

/**@}*/

/** @cond */

/** @endcond */

void rcc_osc_ready_int_clear (rcc_osc osc);
void rcc_osc_ready_int_enable (rcc_osc osc);
void rcc_osc_ready_int_disable (rcc_osc osc);
int rcc_osc_ready_int_flag (rcc_osc osc);
void rcc_css_int_clear ();
int rcc_css_int_flag ();
void rcc_wait_for_sysclk_status (rcc_osc osc);
void rcc_osc_on (rcc_osc osc);
void rcc_osc_off (rcc_osc osc);
void rcc_css_enable ();
void rcc_css_disable ();
void rcc_plli2s_config (ushort n, ubyte r);
void rcc_pllsai_config (ushort n, ushort p, ushort q, ushort r);
void rcc_pllsai_postscalers (ubyte q, ubyte r);
void rcc_set_sysclk_source (uint clk);
void rcc_set_pll_source (uint pllsrc);
void rcc_set_ppre2 (uint ppre2);
void rcc_set_ppre1 (uint ppre1);
void rcc_set_hpre (uint hpre);
void rcc_set_rtcpre (uint rtcpre);
void rcc_set_main_pll_hsi (
    uint pllm,
    uint plln,
    uint pllp,
    uint pllq,
    uint pllr);
void rcc_set_main_pll_hse (
    uint pllm,
    uint plln,
    uint pllp,
    uint pllq,
    uint pllr);
uint rcc_system_clock_source ();
void rcc_clock_setup_pll (const(rcc_clock_scale)* clock);
void rcc_clock_setup_hse_3v3 (const(rcc_clock_scale)* clock);
uint rcc_get_usart_clk_freq (uint usart);
uint rcc_get_timer_clk_freq (uint timer);
uint rcc_get_i2c_clk_freq (uint i2c);
uint rcc_get_spi_clk_freq (uint spi);
}

/**@}*/

