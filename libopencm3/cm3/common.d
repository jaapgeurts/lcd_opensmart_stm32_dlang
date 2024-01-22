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

module libopencm3.cm3.common;

/* Declarations need wrapping for C++ */

/* skipping for assembly */

/* And nothing for C */

/* Full-featured deprecation attribute with fallback for older compilers. */

/* Generic memory-mapped I/O accessor functions */
// #define MMIO8(addr)		(*(volatile uint8_t *)(addr))
//extern(D) enum ubyte MMIO
auto MMIO8(T)(auto ref T addr)
{
    return *cast(ubyte*) addr;
}

// #define MMIO16(addr)		(*(volatile uint16_t *)(addr))
enum ushort* MMIO16(uint addr) = cast(ushort*)addr;
enum ushort* SFR_IO16(uint addr) = MMIO16!(addr);
// extern (D) auto MMIO16(T)(auto ref T addr)
// {
//     return *cast(ushort*) addr;
// }

// #define MMIO32(addr)		(*(volatile uint32_t *)(addr))
enum uint* MMIO32(uint addr) = cast(uint*)addr;
//enum uint* SFR_IO32(uint ioAddr) = MMIO32!(ioAddr);
// extern (D) auto MMIO32(T)(auto ref T addr)
// {
//     return *cast(uint*) addr;
// }

// #define MMIO64(addr)		(*(volatile uint64_t *)(addr))
auto MMIO64(T)(auto ref T addr)
{
    return *cast(ulong*) addr;
}

/* Generic bit-band I/O accessor functions */
auto BBIO_SRAM(T0, T1)(auto ref T0 addr, auto ref T1 bit)
{
    return MMIO32(((cast(uint) addr) & 0x0FFFFF) * 32 + 0x22000000 + bit * 4);
}

auto BBIO_PERIPH(T0, T1)(auto ref T0 addr, auto ref T1 bit)
{
    return MMIO32(((cast(uint) addr) & 0x0FFFFF) * 32 + 0x42000000 + bit * 4);
}

/* Generic bit definition */
enum BIT0 = 1 << 0;
enum BIT1 = 1 << 1;
enum BIT2 = 1 << 2;
enum BIT3 = 1 << 3;
enum BIT4 = 1 << 4;
enum BIT5 = 1 << 5;
enum BIT6 = 1 << 6;
enum BIT7 = 1 << 7;
enum BIT8 = 1 << 8;
enum BIT9 = 1 << 9;
enum BIT10 = 1 << 10;
enum BIT11 = 1 << 11;
enum BIT12 = 1 << 12;
enum BIT13 = 1 << 13;
enum BIT14 = 1 << 14;
enum BIT15 = 1 << 15;
enum BIT16 = 1 << 16;
enum BIT17 = 1 << 17;
enum BIT18 = 1 << 18;
enum BIT19 = 1 << 19;
enum BIT20 = 1 << 20;
enum BIT21 = 1 << 21;
enum BIT22 = 1 << 22;
enum BIT23 = 1 << 23;
enum BIT24 = 1 << 24;
enum BIT25 = 1 << 25;
enum BIT26 = 1 << 26;
enum BIT27 = 1 << 27;
enum BIT28 = 1 << 28;
enum BIT29 = 1 << 29;
enum BIT30 = 1 << 30;
enum BIT31 = 1 << 31;

