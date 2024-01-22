module libopencm3.stm32.common.usart_common_all;

public import libopencm3.cm3.common;
public import libopencm3.stm32.memorymap;

/* TODO. This belongs in usart_common_f124, but because defines are in the wrong order */


/* --- USART_CR1 values ---------------------------------------------------- */

/* UE: USART enable */
enum USART_CR1_UE = 1 << 13;

/* M: Word length */
enum USART_CR1_M = 1 << 12;

/* WAKE: Wakeup method */
enum USART_CR1_WAKE = 1 << 11;

/* PCE: Parity control enable */
enum USART_CR1_PCE = 1 << 10;

/* PS: Parity selection */
enum USART_CR1_PS = 1 << 9;

/* PEIE: PE interrupt enable */
enum USART_CR1_PEIE = 1 << 8;

/* TXEIE: TXE interrupt enable */
enum USART_CR1_TXEIE = 1 << 7;

/* TCIE: Transmission complete interrupt enable */
enum USART_CR1_TCIE = 1 << 6;

/* RXNEIE: RXNE interrupt enable */
enum USART_CR1_RXNEIE = 1 << 5;

/* IDLEIE: IDLE interrupt enable */
enum USART_CR1_IDLEIE = 1 << 4;

/* TE: Transmitter enable */
enum USART_CR1_TE = 1 << 3;

/* RE: Receiver enable */
enum USART_CR1_RE = 1 << 2;

/* RWU: Receiver wakeup */
enum USART_CR1_RWU = 1 << 1;

/* SBK: Send break */
enum USART_CR1_SBK = 1 << 0;

/* --- USART_CR2 values ---------------------------------------------------- */

/* LINEN: LIN mode enable */
enum USART_CR2_LINEN = 1 << 14;

/* CLKEN: Clock enable */
enum USART_CR2_CLKEN = 1 << 11;

/* CPOL: Clock polarity */
enum USART_CR2_CPOL = 1 << 10;

/* CPHA: Clock phase */
enum USART_CR2_CPHA = 1 << 9;

/* LBCL: Last bit clock pulse */
enum USART_CR2_LBCL = 1 << 8;

/* LBDIE: LIN break detection interrupt enable */
enum USART_CR2_LBDIE = 1 << 6;

/* LBDL: LIN break detection length */
enum USART_CR2_LBDL = 1 << 5;

/* ADD[3:0]: Address of the usart node */
enum USART_CR2_ADD_MASK = 0xF;

/* --- USART_CR3 values ---------------------------------------------------- */

/* CTSIE: CTS interrupt enable */
/* Note: N/A on UART4 & UART5 */
enum USART_CR3_CTSIE = 1 << 10;

/* CTSE: CTS enable */
/* Note: N/A on UART4 & UART5 */
enum USART_CR3_CTSE = 1 << 9;

/* RTSE: RTS enable */
/* Note: N/A on UART4 & UART5 */
enum USART_CR3_RTSE = 1 << 8;

/* DMAT: DMA enable transmitter */
/* Note: N/A on UART5 */
enum USART_CR3_DMAT = 1 << 7;

/* DMAR: DMA enable receiver */
/* Note: N/A on UART5 */
enum USART_CR3_DMAR = 1 << 6;

/* SCEN: Smartcard mode enable */
/* Note: N/A on UART4 & UART5 */
enum USART_CR3_SCEN = 1 << 5;

/* NACK: Smartcard NACK enable */
/* Note: N/A on UART4 & UART5 */
enum USART_CR3_NACK = 1 << 4;

/* HDSEL: Half-duplex selection */
enum USART_CR3_HDSEL = 1 << 3;

/* IRLP: IrDA low-power */
enum USART_CR3_IRLP = 1 << 2;

/* IREN: IrDA mode enable */
enum USART_CR3_IREN = 1 << 1;

/* EIE: Error interrupt enable */
enum USART_CR3_EIE = 1 << 0;

/* END TODO remove wrong order macro expansion */

/* --- Convenience defines ------------------------------------------------- */

/* CR1_PCE / CR1_PS combined values */
/****************************************************************************/
/** @defgroup usart_cr1_parity USART Parity Selection
@ingroup STM32F_usart_defines

@{*/
enum USART_PARITY_NONE = 0x00;
enum USART_PARITY_EVEN = USART_CR1_PCE;
enum USART_PARITY_ODD = USART_CR1_PS | USART_CR1_PCE;
/**@}*/
enum USART_PARITY_MASK = USART_CR1_PS | USART_CR1_PCE;

/* CR1_TE/CR1_RE combined values */
/****************************************************************************/
/** @defgroup usart_cr1_mode USART Tx/Rx Mode Selection
@ingroup STM32F_usart_defines

@{*/
enum USART_MODE_RX = USART_CR1_RE;
enum USART_MODE_TX = USART_CR1_TE;
enum USART_MODE_TX_RX = USART_CR1_RE | USART_CR1_TE;
/**@}*/
enum USART_MODE_MASK = USART_CR1_RE | USART_CR1_TE;

/****************************************************************************/
/** @defgroup usart_cr2_stopbits USART Stop Bit Selection
@ingroup STM32F_usart_defines

@{*/
enum USART_STOPBITS_1 = USART_CR2_STOPBITS_1;
enum USART_STOPBITS_0_5 = USART_CR2_STOPBITS_0_5;
enum USART_STOPBITS_2 = USART_CR2_STOPBITS_2;
enum USART_STOPBITS_1_5 = USART_CR2_STOPBITS_1_5;
/**@}*/

/* STOP[13:12]: STOP bits */
enum USART_CR2_STOPBITS_1 = 0x00 << 12;
enum USART_CR2_STOPBITS_0_5 = 0x01 << 12;
enum USART_CR2_STOPBITS_2 = 0x02 << 12;
enum USART_CR2_STOPBITS_1_5 = 0x03 << 12;
enum USART_CR2_STOPBITS_MASK = 0x03 << 12;
enum USART_CR2_STOPBITS_SHIFT = 12;

/* CR3_CTSE/CR3_RTSE combined values */
/****************************************************************************/
/** @defgroup usart_cr3_flowcontrol USART Hardware Flow Control Selection
@ingroup STM32F_usart_defines

@{*/
enum USART_FLOWCONTROL_NONE = 0x00;
enum USART_FLOWCONTROL_RTS = USART_CR3_RTSE;
enum USART_FLOWCONTROL_CTS = USART_CR3_CTSE;
enum USART_FLOWCONTROL_RTS_CTS = USART_CR3_RTSE | USART_CR3_CTSE;
/**@}*/
enum USART_FLOWCONTROL_MASK = USART_CR3_RTSE | USART_CR3_CTSE;

/* --- Function prototypes ------------------------------------------------- */

extern (C) {

void usart_set_baudrate(uint usart, uint baud);
void usart_set_databits(uint usart, uint bits);
uint usart_get_databits(uint usart);
void usart_set_stopbits(uint usart, uint stopbits);
uint usart_get_stopbits(uint usart);
void usart_set_parity(uint usart, uint parity);
uint usart_get_parity(uint usart);
void usart_set_mode(uint usart, uint mode);
void usart_set_flow_control(uint usart, uint flowcontrol);
void usart_enable(uint usart);
void usart_disable(uint usart);
void usart_send(uint usart, ushort data);
ushort usart_recv(uint usart);
void usart_wait_send_ready(uint usart);
void usart_wait_recv_ready(uint usart);
void usart_send_blocking(uint usart, ushort data);
ushort usart_recv_blocking(uint usart);
void usart_enable_rx_dma(uint usart);
void usart_disable_rx_dma(uint usart);
void usart_enable_tx_dma(uint usart);
void usart_disable_tx_dma(uint usart);
void usart_enable_rx_interrupt(uint usart);
void usart_disable_rx_interrupt(uint usart);
void usart_enable_tx_interrupt(uint usart);
void usart_disable_tx_interrupt(uint usart);
void usart_enable_tx_complete_interrupt(uint usart);
void usart_disable_tx_complete_interrupt(uint usart);
void usart_enable_idle_interrupt(uint usart);
void usart_disable_idle_interrupt(uint usart);
void usart_enable_error_interrupt(uint usart);
void usart_disable_error_interrupt(uint usart);
bool usart_get_flag(uint usart, uint flag);

}
/** @cond */

/** @endcond */
/**@}*/
