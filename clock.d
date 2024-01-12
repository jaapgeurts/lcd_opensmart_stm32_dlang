module clock;

import stmbridge;

// TODO: system_millis was declared volatile

/* monotonically increasing number of milliseconds from reset
 * overflows every 49 days if you're wondering
 */
__gshared ulong system_millis;

/* Called when systick fires */
extern (C) void sys_tick_handler() @nogc nothrow
{
	system_millis++;
}

/* sleep for delay milliseconds */
void msleep(ulong delay)
{
	ulong wake = system_millis + delay;
	while (wake > system_millis)
        continue;
}

/* Set up a timer to create 1mS ticks. */
void systick_setup()
{
	/* clock rate / 1000 to get 1mS interrupt rate */
	systick_set_reload(84000);
	systick_set_clocksource(1 << STK_CSR_CLKSOURCE_LSB);

	systick_interrupt_enable();

	/* this done last */
	systick_counter_enable();
}

/* Set STM32 to 84 MHz. */
void clock_setup()
{
	rcc_clock_setup_pll(&rcc_hse_8mhz_3v3[RCC_CLOCK_3V3_84MHZ]);

}
