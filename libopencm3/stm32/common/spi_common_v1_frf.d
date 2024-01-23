module libopencm3.stm32.common.spi_common_v1_frf;

public import libopencm3.stm32.common.spi_common_v1;


/* --- SPI_CR2 values ------------------------------------------------------ */

/* FRF: Frame format */
/* Note: Not used in I2S mode. */
enum SPI_CR2_FRF = 1 << 4;
enum SPI_CR2_FRF_MOTOROLA_MODE = 0 << 4;
enum SPI_CR2_FRF_TI_MODE = 1 << 4;

/* --- SPI_SR values ------------------------------------------------------- */

/* FRE / TIFRFE: TI frame format error */
enum SPI_SR_TIFRFE = 1 << 8;
enum SPI_SR_FRE = 1 << 8;

/* --- Function prototypes ------------------------------------------------- */
extern(C) {
void spi_set_frf_ti (uint spi);
void spi_set_frf_motorola (uint spi);
}
/** @cond */

/** @endcond */
/**@}*/
