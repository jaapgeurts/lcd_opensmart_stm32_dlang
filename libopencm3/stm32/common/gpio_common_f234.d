module libopencm3.stm32.common.gpio_common_f234;

public import libopencm3.stm32.common.gpio_common_all;

/* GPIO port base addresses (for convenience) */
/** @defgroup gpio_port_id GPIO Port IDs
@ingroup gpio_defines

@{*/
enum GPIOA = GPIO_PORT_A_BASE;
enum GPIOB = GPIO_PORT_B_BASE;
enum GPIOC = GPIO_PORT_C_BASE;
enum GPIOD = GPIO_PORT_D_BASE;
enum GPIOE = GPIO_PORT_E_BASE;
enum GPIOF = GPIO_PORT_F_BASE;
enum GPIOG = GPIO_PORT_G_BASE;
enum GPIOH = GPIO_PORT_H_BASE;

/**@}*/

/* --- GPIO registers for STM32F2, STM32F3 and STM32F4 --------------------- */

/* Port mode register (GPIOx_MODER) */
enum GPIO_MODER(uint port) = MMIO32!(port + 0x00);
// extern (D) auto GPIO_MODER(T)(auto ref T port)
// {
//     return MMIO32(port + 0x00);
// }

enum GPIOA_MODER = GPIO_MODER!(GPIOA);
enum GPIOB_MODER = GPIO_MODER!(GPIOB);
enum GPIOC_MODER = GPIO_MODER!(GPIOC);
enum GPIOD_MODER = GPIO_MODER!(GPIOD);
enum GPIOE_MODER = GPIO_MODER!(GPIOE);
enum GPIOF_MODER = GPIO_MODER!(GPIOF);
enum GPIOG_MODER = GPIO_MODER!(GPIOG);
enum GPIOH_MODER = GPIO_MODER!(GPIOH);

/* Port output type register (GPIOx_OTYPER) */
enum GPIO_OTYPER(uint port) = MMIO32!(port + 0x04);
// extern (D) auto GPIO_OTYPER(T)(auto ref T port)
// {
//     return MMIO32(port + 0x04);
// }

enum GPIOA_OTYPER = GPIO_OTYPER!(GPIOA);
enum GPIOB_OTYPER = GPIO_OTYPER!(GPIOB);
enum GPIOC_OTYPER = GPIO_OTYPER!(GPIOC);
enum GPIOD_OTYPER = GPIO_OTYPER!(GPIOD);
enum GPIOE_OTYPER = GPIO_OTYPER!(GPIOE);
enum GPIOF_OTYPER = GPIO_OTYPER!(GPIOF);
enum GPIOG_OTYPER = GPIO_OTYPER!(GPIOG);
enum GPIOH_OTYPER = GPIO_OTYPER!(GPIOH);

/* Port output speed register (GPIOx_OSPEEDR) */
enum GPIO_OSPEEDR(uint port) = MMIO32!(port + 0x08);
// extern (D) auto GPIO_OSPEEDR(T)(auto ref T port)
// {
//     return MMIO32(port + 0x08);
// }

enum GPIOA_OSPEEDR = GPIO_OSPEEDR!(GPIOA);
enum GPIOB_OSPEEDR = GPIO_OSPEEDR!(GPIOB);
enum GPIOC_OSPEEDR = GPIO_OSPEEDR!(GPIOC);
enum GPIOD_OSPEEDR = GPIO_OSPEEDR!(GPIOD);
enum GPIOE_OSPEEDR = GPIO_OSPEEDR!(GPIOE);
enum GPIOF_OSPEEDR = GPIO_OSPEEDR!(GPIOF);
enum GPIOG_OSPEEDR = GPIO_OSPEEDR!(GPIOG);
enum GPIOH_OSPEEDR = GPIO_OSPEEDR!(GPIOH);

/* Port pull-up/pull-down register (GPIOx_PUPDR) */
enum GPIO_PUPDR(uint port) = MMIO32!(port + 0x0c);
// extern (D) auto GPIO_PUPDR(T)(auto ref T port)
// {
//     return MMIO32(port + 0x0c);
// }

enum GPIOA_PUPDR = GPIO_PUPDR!(GPIOA);
enum GPIOB_PUPDR = GPIO_PUPDR!(GPIOB);
enum GPIOC_PUPDR = GPIO_PUPDR!(GPIOC);
enum GPIOD_PUPDR = GPIO_PUPDR!(GPIOD);
enum GPIOE_PUPDR = GPIO_PUPDR!(GPIOE);
enum GPIOF_PUPDR = GPIO_PUPDR!(GPIOF);
enum GPIOG_PUPDR = GPIO_PUPDR!(GPIOG);
enum GPIOH_PUPDR = GPIO_PUPDR!(GPIOH);

/* Port input data register (GPIOx_IDR) */
enum GPIO_IDR(uint port) = MMIO32!(port + 0x10);
// extern (D) auto GPIO_IDR(T)(auto ref T port)
// {
//     return MMIO32(port + 0x10);
// }

enum GPIOA_IDR = GPIO_IDR!(GPIOA);
enum GPIOB_IDR = GPIO_IDR!(GPIOB);
enum GPIOC_IDR = GPIO_IDR!(GPIOC);
enum GPIOD_IDR = GPIO_IDR!(GPIOD);
enum GPIOE_IDR = GPIO_IDR!(GPIOE);
enum GPIOF_IDR = GPIO_IDR!(GPIOF);
enum GPIOG_IDR = GPIO_IDR!(GPIOG);
enum GPIOH_IDR = GPIO_IDR!(GPIOH);

/* Port output data register (GPIOx_ODR) */
enum GPIO_ODR(uint port) = MMIO32!(port + 0x14);
// extern (D) auto GPIO_ODR(T)(auto ref T port)
// {
//     return MMIO32(port + 0x14);
// }

enum GPIOA_ODR = GPIO_ODR!(GPIOA);
enum GPIOB_ODR = GPIO_ODR!(GPIOB);
enum GPIOC_ODR = GPIO_ODR!(GPIOC);
enum GPIOD_ODR = GPIO_ODR!(GPIOD);
enum GPIOE_ODR = GPIO_ODR!(GPIOE);
enum GPIOF_ODR = GPIO_ODR!(GPIOF);
enum GPIOG_ODR = GPIO_ODR!(GPIOG);
enum GPIOH_ODR = GPIO_ODR!(GPIOH);

/* Port bit set/reset register (GPIOx_BSRR) */
enum GPIO_BSRR(uint port) = MMIO32!(port + 0x18);
// extern (D) auto GPIO_BSRR(T)(auto ref T port)
// {
//     return MMIO32(port + 0x18);
// }

enum GPIOA_BSRR = GPIO_BSRR!(GPIOA);
enum GPIOB_BSRR = GPIO_BSRR!(GPIOB);
enum GPIOC_BSRR = GPIO_BSRR!(GPIOC);
enum GPIOD_BSRR = GPIO_BSRR!(GPIOD);
enum GPIOE_BSRR = GPIO_BSRR!(GPIOE);
enum GPIOF_BSRR = GPIO_BSRR!(GPIOF);
enum GPIOG_BSRR = GPIO_BSRR!(GPIOG);
enum GPIOH_BSRR = GPIO_BSRR!(GPIOH);

/* Port configuration lock register (GPIOx_LCKR) */
enum GPIO_LCKR(uint port) = MMIO32!(port + 0x1c);
// extern (D) auto GPIO_LCKR(T)(auto ref T port)
// {
//     return MMIO32(port + 0x1c);
// }

enum GPIOA_LCKR = GPIO_LCKR!(GPIOA);
enum GPIOB_LCKR = GPIO_LCKR!(GPIOB);
enum GPIOC_LCKR = GPIO_LCKR!(GPIOC);
enum GPIOD_LCKR = GPIO_LCKR!(GPIOD);
enum GPIOE_LCKR = GPIO_LCKR!(GPIOE);
enum GPIOF_LCKR = GPIO_LCKR!(GPIOF);
enum GPIOG_LCKR = GPIO_LCKR!(GPIOG);
enum GPIOH_LCKR = GPIO_LCKR!(GPIOH);

/* Alternate function low register (GPIOx_AFRL) */
enum GPIO_AFRL(uint port) = MMIO32!(port + 0x20);
// extern (D) auto GPIO_AFRL(T)(auto ref T port)
// {
//     return MMIO32(port + 0x20);
// }

enum GPIOA_AFRL = GPIO_AFRL!(GPIOA);
enum GPIOB_AFRL = GPIO_AFRL!(GPIOB);
enum GPIOC_AFRL = GPIO_AFRL!(GPIOC);
enum GPIOD_AFRL = GPIO_AFRL!(GPIOD);
enum GPIOE_AFRL = GPIO_AFRL!(GPIOE);
enum GPIOF_AFRL = GPIO_AFRL!(GPIOF);
enum GPIOG_AFRL = GPIO_AFRL!(GPIOG);
enum GPIOH_AFRL = GPIO_AFRL!(GPIOH);

/* Alternate function high register (GPIOx_AFRH) */
enum GPIO_AFRH(uint port) = MMIO32!(port + 0x24);
// extern (D) auto GPIO_AFRH(T)(auto ref T port)
// {
//     return MMIO32(port + 0x24);
// }

enum GPIOA_AFRH = GPIO_AFRH!(GPIOA);
enum GPIOB_AFRH = GPIO_AFRH!(GPIOB);
enum GPIOC_AFRH = GPIO_AFRH!(GPIOC);
enum GPIOD_AFRH = GPIO_AFRH!(GPIOD);
enum GPIOE_AFRH = GPIO_AFRH!(GPIOE);
enum GPIOF_AFRH = GPIO_AFRH!(GPIOF);
enum GPIOG_AFRH = GPIO_AFRH!(GPIOG);
enum GPIOH_AFRH = GPIO_AFRH!(GPIOH);

/* --- GPIOx_MODER values -------------------------------------------------- */

extern (D) auto GPIO_MODE(T0, T1)(auto ref T0 n, auto ref T1 mode)
{
    return mode << (2 * n);
}

extern (D) auto GPIO_MODE_MASK(T)(auto ref T n)
{
    return 0x3 << (2 * n);
}

/** @defgroup gpio_mode GPIO Pin Direction and Analog/Digital Mode
@ingroup gpio_defines
@{*/
enum GPIO_MODE_INPUT = 0x0;
enum GPIO_MODE_OUTPUT = 0x1;
enum GPIO_MODE_AF = 0x2;
enum GPIO_MODE_ANALOG = 0x3;
/**@}*/

/* --- GPIOx_OTYPER values ------------------------------------------------- */

/** @defgroup gpio_output_type GPIO Output Pin Driver Type
@ingroup gpio_defines
@{*/
/** Push Pull */
enum GPIO_OTYPE_PP = 0x0;
/** Open Drain */
enum GPIO_OTYPE_OD = 0x1;
/**@}*/

/* --- GPIOx_OSPEEDR values ------------------------------------------------ */

extern (D) auto GPIO_OSPEED(T0, T1)(auto ref T0 n, auto ref T1 speed)
{
    return speed << (2 * n);
}

extern (D) auto GPIO_OSPEED_MASK(T)(auto ref T n)
{
    return 0x3 << (2 * n);
}

/** @defgroup gpio_speed GPIO Output Pin Speed
@ingroup gpio_defines
@{*/
enum GPIO_OSPEED_2MHZ = 0x0;
enum GPIO_OSPEED_25MHZ = 0x1;
enum GPIO_OSPEED_50MHZ = 0x2;
enum GPIO_OSPEED_100MHZ = 0x3;
/**@}*/

/* --- GPIOx_PUPDR values -------------------------------------------------- */

extern (D) auto GPIO_PUPD(T0, T1)(auto ref T0 n, auto ref T1 pupd)
{
    return pupd << (2 * n);
}

extern (D) auto GPIO_PUPD_MASK(T)(auto ref T n)
{
    return 0x3 << (2 * n);
}

/** @defgroup gpio_pup GPIO Output Pin Pullup
@ingroup gpio_defines
@{*/
enum GPIO_PUPD_NONE = 0x0;
enum GPIO_PUPD_PULLUP = 0x1;
enum GPIO_PUPD_PULLDOWN = 0x2;
/**@}*/

/* --- GPIOx_IDR values ---------------------------------------------------- */

/* GPIOx_IDR[15:0]: IDRy[15:0]: Port input data (y = 0..15) */

/* --- GPIOx_ODR values ---------------------------------------------------- */

/* GPIOx_ODR[15:0]: ODRy[15:0]: Port output data (y = 0..15) */

/* --- GPIOx_BSRR values --------------------------------------------------- */

/* GPIOx_BSRR[31:16]: BRy: Port x reset bit y (y = 0..15) */
/* GPIOx_BSRR[15:0]: BSy: Port x set bit y (y = 0..15) */

/* --- GPIOx_LCKR values --------------------------------------------------- */

enum GPIO_LCKK = 1 << 16;
/* GPIOx_LCKR[15:0]: LCKy: Port x lock bit y (y = 0..15) */

/* --- GPIOx_AFRL/H values ------------------------------------------------- */

/* Note: AFRL is used for bits 0..7, AFRH is used for 8..15 */
/* See datasheet table 6 (pg. 48) for alternate function mappings. */

extern (D) auto GPIO_AFR(T0, T1)(auto ref T0 n, auto ref T1 af)
{
    return af << (n * 4);
}

extern (D) auto GPIO_AFR_MASK(T)(auto ref T n)
{
    return 0xf << (n * 4);
}

/** @defgroup gpio_af_num Alternate Function Pin Selection
@ingroup gpio_defines
@{*/
enum GPIO_AF0 = 0x0;
enum GPIO_AF1 = 0x1;
enum GPIO_AF2 = 0x2;
enum GPIO_AF3 = 0x3;
enum GPIO_AF4 = 0x4;
enum GPIO_AF5 = 0x5;
enum GPIO_AF6 = 0x6;
enum GPIO_AF7 = 0x7;
enum GPIO_AF8 = 0x8;
enum GPIO_AF9 = 0x9;
enum GPIO_AF10 = 0xa;
enum GPIO_AF11 = 0xb;
enum GPIO_AF12 = 0xc;
enum GPIO_AF13 = 0xd;
enum GPIO_AF14 = 0xe;
enum GPIO_AF15 = 0xf;
/**@}*/

/* Note: EXTI source selection is now in the SYSCFG peripheral. */

/* --- Function prototypes ------------------------------------------------- */

/*
 * Note: The F2 and F4 series have a completely new GPIO peripheral with
 * different configuration options. Here we implement a different API partly to
 * more closely match the peripheral capabilities and also to deliberately
 * break compatibility with old F1 code so there is no confusion with similar
 * sounding functions that have very different functionality.
 */
extern(C) {

void gpio_mode_setup (
    uint gpioport,
    ubyte mode,
    ubyte pull_up_down,
    ushort gpios);
void gpio_set_output_options (
    uint gpioport,
    ubyte otype,
    ubyte speed,
    ushort gpios);
void gpio_set_af (uint gpioport, ubyte alt_func_num, ushort gpios);

}
/**@}*/

/** @cond */

/** @endcond */
