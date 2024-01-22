/*
 * This file is part of the libopencm3 project.
 *
 * Copyright (C) 2009 Uwe Hermann <uwe@hermann-uwe.de>
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
module libopencm3.cm3.memorymap;

public import libopencm3.cm3.common;

/* --- ARM Cortex-M0, M3 and M4 specific definitions ----------------------- */

/* Private peripheral bus - Internal */
enum PPBI_BASE = 0xE0000000U;

/* Those defined only on ARMv7 and above */

/* PPBI_BASE + 0x3000 (0xE000 3000 - 0xE000 DFFF): Reserved */

enum SCS_BASE = PPBI_BASE + 0xE000;

/* PPBI_BASE + 0xF000 (0xE000 F000 - 0xE003 FFFF): Reserved */

/* Those defined only on ARMv7 and above */

/* --- SCS: System Control Space --- */

/* Those defined only on ARMv7 and above */

/* SYS_TICK: System Timer */
enum SYS_TICK_BASE = SCS_BASE + 0x0010;

/* NVIC: Nested Vector Interrupt Controller */
enum NVIC_BASE = SCS_BASE + 0x0100;

/* SCB: System Control Block */
enum SCB_BASE = SCS_BASE + 0x0D00;

/* MPU: Memory protection unit */
enum MPU_BASE = SCS_BASE + 0x0D90;

/* Those defined only on CM0*/

/* Those defined only on ARMv7 and above */

/**
 * @defgroup coresight_registers Coresight Registers
 * @{
 * CoreSight Lock Status Registers and Lock Access Registers are
 * documented for the DWT, ITM, FPB and TPIU peripherals
 */
enum CORESIGHT_LSR_OFFSET = 0xfb4;
enum CORESIGHT_LAR_OFFSET = 0xfb0;

/** CoreSight Lock Status Register lock status bit */
enum CORESIGHT_LSR_SLK = 1 << 1;
/** CoreSight Lock Status Register lock availability bit */
enum CORESIGHT_LSR_SLI = 1 << 0;
/** CoreSight Lock Access key, common for all */
enum CORESIGHT_LAR_KEY = 0xC5ACCE55;

/**@}*/
