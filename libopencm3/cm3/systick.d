module libopencm3.cm3.systick;

public import libopencm3.cm3.memorymap;

/** SysTick Control and Status Register (CSR).
 * Controls the system timer and provides status data.
 * Usage constraints: There are no usage constraints.
 * Configurations Always implemented.
 */
enum STK_CSR = MMIO32!(SYS_TICK_BASE + 0x00);

/** SysTick Reload Value Register (RVR).
 * Reads or clears the value that will be loaded to the counter.
 * Usage constraints:
 * - Any write to the register clears the register to zero.
 * - The counter does not provide read-modify-write protection.
 * - Unsupported bits are read as zero
 * Configurations Always implemented.
 */
enum STK_RVR = MMIO32!(SYS_TICK_BASE + 0x04);

/** SysTick Current Value Register (CVR).
 * Holds the current value of the counter.
 * Usage constraints: There are no usage constraints.
 * Configurations Always implemented.
 */
enum STK_CVR = MMIO32!(SYS_TICK_BASE + 0x08);

/** SysTick Calibration Value Register(Read Only) (CALIB)
 * Reads the calibration value and parameters for SysTick.
 * Usage constraints: There are no usage constraints.
 * Configurations Always implemented.
 */
enum STK_CALIB = MMIO32!(SYS_TICK_BASE + 0x0C);

/** @defgroup STK_CSR_VALUES STK_CSR Values
 * @{
 */
/** COUNTFLAG
 * Indicates whether the counter has counted to 0 since the last read of this
 * register:
 *  0 = Timer has not counted to 0
 *  1 = Timer has counted to 0.
 */
enum STK_CSR_COUNTFLAG = 1 << 16;

enum STK_CSR_CLKSOURCE_LSB = 2;
/** CLKSOURCE: Clock source selection
 * for 0, SysTick uses the IMPLEMENTATION DEFINED external reference clock.
 * for 1, SysTick uses the processor clock.
 * If no external clock is provided, this bit reads as 1 and ignores writes.
 */
enum STK_CSR_CLKSOURCE = 1 << STK_CSR_CLKSOURCE_LSB;

/** @defgroup systick_clksource Clock source selection
@ingroup CM3_systick_defines

@{*/

enum STK_CSR_CLKSOURCE_AHB_DIV8 = 0 << STK_CSR_CLKSOURCE_LSB;
enum STK_CSR_CLKSOURCE_AHB = 1 << STK_CSR_CLKSOURCE_LSB;

/**@}*/

/** TICKINT: SysTick exception request enable */
enum STK_CSR_TICKINT = 1 << 1;
/** ENABLE: Counter enable */
enum STK_CSR_ENABLE = 1 << 0;
/**@}*/

/** @defgroup STK_RVR_VALUES STK_RVR Values
 * @{
 */
/** RELOAD[23:0]: RELOAD value */
enum STK_RVR_RELOAD = 0x00FFFFFF;

/**@}*/

/** @defgroup STK_RVR_VALUES STK_RVR Values
 * @{
 */
/** CURRENT[23:0]: Current counter value */
enum STK_CVR_CURRENT = 0x00FFFFFF;
/**@}*/

/** @defgroup STK_CALIB_VALUES STK_CALIB Values
 * @{
 */
/** NOREF: NOREF flag
 * Bit31 => NOREF Indicates whether the IMPLEMENTATION DEFINED reference clock
 * is implemented:
 * 0 = The reference clock is implemented.
 * 1 = The reference clock is not implemented.
 * When this bit is 1, the CLKSOURCE bit of the SYST_CSR register is forced to
 * 1 and cannot be cleared to 0.
 */
enum STK_CALIB_NOREF = 1 << 31;

/** SKEW: SKEW flag
 * Bit30 => SKEW Indicates whether the 10ms calibration value is exact:
 * 0 = 10ms calibration value is exact.
 * 1 = 10ms calibration value is inexact, because of the clock frequency
 */
enum STK_CALIB_SKEW = 1 << 30;

/* Bits [29:24] Reserved, must be kept cleared. */
/** TENMS Calibration value for 10ms.
 * Bit0 to 23 => TENMS Optionally, holds a reload value to be used for 10ms
 * (100Hz) timing, subject to system clock skew errors. If this field is zero,
 * the calibration value is not known.
 */
enum STK_CALIB_TENMS = 0x00FFFFFF;
/**@}*/

/* --- Function Prototypes ------------------------------------------------- */

extern(C) {
void systick_set_reload (uint value);
bool systick_set_frequency (uint freq, uint ahb);
uint systick_get_reload ();
uint systick_get_value ();
void systick_set_clocksource (ubyte clocksource);
void systick_interrupt_enable ();
void systick_interrupt_disable ();
void systick_counter_enable ();
void systick_counter_disable ();
ubyte systick_get_countflag ();
void systick_clear ();

uint systick_get_calib ();

}
