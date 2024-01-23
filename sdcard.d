/* Module to talk to SPI sd sdcard
 * connection (uno pins):
 * SPI  : UNO : STM NUCLEO
 * CS   : D5  : PB4
 * SCK  : D13 : PA5
 * MISO : D12 : PA6
 * MOSI : D11 : PA7
 *
 * the board is connected to alternate function AF05, SPI1
 */

module sdcard;

import mcudruntime;

import libopencm3.stm32.rcc;
import libopencm3.stm32.gpio;
import libopencm3.stm32.spi;

void init_sdcard() {

    rcc_periph_clock_enable(RCC_GPIOA|RCC_GPIOB);

        /* Chip select line */
	gpio_set(GPIOB, GPIO4);
	gpio_mode_setup(GPIOB, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, GPIO4);

    gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO5 | GPIO6 | GPIO7);
	gpio_set_af(GPIOA, GPIO_AF5, GPIO5 | GPIO6 | GPIO7);
	// scard transfer mode perhaps 50MHz
	gpio_set_output_options(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, GPIO5 | GPIO7);


    rcc_periph_clock_enable(RCC_SPI1);

    spi_init_master(SPI1,
                    SPI_CR1_BAUDRATE_FPCLK_DIV_8,
					SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE,
					SPI_CR1_CPHA_CLK_TRANSITION_0,
					SPI_CR1_DFF_8BIT,
					SPI_CR1_MSBFIRST);
	spi_enable_ss_output(SPI1);

    sp_enable(SPI1);

    // wait at least 1ms
    delay(500);

    // send 80 clock cycles to synchronize
    foreach(i; 0..10)
        SPI_transfer(0xFF);

}
