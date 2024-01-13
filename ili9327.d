module ili9327;

import mcudruntime;
import io;
import stmbridge;

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

enum {
    CMD_SWRESET  = 0x01,
    CMD_SLPOUT   = 0x11,
    CMD_NORON    = 0x13,
    CMD_DINVOFF  = 0x20,
    CMD_DINVON   = 0x21,
    CMD_DISPOFF  = 0x28,
    CMD_DISPON   = 0x29,
    CMD_CASET    = 0x2a,
    CMD_PASET    = 0x2b,
    CMD_RAMWR    = 0x2c,
    CMD_VSCRDEF  = 0x33,
    CMD_MADCTL   = 0x36,
    CMD_VSCRSADD = 0x37,
    CMD_PIXSET   = 0x3a,
    CMD_WRDISBV  = 0x51,
    CMD_WRCTRLD  = 0x53,
    CMD_RDCODE   = 0xef,
}

enum {
    ILI_MASK_MADCTL_MY  = 0x80,
    ILI_MASK_MADCTL_MX  = 0x40,
    ILI_MASK_MADCTL_MV  = 0x20,
    ILI_MASK_MADCTL_ML  = 0x10,
    ILI_MASK_MADCTL_BGR = 0x08,
    ILI_MASK_MADCTL_MH  = 0x04,
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
  // Doesn't seem to have any speed increase effect.
  // gpio_set_output_options(GPIOA, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, D0 | D3 | D5 | D7 | RD | WR | CD);
  // gpio_set_output_options(GPIOB, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, D2 | D4 | D6 | CS);
  // gpio_set_output_options(GPIOC, GPIO_OTYPE_PP, GPIO_OSPEED_25MHZ, D1);

  // These are all active low, so set high
  gpio_set(GPIOA, RD);
  gpio_set(GPIOA, WR);
  gpio_set(GPIOB, CS);
  gpio_set(GPIOA, CD);

  set_databus_read();

}

private void write_cmd(ubyte cmd, bool isCommand) {

  if (isCommand)
    gpio_clear(GPIOA, CD);

  set_databus_write();

  gpio_clear(GPIOA,WR);

  // prepare data
  cmd & 0x01 ? gpio_set(GPIOA, D0) : gpio_clear(GPIOA,D0);
  cmd & 0x02 ? gpio_set(GPIOC, D1) : gpio_clear(GPIOC,D1);
  cmd & 0x04 ? gpio_set(GPIOB, D2) : gpio_clear(GPIOB,D2);
  cmd & 0x08 ? gpio_set(GPIOA, D3) : gpio_clear(GPIOA,D3);
  cmd & 0x10 ? gpio_set(GPIOB, D4) : gpio_clear(GPIOB,D4);
  cmd & 0x20 ? gpio_set(GPIOA, D5) : gpio_clear(GPIOA,D5);
  cmd & 0x40 ? gpio_set(GPIOB, D6) : gpio_clear(GPIOB,D6);
  cmd & 0x80 ? gpio_set(GPIOA, D7) : gpio_clear(GPIOA,D7);

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

  write_cmd(cmd, true);

  // deselect chip
  gpio_set(GPIOB, CS);

}

private void write_lcd_cmd(ubyte cmd, ubyte arg1) {
  // select chip
  gpio_clear(GPIOB, CS);

  write_cmd(cmd, true);

  write_cmd(arg1,false);

  // deselect chip
  gpio_set(GPIOB, CS);

}

private ubyte read_data() {

  gpio_clear(GPIOA,RD);

  delay(1);

  // prepare data
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
  gpio_clear(GPIOB, CS);

  write_cmd(cmd, true);

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

void set_display_off(ref const ILI9327 lcd) {
    write_lcd_cmd(CMD_SWRESET); // reset
    //write_lcd_cmd(0xaa);
    //write_lcd_cmd(0x55);
    delay(10);

    write_lcd_cmd(CMD_DISPOFF);
    //write_lcd_cmd(0x38);
    write_lcd_cmd(CMD_SLPOUT);
    delay(10);
    write_lcd_cmd(CMD_DINVOFF);

//    write_lcd_cmd(0x29);
    // write_lcd_cmd(0x51,0x00);

    write_lcd_cmd(CMD_WRCTRLD,0b00100100);
    write_lcd_cmd(CMD_WRDISBV,0xff);

    //write_lcd_cmd(0x10);

    write_lcd_cmd(CMD_MADCTL,ILI_MASK_MADCTL_MX | ILI_MASK_MADCTL_MV);
    write_lcd_cmd(CMD_PIXSET,0b0000101); //18bits/pixel. RGB 5-6-5

    write_lcd_cmd(CMD_NORON);

    delay(10);

    write_lcd_cmd(CMD_DISPON);

    // init done

    write_lcd_cmd(0x2a,0x00);
    write_lcd_cmd(0x2b,0x00);

    gpio_clear(GPIOB, CS);
    write_cmd(CMD_RAMWR,true);
//    write_lcd_cmd(0x2c, true);
    //RGB-666
    // foreach(i; 0..103680) {
    //     write_cmd(0x3f<<2,false); // B
    //     write_cmd(0x00<<2,false); // G
    //     write_cmd(0x3f<<2,false); // R
    // }
    // RGB 5-6-5
    ubyte r = 0x1f; // max = 1f
    ubyte g = 0x3f; // max = 3f
    ubyte b = 0x00; // max = 1f
    // screen size 240x432 = 103680 pixels
    foreach(i; 0..103680) {
         write_cmd(cast(ubyte)((b & 0x1f) << 5) | ((g&0x3f)>>3),false); // B
         write_cmd(((g&0x07)<<5) | (r&0x1f),false); // G
    }
    gpio_set(GPIOB, CS);


}
