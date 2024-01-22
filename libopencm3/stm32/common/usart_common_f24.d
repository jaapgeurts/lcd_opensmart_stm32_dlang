/* --- Convenience macros -------------------------------------------------- */

module libopencm3.stm32.common.usart_common_f24;

public import libopencm3.stm32.common.usart_common_f124;

/* --- Convenience macros -------------------------------------------------- */

/** @addtogroup usart_reg_base USART register base addresses
 * Holds all the U(S)ART peripherals supported.
 * @{
 */
enum USART6 = USART6_BASE;
enum UART7 = UART7_BASE;
enum UART8 = UART8_BASE;
/**@}*/

/* --- USART registers ----------------------------------------------------- */

/* Status register (USARTx_SR) */
enum USART6_SR = USART_SR!(USART6_BASE);
enum UART7_SR = USART_SR!(UART7);
enum UART8_SR = USART_SR!(UART8);

/* Data register (USARTx_DR) */
enum USART6_DR = USART_DR!(USART6_BASE);
enum UART7_DR = USART_DR!(UART7);
enum UART8_DR = USART_DR!(UART8);

/* Baud rate register (USARTx_BRR) */
enum USART6_BRR = USART_BRR!(USART6_BASE);
enum UART7_BRR = USART_BRR!(UART7);
enum UART8_BRR = USART_BRR!(UART8);

/* Control register 1 (USARTx_CR1) */
enum USART6_CR1 = USART_CR1!(USART6_BASE);
enum UART7_CR1 = USART_CR1!(UART7);
enum UART8_CR1 = USART_CR1!(UART8);

/* Control register 2 (USARTx_CR2) */
enum USART6_CR2 = USART_CR2!(USART6_BASE);
enum UART7_CR2 = USART_CR2!(UART7);
enum UART8_CR2 = USART_CR2!(UART8);

/* Control register 3 (USARTx_CR3) */
enum USART6_CR3 = USART_CR3!(USART6_BASE);
enum UART7_CR3 = USART_CR3!(UART7);
enum UART8_CR3 = USART_CR3!(UART8);

/* Guard time and prescaler register (USARTx_GTPR) */
enum USART6_GTPR = USART_GTPR!(USART6_BASE);
enum UART7_GTPR = USART_GTPR!(UART7);
enum UART8_GTPR = USART_GTPR!(UART8);

/* --- USART_CR1 values ---------------------------------------------------- */

/* OVER8: Oversampling mode */
enum USART_CR1_OVER8 = 1 << 15;

/* --- USART_CR3 values ---------------------------------------------------- */

/* ONEBIT: One sample bit method enable */
enum USART_CR3_ONEBIT = 1 << 11;

/** @cond */

/** @endcond */
