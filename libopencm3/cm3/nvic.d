/*
 * This file is part of the libopencm3 project.
 *
 * Copyright (C) 2010 Piotr Esden-Tempski <piotr@esden.net>
 * Copyright (C) 2012 Michael Ossmann <mike@ossmann.com>
 * Copyright (C) 2012 Benjamin Vernoux <titanmkd@gmail.com>
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
/** @defgroup CM3_nvic_defines Cortex-M NVIC Defines
 *
 * @brief <b>libopencm3 Cortex Nested Vectored Interrupt Controller</b>
 *
 * @ingroup CM3_defines
 *
 * @version 1.0.0
 *
 * @author @htmlonly &copy; @endhtmlonly 2010 Piotr Esden-Tempski <piotr@esden.net>
 *
 * @date 18 August 2012
 *
 * LGPL License Terms @ref lgpl_license
 */
/**@{*/

extern (C):

/** @defgroup nvic_registers NVIC Registers
 * @{
 */

/** ISER: Interrupt Set Enable Registers
 * @note 8 32bit Registers
 * @note Single register on CM0
 */
extern (D) auto NVIC_ISER(T)(auto ref T iser_id)
{
    return MMIO32(NVIC_BASE + 0x00 + (iser_id * 4));
}

/* NVIC_BASE + 0x020 (0xE000 E120 - 0xE000 E17F): Reserved */

/** ICER: Interrupt Clear Enable Registers
 * @note 8 32bit Registers
 * @note Single register on CM0
 */
extern (D) auto NVIC_ICER(T)(auto ref T icer_id)
{
    return MMIO32(NVIC_BASE + 0x80 + (icer_id * 4));
}

/* NVIC_BASE + 0x0A0 (0xE000 E1A0 - 0xE000 E1FF): Reserved */

/** ISPR: Interrupt Set Pending Registers
 * @note 8 32bit Registers
 * @note Single register on CM0
 */
extern (D) auto NVIC_ISPR(T)(auto ref T ispr_id)
{
    return MMIO32(NVIC_BASE + 0x100 + (ispr_id * 4));
}

/* NVIC_BASE + 0x120 (0xE000 E220 - 0xE000 E27F): Reserved */

/** ICPR: Interrupt Clear Pending Registers
 * @note 8 32bit Registers
 * @note Single register on CM0
 */
extern (D) auto NVIC_ICPR(T)(auto ref T icpr_id)
{
    return MMIO32(NVIC_BASE + 0x180 + (icpr_id * 4));
}

/* NVIC_BASE + 0x1A0 (0xE000 E2A0 - 0xE00 E2FF): Reserved */

/* Those defined only on ARMv7 and above */

/** IABR: Interrupt Active Bit Register
 * @note 8 32bit Registers */

/* NVIC_BASE + 0x220 (0xE000 E320 - 0xE000 E3FF): Reserved */

/** IPR: Interrupt Priority Registers
 * @note 240 8bit Registers
 * @note 32 8bit Registers on CM0, requires word access
 */

extern (D) auto NVIC_IPR(T)(auto ref T ipr_id)
{
    return MMIO8(NVIC_BASE + 0x300 + ipr_id);
}

/** STIR: Software Trigger Interrupt Register */

/**@}*/

/* --- IRQ channel numbers-------------------------------------------------- */

/* Cortex M0, M3 and M4 System Interrupts */
/** @defgroup nvic_sysint Cortex M0/M3/M4 System Interrupts
@ingroup CM3_nvic_defines

IRQ numbers -3 and -6 to -9 are reserved
@{*/
enum NVIC_NMI_IRQ = -14;
enum NVIC_HARD_FAULT_IRQ = -13;

/* Those defined only on ARMv7 and above */

/* irq numbers -6 to -9 are reserved */
enum NVIC_SV_CALL_IRQ = -5;

/* Those defined only on ARMv7 and above */

/* irq number -3 reserved */
enum NVIC_PENDSV_IRQ = -2;
enum NVIC_SYSTICK_IRQ = -1;
/**@}*/

/* @note User interrupts are family specific and are defined in a family
 * specific header file in the corresponding subfolder.
 */

/* --- NVIC functions ------------------------------------------------------ */

void nvic_enable_irq (ubyte irqn);
void nvic_disable_irq (ubyte irqn);
ubyte nvic_get_pending_irq (ubyte irqn);
void nvic_set_pending_irq (ubyte irqn);
void nvic_clear_pending_irq (ubyte irqn);
ubyte nvic_get_irq_enabled (ubyte irqn);
void nvic_set_priority (ubyte irqn, ubyte priority);

/* Those defined only on ARMv7 and above */

void reset_handler ();
void nmi_handler ();
void hard_fault_handler ();
void sv_call_handler ();
void pend_sv_handler ();
void sys_tick_handler ();

/* Those defined only on ARMv7 and above */

/**@}*/

