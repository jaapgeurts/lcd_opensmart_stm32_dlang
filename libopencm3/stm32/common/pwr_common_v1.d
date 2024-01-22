module libopencm3.stm32.common.pwr_common_v1;

import libopencm3.stm32.memorymap;


/* THIS FILE SHOULD NOT BE INCLUDED DIRECTLY, BUT ONLY VIA PWR.H
The order of header inclusion is important. pwr.h includes the device
specific memorymap.h header before including this header file.*/

/** @cond */

/** @endcond */

/**@{*/

/* --- PWR registers ------------------------------------------------------- */

/** Power control register (PWR_CR) */
enum PWR_CR = MMIO32!(POWER_CONTROL_BASE + 0x00);

/** Power control/status register (PWR_CSR) */
enum PWR_CSR = MMIO32!(POWER_CONTROL_BASE + 0x04);

/* --- PWR_CR values ------------------------------------------------------- */

/* Bits [31:9]: Reserved, must be kept at reset value. */

/** DBP: Disable backup domain write protection */
enum PWR_CR_DBP = 1 << 8;

/* PLS[7:5]: PVD level selection */
enum PWR_CR_PLS_LSB = 5;
/** @defgroup pwr_pls PVD level selection
@ingroup STM32F_pwr_defines

@{*/
enum PWR_CR_PLS_2V2 = 0x0 << PWR_CR_PLS_LSB;
enum PWR_CR_PLS_2V3 = 0x1 << PWR_CR_PLS_LSB;
enum PWR_CR_PLS_2V4 = 0x2 << PWR_CR_PLS_LSB;
enum PWR_CR_PLS_2V5 = 0x3 << PWR_CR_PLS_LSB;
enum PWR_CR_PLS_2V6 = 0x4 << PWR_CR_PLS_LSB;
enum PWR_CR_PLS_2V7 = 0x5 << PWR_CR_PLS_LSB;
enum PWR_CR_PLS_2V8 = 0x6 << PWR_CR_PLS_LSB;
enum PWR_CR_PLS_2V9 = 0x7 << PWR_CR_PLS_LSB;
/**@}*/
enum PWR_CR_PLS_MASK = 0x7 << PWR_CR_PLS_LSB;

/** PVDE: Power voltage detector enable */
enum PWR_CR_PVDE = 1 << 4;

/** CSBF: Clear standby flag */
enum PWR_CR_CSBF = 1 << 3;

/** CWUF: Clear wakeup flag */
enum PWR_CR_CWUF = 1 << 2;

/** PDDS: Power down deepsleep */
enum PWR_CR_PDDS = 1 << 1;

/** LPDS: Low-power deepsleep */
enum PWR_CR_LPDS = 1 << 0;

/* --- PWR_CSR values ------------------------------------------------------ */

/* Bits [31:9]: Reserved, must be kept at reset value. */

/** EWUP: Enable WKUP pin */
enum PWR_CSR_EWUP = 1 << 8;

/* Bits [7:3]: Reserved, must be kept at reset value. */

/** PVDO: PVD output */
enum PWR_CSR_PVDO = 1 << 2;

/** SBF: Standby flag */
enum PWR_CSR_SBF = 1 << 1;

/** WUF: Wakeup flag */
enum PWR_CSR_WUF = 1 << 0;

/* --- PWR function prototypes ------------------------------------------- */

extern(C) {
void pwr_disable_backup_domain_write_protect ();
void pwr_enable_backup_domain_write_protect ();
void pwr_enable_power_voltage_detect (uint pvd_level);
void pwr_disable_power_voltage_detect ();
void pwr_clear_standby_flag ();
void pwr_clear_wakeup_flag ();
void pwr_set_standby_mode ();
void pwr_set_stop_mode ();
void pwr_voltage_regulator_on_in_stop ();
void pwr_voltage_regulator_low_power_in_stop ();
void pwr_enable_wakeup_pin ();
void pwr_disable_wakeup_pin ();
bool pwr_voltage_high ();
bool pwr_get_standby_flag ();
bool pwr_get_wakeup_flag ();

}
/**@}*/

/** @cond */

/** @endcond */
