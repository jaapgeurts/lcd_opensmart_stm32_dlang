module touch;

import libopencm3.stm32.rcc;
import libopencm3.stm32.gpio;
import libopencm3.stm32.adc;
import mcudruntime;
import io;


// These are the pins for the shield!
enum YP = GPIO1; // Arduino uno pin A1, PA1(ADC1/chan 1) must be an analog pin
enum XM = GPIO4; // Arduino uno pin A2, PA4(ADC1/chan 4) must be an analog pin
enum YM = GPIO8; // Arduino uno pin 7, PA8 can be a digital pin
enum XP = GPIO10; // Arduino uno pin 6, PB10 can be a digital pin

// For better pressure precision, we need to know the resistance
// between X+ and X- Use any multimeter to read it
// For the one we're using, its 300 ohms across the X plate
enum rxplate = 300;

enum MINPRESSURE = 10;
enum MAXPRESSURE = 1000;

enum NUMSAMPLES = 2;

struct TSPoint {
  ushort x, y, z;
}

public void init_touch()
{

   // setup ADC
   rcc_periph_clock_enable(RCC_ADC1);
   adc_power_off(ADC1);

   adc_disable_scan_mode(ADC1);
   adc_set_single_conversion_mode(ADC1);

   adc_set_sample_time_on_all_channels(ADC1, ADC_SMPR_SMP_3CYC);
   adc_disable_external_trigger_regular(ADC1);
   //adc_set_right_aligned(ADC1);


   adc_power_on(ADC1);


}


public TSPoint get_point() {

   ushort x, y, z;
   uint[NUMSAMPLES] samples;
   ubyte i, valid;
   ubyte[1] channel_array;

   valid = 1;

   // read x

   gpio_mode_setup(GPIOA,GPIO_MODE_INPUT,GPIO_PUPD_NONE, YM); // not in use: high impedance
   gpio_mode_setup(GPIOB,GPIO_MODE_OUTPUT,GPIO_PUPD_NONE, XP);
   gpio_mode_setup(GPIOA,GPIO_MODE_OUTPUT,GPIO_PUPD_NONE, XM);
   gpio_mode_setup(GPIOA,GPIO_MODE_ANALOG,GPIO_PUPD_NONE, YP );

   // Apply voltage across xp(High) -> xm(low), read yp. yp & ym to input

   gpio_set(GPIOB,XP);
   gpio_clear(GPIOA, XM);

   channel_array[0] = 1;
   adc_set_regular_sequence(ADC1, channel_array.length, channel_array.ptr);

   for (i=0; i<NUMSAMPLES; i++) {
      adc_start_conversion_regular(ADC1);
      samples[i] = adc_read_regular(ADC1);
      writeln("Sample X: ",samples[i]);
   }

   x = cast(ushort)(4096 - samples[0]);


   // read y

   gpio_mode_setup(GPIOB,GPIO_MODE_INPUT,GPIO_PUPD_NONE, XP); // not in use: high impedance
   gpio_mode_setup(GPIOA,GPIO_MODE_OUTPUT,GPIO_PUPD_NONE, YM | YP);
   gpio_mode_setup(GPIOA,GPIO_MODE_ANALOG,GPIO_PUPD_NONE, XM );

   // Apply voltage across xp(High) -> xm(low), read yp. yp & ym to input

   gpio_set(GPIOA,YM);
   gpio_clear(GPIOA, YP);

   channel_array[0] = 4;
   adc_set_regular_sequence(ADC1, channel_array.length, channel_array.ptr);

   for (i=0; i<NUMSAMPLES; i++) {
      adc_start_conversion_regular(ADC1);
      samples[i] = adc_read_regular(ADC1);
      writeln("Sample Y: ",samples[i]);
   }

   y = cast(ushort)(4096 - samples[0]);

   /+ pressure part

      // Set X+ to ground
      pinMode(_xp, OUTPUT);
      *portOutputRegister(xp_port) &= ~xp_pin;
      //digitalWrite(_xp, LOW);

      // Set Y- to VCC
      *portOutputRegister(ym_port) |= ym_pin;
      //digitalWrite(_ym, HIGH);

      // Hi-Z X- and Y+
      *portOutputRegister(yp_port) &= ~yp_pin;
      //digitalWrite(_yp, LOW);
      pinMode(_yp, INPUT);

      int z1 = analogRead(_xm);
      int z2 = analogRead(_yp);

      if (_rxplate != 0) {
      // now read the x
      float rtouch;
      rtouch = z2;
      rtouch /= z1;
      rtouch -= 1;
      rtouch *= x;
      rtouch *= _rxplate;
      rtouch /= 1024;

      z = rtouch;
      } else {
      z = (1023-(z2-z1));
      }

      if (! valid) {
      z = 0;
      }
+/
      return TSPoint(x, y, z);
}


