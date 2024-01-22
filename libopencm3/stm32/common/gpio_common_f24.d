module llibopencm3.stm32.common.gpio_common_f24;

public import libopencm3.stm32.common.gpio_common_f234;

/* GPIO port base addresses (for convenience) */
/** @defgroup gpio_port_id GPIO Port IDs
@ingroup gpio_defines

@{*/
enum GPIOI = GPIO_PORT_I_BASE;
enum GPIOJ = GPIO_PORT_J_BASE;
enum GPIOK = GPIO_PORT_K_BASE;
/**@}*/

/* --- GPIO registers for STM32F2, STM32F3 and STM32F4 --------------------- */

/* Port mode register (GPIOx_MODER) */
enum GPIOI_MODER = GPIO_MODER!(GPIOI);
enum GPIOJ_MODER = GPIO_MODER!(GPIOJ);
enum GPIOK_MODER = GPIO_MODER!(GPIOK);

/* Port output type register (GPIOx_OTYPER) */
enum GPIOI_OTYPER = GPIO_OTYPER!(GPIOI);
enum GPIOJ_OTYPER = GPIO_OTYPER!(GPIOJ);
enum GPIOK_OTYPER = GPIO_OTYPER!(GPIOK);

/* Port output speed register (GPIOx_OSPEEDR) */
enum GPIOI_OSPEEDR = GPIO_OSPEEDR!(GPIOI);
enum GPIOJ_OSPEEDR = GPIO_OSPEEDR!(GPIOJ);
enum GPIOK_OSPEEDR = GPIO_OSPEEDR!(GPIOK);

/* Port pull-up/pull-down register (GPIOx_PUPDR) */
enum GPIOI_PUPDR = GPIO_PUPDR!(GPIOI);
enum GPIOJ_PUPDR = GPIO_PUPDR!(GPIOJ);
enum GPIOK_PUPDR = GPIO_PUPDR!(GPIOK);

/* Port input data register (GPIOx_IDR) */
enum GPIOI_IDR = GPIO_IDR!(GPIOI);
enum GPIOJ_IDR = GPIO_IDR!(GPIOJ);
enum GPIOK_IDR = GPIO_IDR!(GPIOK);

/* Port output data register (GPIOx_ODR) */
enum GPIOI_ODR = GPIO_ODR!(GPIOI);
enum GPIOJ_ODR = GPIO_ODR!(GPIOJ);
enum GPIOK_ODR = GPIO_ODR!(GPIOK);

/* Port bit set/reset register (GPIOx_BSRR) */
enum GPIOI_BSRR = GPIO_BSRR!(GPIOI);
enum GPIOJ_BSRR = GPIO_BSRR!(GPIOJ);
enum GPIOK_BSRR = GPIO_BSRR!(GPIOK);

/* Port configuration lock register (GPIOx_LCKR) */
enum GPIOI_LCKR = GPIO_LCKR!(GPIOI);
enum GPIOJ_LCKR = GPIO_LCKR!(GPIOJ);
enum GPIOK_LCKR = GPIO_LCKR!(GPIOK);

/* Alternate function low register (GPIOx_AFRL) */
enum GPIOI_AFRL = GPIO_AFRL!(GPIOI);
enum GPIOJ_AFRL = GPIO_AFRL!(GPIOJ);
enum GPIOK_AFRL = GPIO_AFRL!(GPIOK);

/* Alternate function high register (GPIOx_AFRH) */
enum GPIOI_AFRH = GPIO_AFRH!(GPIOI);
enum GPIOJ_AFRH = GPIO_AFRH!(GPIOJ);
enum GPIOK_AFRH = GPIO_AFRH!(GPIOK);

/**@}*/

/** @cond */

/** @endcond */
