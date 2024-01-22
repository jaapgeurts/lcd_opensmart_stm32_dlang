module libopencm3.stm32.common.usart_common_f124;

public import libopencm3.stm32.common.usart_common_all;


/** @defgroup usart_reg_base USART register base addresses
 * Holds all the U(S)ART peripherals supported.
 * @{
 */
enum USART1 = USART1_BASE;
enum USART2 = USART2_BASE;
enum USART3 = USART3_BASE;
enum UART4 = UART4_BASE;
enum UART5 = UART5_BASE;
/**@}*/

/* --- USART registers ----------------------------------------------------- */

/* Status register (USARTx_SR) */
enum USART_SR(uint usart_base) = MMIO32!(usart_base + 0x00);
// extern (D) auto USART_SR(T)(auto ref T usart_base)
// {
//     return MMIO32(usart_base + 0x00);
// }

enum USART1_SR = USART_SR!(USART1_BASE);
enum USART2_SR = USART_SR!(USART2_BASE);
enum USART3_SR = USART_SR!(USART3_BASE);
enum UART4_SR = USART_SR!(UART4_BASE);
enum UART5_SR = USART_SR!(UART5_BASE);

/* Data register (USARTx_DR) */
enum USART_DR(uint usart_base) = MMIO32!(usart_base + 0x04);
// extern (D) auto USART_DR(T)(auto ref T usart_base)
// {
//     return MMIO32(usart_base + 0x04);
// }

enum USART1_DR = USART_DR!(USART1_BASE);
enum USART2_DR = USART_DR!(USART2_BASE);
enum USART3_DR = USART_DR!(USART3_BASE);
enum UART4_DR = USART_DR!(UART4_BASE);
enum UART5_DR = USART_DR!(UART5_BASE);

/* Baud rate register (USARTx_BRR) */
enum USART_BRR(uint usart_base) = MMIO32!(usart_base + 0x08);
// extern (D) auto USART_BRR(T)(auto ref T usart_base)
// {
//     return MMIO32(usart_base + 0x08);
// }

enum USART1_BRR = USART_BRR!(USART1_BASE);
enum USART2_BRR = USART_BRR!(USART2_BASE);
enum USART3_BRR = USART_BRR!(USART3_BASE);
enum UART4_BRR = USART_BRR!(UART4_BASE);
enum UART5_BRR = USART_BRR!(UART5_BASE);

/* Control register 1 (USARTx_CR1) */
enum USART_CR1(uint usart_base) = MMIO32!(usart_base + 0x0c);
// extern (D) auto USART_CR1(T)(auto ref T usart_base)
// {
//     return MMIO32(usart_base + 0x0c);
// }

enum USART1_CR1 = USART_CR1!(USART1_BASE);
enum USART2_CR1 = USART_CR1!(USART2_BASE);
enum USART3_CR1 = USART_CR1!(USART3_BASE);
enum UART4_CR1 = USART_CR1!(UART4_BASE);
enum UART5_CR1 = USART_CR1!(UART5_BASE);

/* Control register 2 (USARTx_CR2) */
enum USART_CR2(uint usart_base) = MMIO32!(usart_base + 0x10);
// extern (D) auto USART_CR2(T)(auto ref T usart_base)
// {
//     return MMIO32(usart_base + 0x10);
// }

enum USART1_CR2 = USART_CR2!(USART1_BASE);
enum USART2_CR2 = USART_CR2!(USART2_BASE);
enum USART3_CR2 = USART_CR2!(USART3_BASE);
enum UART4_CR2 = USART_CR2!(UART4_BASE);
enum UART5_CR2 = USART_CR2!(UART5_BASE);

/* Control register 3 (USARTx_CR3) */
enum USART_CR3(uint usart_base) = MMIO32!(usart_base + 0x14);
// extern (D) auto USART_CR3(T)(auto ref T usart_base)
// {
//     return MMIO32(usart_base + 0x14);
// }

enum USART1_CR3 = USART_CR3!(USART1_BASE);
enum USART2_CR3 = USART_CR3!(USART2_BASE);
enum USART3_CR3 = USART_CR3!(USART3_BASE);
enum UART4_CR3 = USART_CR3!(UART4_BASE);
enum UART5_CR3 = USART_CR3!(UART5_BASE);

/* Guard time and prescaler register (USARTx_GTPR) */
enum USART_GTPR(uint usart_base) = MMIO32!(usart_base + 0x18);
// extern (D) auto USART_GTPR(T)(auto ref T usart_base)
// {
//     return MMIO32(usart_base + 0x18);
// }

enum USART1_GTPR = USART_GTPR!(USART1_BASE);
enum USART2_GTPR = USART_GTPR!(USART2_BASE);
enum USART3_GTPR = USART_GTPR!(USART3_BASE);
enum UART4_GTPR = USART_GTPR!(UART4_BASE);
enum UART5_GTPR = USART_GTPR!(UART5_BASE);

/** @defgroup usart_convenience_flags U(S)ART convenience Flags
 * @ingroup STM32F_usart_defines
 * We define the "common" lower flag bits using a standard name,
 * allowing them to be used regardless of which usart peripheral
 * version you have.
 * @{
 */
enum USART_FLAG_PE = USART_SR_PE;
enum USART_FLAG_FE = USART_SR_FE;
enum USART_FLAG_NE = USART_SR_NE;
enum USART_FLAG_ORE = USART_SR_ORE;
enum USART_FLAG_IDLE = USART_SR_IDLE;
enum USART_FLAG_RXNE = USART_SR_RXNE;
enum USART_FLAG_TC = USART_SR_TC;
enum USART_FLAG_TXE = USART_SR_TXE;
/**@}*/

/* --- USART_SR values ----------------------------------------------------- */
/****************************************************************************/
/** @defgroup usart_sr_flags USART Status register Flags
@ingroup STM32F_usart_defines

@{*/

/** CTS: CTS flag */
/** @note: undefined on UART4 and UART5 */
enum USART_SR_CTS = 1 << 9;

/** LBD: LIN break detection flag */
enum USART_SR_LBD = 1 << 8;

/** TXE: Transmit data buffer empty */
enum USART_SR_TXE = 1 << 7;

/** TC: Transmission complete */
enum USART_SR_TC = 1 << 6;

/** RXNE: Read data register not empty */
enum USART_SR_RXNE = 1 << 5;

/** IDLE: Idle line detected */
enum USART_SR_IDLE = 1 << 4;

/** ORE: Overrun error */
enum USART_SR_ORE = 1 << 3;

/** NE: Noise error flag */
enum USART_SR_NE = 1 << 2;

/** FE: Framing error */
enum USART_SR_FE = 1 << 1;

/** PE: Parity error */
enum USART_SR_PE = 1 << 0;
/**@}*/

/* --- USART_DR values ----------------------------------------------------- */

/* USART_DR[8:0]: DR[8:0]: Data value */
enum USART_DR_MASK = 0x1FF;

/* --- USART_BRR values ---------------------------------------------------- */

/* DIV_Mantissa[11:0]: mantissa of USARTDIV */
enum USART_BRR_DIV_MANTISSA_MASK = 0xFFF << 4;
/* DIV_Fraction[3:0]: fraction of USARTDIV */
enum USART_BRR_DIV_FRACTION_MASK = 0xF;



/* --- USART_GTPR values --------------------------------------------------- */

/* GT[7:0]: Guard time value */
/* Note: N/A on UART4 & UART5 */
enum USART_GTPR_GT_MASK = 0xFF << 8;

/* PSC[7:0]: Prescaler value */
/* Note: N/A on UART4/5 */
enum USART_GTPR_PSC_MASK = 0xFF;


/* TODO */ /* Note to Uwe: what needs to be done here? */

/** @cond */

/** @endcond */
/**@}*/
