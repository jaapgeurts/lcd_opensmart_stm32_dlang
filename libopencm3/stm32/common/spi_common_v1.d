module libopencm3.stm32.common.spi_common_v1;

public import libopencm3.stm32.common.spi_common_all;


/* DFF: Data frame format */
/****************************************************************************/
/** @defgroup spi_dff SPI data frame format
@ingroup spi_defines

@{*/

enum SPI_CR1_DFF_8BIT = 0 << 11;
enum SPI_CR1_DFF_16BIT = 1 << 11;

/**@}*/

enum SPI_CR1_DFF = 1 << 11;

/* --- Function prototypes ------------------------------------------------- */
extern(C) {

int spi_init_master (
    uint spi,
    uint br,
    uint cpol,
    uint cpha,
    uint dff,
    uint lsbfirst);
void spi_set_dff_8bit (uint spi);
void spi_set_dff_16bit (uint spi);
}
/** @cond */

/** @endcond */
/**@}*/
