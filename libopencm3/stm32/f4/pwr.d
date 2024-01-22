module libopencm3.stm32.f4.pwr;

public import libopencm3.stm32.common.pwr_common_v1;

/*
 * This file extends the common STM32 version with definitions only
 * applicable to the STM32F4 series of devices.
 */
/** @addtogroup pwr_defines
 * @{*/

/* --- PWR_CR values ------------------------------------------------------- */

/** VOS: Regulator voltage scaling output selection */
enum PWR_CR_VOS_SHIFT = 14;
enum PWR_CR_VOS_MASK = 0x3;

/** ADCDC1: Masks extra flash accesses by prefetch (see AN4073) */
enum PWR_CR_ADCDC1 = 1 << 13;

/** MRLVDS/MRUDS: Main regulator Low Voltage / Under drive in Deep Sleep */
enum PWR_CR_MRLVDS = 1 << 11;
enum PWR_CR_MRUDS = PWR_CR_MRLVDS;

/** LPLVDS/LPUDS: Low-power regulator Low Voltage / Under drive in Deep Sleep */
enum PWR_CR_LPLVDS = 1 << 10;
enum PWR_CR_LPUDS = PWR_CR_LPLVDS;

/** FPDS: Flash power down in stop mode */
enum PWR_CR_FPDS = 1 << 9;

/* --- PWR_CSR values ------------------------------------------------------ */

/** VOSRDY: Regulator voltage scaling output selection ready bit */
enum PWR_CSR_VOSRDY = 1 << 14;

/** BRE: Backup regulator enable */
enum PWR_CSR_BRE = 1 << 9;

/** BRR: Backup regulator ready */
enum PWR_CSR_BRR = 1 << 3;

/* --- Function prototypes ------------------------------------------------- */

enum pwr_vos_scale
{
    PWR_SCALE1 = 0x3,
    PWR_SCALE2 = 0x2,
    PWR_SCALE3 = 0x1
}

alias PWR_SCALE1 = pwr_vos_scale.PWR_SCALE1;
alias PWR_SCALE2 = pwr_vos_scale.PWR_SCALE2;
alias PWR_SCALE3 = pwr_vos_scale.PWR_SCALE3;

void pwr_set_vos_scale (pwr_vos_scale scale);

/**@}*/

