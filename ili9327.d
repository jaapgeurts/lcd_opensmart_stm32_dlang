/* ILI 9327 driver

 * screen size 240x432 = 103680 pixels

*/
module ili9327;

import mcudruntime;
import io;
import libopencm3.stm32.gpio;

struct ILI9327 {
}

private enum  {
    D0 = GPIO9,   // A
    D1 = GPIO7,   // C
    D2 = GPIO6,   // B
    D3 = GPIO7,   // A
    D4 = GPIO5,   // B
    D5 = GPIO5,   // A
    D6 = GPIO10,  // B
    D7 = GPIO8,   // A

    RD = GPIO0, // A
    WR = GPIO1, // A
    CD = GPIO4, // A
    CS = GPIO0, // B

    SD_CS = GPIO4, // B
}

// TODO: change to Named enum ILI9327Command
enum  {
    CMD_SWRESET  = 0x01,
    CMD_SLPIN    = 0x10,
    CMD_SLPOUT   = 0x11,
    CMD_PTLON    = 0x10, // Partial Mode ON
    CMD_NORON    = 0x13,
    CMD_DINVOFF  = 0x20,
    CMD_DINVON   = 0x21,
    CMD_DISPOFF  = 0x28,
    CMD_DISPON   = 0x29,
    CMD_CASET    = 0x2a,
    CMD_PASET    = 0x2b,
    CMD_RAMWR    = 0x2c,
    CMD_IDMOFF   = 0x38,
    CMD_IDMON    = 0x39,
    CMD_VSCRDEF  = 0x33,
    CMD_MADCTL   = 0x36,
    CMD_VSCRSADD = 0x37,
    CMD_PIXSET   = 0x3a,
    CMD_WRDISBV  = 0x51,
    CMD_WRCTRLD  = 0x53,
    CMD_RDCODE   = 0xef,
}

// TODO: change to Named enum
enum AddressMode {
    BottomToTop         = 0x08, // default is TopToBottom
    RightToLeft         = 0x40, // default is LeftToRight
    ColumnPageOrder     = 0x20, // default is Page/Column
    RefreshBottomToTop  = 0x10, // default is TopToBottom
    PixelOrderBGR       = 0x08, // default order is RGB
    // latch order 0x04 (B2 must be 0)
    HorizontalFlip      = 0x02,
    VerticalFlip        = 0x01,
}

private void set_databus_read() {
   // back to high impedance
  gpio_mode_setup(GPIOA,GPIO_MODE_INPUT,GPIO_PUPD_NONE, D0 | D3 | D5 | D7 );
  gpio_mode_setup(GPIOB,GPIO_MODE_INPUT,GPIO_PUPD_NONE, D2 | D4 | D6);
  gpio_mode_setup(GPIOC,GPIO_MODE_INPUT,GPIO_PUPD_NONE, D1 );
}

private void set_databus_write() {
  gpio_mode_setup(GPIOA,GPIO_MODE_OUTPUT,GPIO_PUPD_PULLUP, D0 | D3 | D5 | D7 );
  gpio_mode_setup(GPIOB,GPIO_MODE_OUTPUT,GPIO_PUPD_PULLUP, D2 | D4 | D6);
  gpio_mode_setup(GPIOC,GPIO_MODE_OUTPUT,GPIO_PUPD_PULLUP, D1 );
}

void lcd_setup(ref ILI9327 lcd) {

  // set port to write
  gpio_mode_setup(GPIOA,GPIO_MODE_OUTPUT,GPIO_PUPD_NONE, RD | WR | CD );
  gpio_mode_setup(GPIOB,GPIO_MODE_OUTPUT,GPIO_PUPD_NONE, CS);

  // GPIO_OSPEED_2MHZ GPIO_OSPEED_50MHZ GPIO_OSPEED_100MHZ
  // Doesn't any speed increase effect. (changes edge speed)
  // gpio_set_output_options(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, D0 | D3 | D5 | D7 | RD | WR | CD);
  // gpio_set_output_options(GPIOB, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, D2 | D4 | D6 | CS);
  // gpio_set_output_options(GPIOC, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, D1);

  // These are all active low, so set high
  gpio_set(GPIOA, RD);
  gpio_set(GPIOA, WR);
  gpio_set(GPIOB, CS);
  gpio_set(GPIOA, CD);

  write_lcd_cmd(CMD_SWRESET); // reset
  delay(1500); // TODO wait at least 10 frame period.

  write_lcd_cmd(CMD_SLPOUT); // wake up from sleep
  delay(500); // must wait >=5ms before another command. >=120ms before sleep again

  // write_lcd_cmd(CMD_DISPOFF);
  // write_lcd_cmd(CMD_IDMON); // dpy idle mode off
  // write_lcd_cmd(CMD_DINVOFF); // dpy inverse

  // write_lcd_cmd(CMD_WRCTRLD,0b00101100); // display control settings
  // write_lcd_cmd(CMD_WRDISBV,0xff); // display brightness

  write_lcd_cmd(CMD_MADCTL, AddressMode.ColumnPageOrder | AddressMode.RightToLeft | AddressMode.VerticalFlip); // memory access control
  write_lcd_cmd(CMD_PIXSET,0b0000101); //18bits/pixel. RGB 5-6-5

  // Column Address Set
  gpio_clear(GPIOB, CS);
  write_lcd(CMD_CASET,true);
  write_lcd(0,false);
  write_lcd(0,false);
  write_lcd(1,false);
  write_lcd(0xff,false);
  gpio_set(GPIOB, CS);


  // Page Address set
  gpio_clear(GPIOB, CS);
  write_lcd(CMD_PASET,true);
  write_lcd(0,false);
  write_lcd(0,false);
  write_lcd(1,false);
  write_lcd(0xff,false);
  gpio_set(GPIOB, CS);

  // write_lcd_cmd(CMD_NORON);

  write_lcd_cmd(CMD_DISPON); // display on

  // init done

}

private void write_lcd(ubyte cmd, bool isCommand) {

  if (isCommand)
    gpio_clear(GPIOA, CD);

  set_databus_write();

  gpio_clear(GPIOA,WR);

  /*
    D0 = GPIO9,   // A
    D7 = GPIO8,   // A
    D3 = GPIO7,   // A
    D5 = GPIO5,   // A

    D6 = GPIO10,  // B
    D2 = GPIO6,   // B
    D4 = GPIO5,   // B

    D1 = GPIO7,   // C
    */
  //import core.volatile;


  // cmd & 0x01 ? gpio_set(GPIOA, D0) : gpio_clear(GPIOA,D0);
  // cmd & 0x08 ? gpio_set(GPIOA, D3) : gpio_clear(GPIOA,D3);
  // cmd & 0x20 ? gpio_set(GPIOA, D5) : gpio_clear(GPIOA,D5);
  // cmd & 0x80 ? gpio_set(GPIOA, D7) : gpio_clear(GPIOA,D7);

  // prepare data
  uint val = volatileLoad(GPIOA_ODR);
  val &= ~(D0|D3|D5|D7);
  // val |= (cmd<<9); // to bit 9
  // val |= ((cmd&0x08)<<4); //  to  bit 7
  // val |= (cmd&0x20); // to  bit 5
  // val |= ((cmd&0x80)<<1); // to  bit 8
  val |= (cmd<<9) | ((cmd&0x08)<<4) | (cmd&0x20) | ((cmd&0x80)<<1);
  volatileStore(GPIOA_ODR, val);

  // cmd & 0x04 ? gpio_set(GPIOB, D2) : gpio_clear(GPIOB,D2);
  // cmd & 0x10 ? gpio_set(GPIOB, D4) : gpio_clear(GPIOB,D4);
  // cmd & 0x40 ? gpio_set(GPIOB, D6) : gpio_clear(GPIOB,D6);

  val = volatileLoad(GPIOB_ODR);
  val &= ~(D2 | D4 | D6);
  // val |= ((cmd & 0x04 ) << 4); // to bit 6
  // val |= ((cmd & 0x10 ) << 1); // to bit 5
  // val |= ((cmd & 0x40 ) << 4); // to bit 10
  val |= ((cmd & 0x04 ) << 4) | ((cmd & 0x10 ) << 1) | ((cmd & 0x40 ) << 4);
  volatileStore(GPIOB_ODR, val);

  cmd & 0x02 ? gpio_set(GPIOC, D1) : gpio_clear(GPIOC,D1);

  //delay(1);
  // Latch data on write returns to high.
  gpio_set(GPIOA,WR);
  //delay(1);

    // back to high impedence
  set_databus_read();

  gpio_set(GPIOA,CD);

}

private void write_lcd_cmd(ubyte cmd) {
  // select chip
  gpio_clear(GPIOB, CS);

  write_lcd(cmd, true);

  // deselect chip
  gpio_set(GPIOB, CS);

}

private void write_lcd_cmd(ubyte cmd, ubyte arg1) {
  // select chip
  gpio_clear(GPIOB, CS);

  write_lcd(cmd, true);

  write_lcd(arg1,false);

  // deselect chip
  gpio_set(GPIOB, CS);

}

private ubyte read_data() {

  gpio_clear(GPIOA,RD);

  // prepare data
  // TODO: convert to volatileRead
  ubyte data = 0;
  if (gpio_get(GPIOA,D0)) data |= 0x01;
  if (gpio_get(GPIOC,D1)) data |= 0x02;
  if (gpio_get(GPIOB,D2)) data |= 0x04;
  if (gpio_get(GPIOA,D3)) data |= 0x08;
  if (gpio_get(GPIOB,D4)) data |= 0x10;
  if (gpio_get(GPIOA,D5)) data |= 0x20;
  if (gpio_get(GPIOB,D6)) data |= 0x40;
  if (gpio_get(GPIOA,D7)) data |= 0x80;

    // Latch data on write returns to high.
  gpio_set(GPIOA,RD);

  return data;
}

private ubyte[6] read_lcd(ubyte cmd) {
  // select chip

  write_lcd(cmd, true);

  gpio_clear(GPIOB, CS);

  ubyte[6] codes;
  foreach(i ; 0..6)
    codes[i] = read_data();

  // deselect chip
  gpio_set(GPIOB, CS);

  return codes;

}

void device_code_read() {

    ubyte[6] codes = read_lcd(CMD_RDCODE);

    foreach(code ; codes) {
        writeln(cast(uint)code);
    }
}

void start_write() {


    // // Column Address Set
    // gpio_clear(GPIOB, CS);
    // write_lcd(CMD_CASET,true);
    // write_lcd(0,false);
    // write_lcd(0,false);
    // write_lcd(1,false);
    // write_lcd(0xff,false);
    // // gpio_set(GPIOB, CS);
    //
    //
    // // Page Address set
    // // gpio_clear(GPIOB, CS);
    // write_lcd(CMD_PASET,true);
    // write_lcd(0,false);
    // write_lcd(0,false);
    // write_lcd(1,false);
    // write_lcd(0xff,false);
    // gpio_set(GPIOB, CS);
    //
    gpio_clear(GPIOB, CS);
     write_lcd(CMD_RAMWR,true); // Ram Write
    //
    // delay(10);


}
// RGB 5-6-5
void send_pixel(ubyte r,ubyte g, ubyte b) {
    b = b >> 3;
    g = g >> 2;
    r = r >> 3;
    write_lcd((((b & 0x1f) << 3) | ((g&0x3f)>>3)),false);
    write_lcd(((g&0x07)<<5) | (r&0x1f),false);
}

void end_write() {
    gpio_set(GPIOB, CS);

}

void fill_display(ubyte r,ubyte g, ubyte b) {

    gpio_clear(GPIOB, CS);
    write_lcd(CMD_RAMWR,true); // Ram Write

    // RGB-666
    // foreach(i; 0..103680) {
    //     write_lcd(0x3f<<2,false); // B
    //     write_lcd(0x00<<2,false); // G
    //     write_lcd(0x3f<<2,false); // R
    // }
    // // RGB 5-6-5
    // ubyte r = 0x0f; // max = 1f
    // ubyte g = 0x3f; // max = 3f
    // ubyte b = 0x10; // max = 1f
    // screen size 240x432 = 103680 pixels
    foreach(i; 0..103680) {
         write_lcd(cast(ubyte)((b & 0x1f) << 3) | ((g&0x3f)>>3),false);
         write_lcd(((g&0x07)<<5) | (r&0x1f),false);
    }
    gpio_set(GPIOB, CS);
}
