module libopencm3.stm32.common.gpio_common_all;

public import libopencm3.cm3.common;
public import libopencm3.stm32.memorymap;

/* --- Convenience macros -------------------------------------------------- */

/* --- GPIO_LCKR values ---------------------------------------------------- */

enum GPIO_LCKK = 1 << 16;
/* GPIO_LCKR[15:0]: LCKy: Port x lock bit y (y = 0..15) */

/* GPIO number definitions (for convenience) */
/** @defgroup gpio_pin_id GPIO Pin Identifiers
@ingroup gpio_defines

@{*/
enum GPIO0 = 1 << 0;
enum GPIO1 = 1 << 1;
enum GPIO2 = 1 << 2;
enum GPIO3 = 1 << 3;
enum GPIO4 = 1 << 4;
enum GPIO5 = 1 << 5;
enum GPIO6 = 1 << 6;
enum GPIO7 = 1 << 7;
enum GPIO8 = 1 << 8;
enum GPIO9 = 1 << 9;
enum GPIO10 = 1 << 10;
enum GPIO11 = 1 << 11;
enum GPIO12 = 1 << 12;
enum GPIO13 = 1 << 13;
enum GPIO14 = 1 << 14;
enum GPIO15 = 1 << 15;
enum GPIO_ALL = 0xffff;
/**@}*/

extern(C) {

void gpio_set (uint gpioport, ushort gpios);
void gpio_clear (uint gpioport, ushort gpios);
ushort gpio_get (uint gpioport, ushort gpios);
void gpio_toggle (uint gpioport, ushort gpios);
ushort gpio_port_read (uint gpioport);
void gpio_port_write (uint gpioport, ushort data);
void gpio_port_config_lock (uint gpioport, ushort gpios);

}
/**@}*/

/** @cond */

/** @endcond */
