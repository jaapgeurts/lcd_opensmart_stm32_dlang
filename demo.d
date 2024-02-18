import core.stdc.stdio;

import libopencm3.stm32.rcc;

import io;
import clock;
import mcudruntime;

import ili9327;
import lm75a;

import touch;

import sdcard;
import pff;


void gpio_setup()
{
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);
}

// put in data segment to squeeze out every bit of performance.
__gshared ubyte[512] buf;


struct Color {
    ubyte r;
    ubyte g;
    ubyte b;
}
Color[7] cols = [
  {0x1f,0x3f,0x1f},
  {0x1f,0x3f,0x00},
  {0x00,0x3f,0x00},
  {0x00,0x3f,0x1f},
  {0x00,0x00,0x1f},
  {0x1f,0x00,0x1f},
  {0x1f,0x00,0x00},
];

FRESULT rc;
__gshared DIR dir;
FILINFO fno;

//char* cur_file;

FATFS fatfs;

void open_card(DIR* direc, FATFS* fat) {


    writeln("Mounting SDcard");

    rc = pf_mount(fat);
    if (rc) {
        writeln("failed mounting: ", rc);
        return;
    }

    // open root dir
    rc = pf_opendir(direc, "".ptr);
    if (rc) {
        writeln("failed open dir: ",rc);
        return;
    }

    writeln("Dir open");
}
/+
void next_dir(DIR* dir) {

    rc = pf_readdir(dir, &fno);	/* Read a directory item */
    if (rc || fno.fname[0] == 0) {
        writeln("Nothing: ", rc);
        return;	/* Error or end of dir */
    }
    if (!(fno.fattrib & AM_DIR)) {
         int len = strlen(&fno.fname[0]);
        // cur_file[0..len] = fno.fname[0..len];
        writeln(cast(string)(fno.fname[0..len]),':',fno.fsize);
        cur_file = &fno.fname[0];

    }
}+/


extern(C) void main()
{

    rt_start();

    clock_setup();
    systick_setup();

    gpio_setup();
    setupIO();

    writeln("STM32F401RE Dlang LibOpenCM3 demo");


    init_touch();

    while(true) {
      get_point();

      msleep(1000);
    }


    // TODO: unify setup naming convention
    //init_lm72a();
    lcd_setup();
    device_code_read();

    // RGB 5-6-5
    foreach(i; 0..7) {
        fill_display(cols[i].r,cols[i].g,cols[i].b);
        msleep(1000);
    }

    init_sdcard();

    open_card(&dir, &fatfs);
    // next_dir(&dir);
    // next_dir(&dir);
    // next_dir(&dir);
    // next_dir(&dir);
    string[117] names = ["LEAF.RAW", "EAGLE.RAW","BEACHB~1.RAW",
    "000.RAW", "001.RAW","002.RAW","003.RAW","004.RAW",
    "005.RAW","006.RAW","007.RAW","008.RAW","009.RAW","010.RAW","011.RAW","012.RAW",
    "013.RAW","014.RAW","015.RAW","016.RAW","017.RAW","018.RAW","019.RAW","020.RAW",
    "021.RAW","022.RAW","023.RAW","024.RAW","025.RAW","026.RAW","027.RAW","028.RAW",
    "029.RAW","030.RAW","031.RAW","032.RAW","033.RAW","034.RAW","035.RAW","036.RAW",
    "037.RAW","038.RAW","039.RAW","040.RAW","041.RAW","042.RAW","043.RAW","044.RAW",
    "045.RAW","046.RAW","047.RAW","048.RAW","049.RAW","050.RAW","051.RAW","052.RAW",
    "053.RAW","054.RAW","055.RAW","056.RAW","057.RAW","058.RAW","059.RAW","060.RAW",
    "061.RAW","062.RAW","063.RAW","064.RAW","065.RAW","066.RAW","067.RAW","068.RAW",
    "069.RAW","070.RAW","071.RAW","072.RAW","073.RAW","074.RAW","075.RAW","076.RAW",
    "077.RAW","078.RAW","079.RAW","080.RAW","081.RAW","082.RAW","083.RAW","084.RAW",
    "085.RAW","086.RAW","087.RAW","088.RAW","089.RAW","090.RAW","091.RAW","092.RAW",
    "093.RAW","094.RAW","095.RAW","096.RAW","097.RAW","098.RAW","099.RAW","100.RAW",
    "101.RAW","102.RAW","103.RAW","104.RAW","105.RAW","106.RAW","107.RAW","108.RAW",
    "109.RAW","110.RAW","111.RAW","112.RAW","113.RAW" ];
    while(true)
    {
        foreach(name; names) {
            write(name);
            rc = pf_open(name.ptr);
            if (rc) {
                writeln("failed open file: ",rc);
                continue;
            }

            start_write();
            foreach(j; 0..810) { // 810 blocks of 512 bytes
                uint res;
                pf_read(buf.ptr, 512, &res);
                foreach(i; 0..128) { // data is RGBA (128*4 = 512)
                    send_pixel(buf[i<<2],buf[(i<<2)+1],buf[(i<<2)+2]);
                }
            }
            end_write();
            writeln(" loaded.");
            //writeln("Temperature: ",read_temp());

            msleep(8000);
        }
    }


    // start_write();
    // foreach(j; 0..810) { // 810 blocks of 512 bytes
    //     sdcard_readblock(j,buf);
    //     foreach(i; 0..128) { // data is RGBA (128*4 = 512)
    //         send_pixel(buf[i*4],buf[i*4+1],buf[i*4+2]);
    //     }
    // }
    // end_write();
    writeln("Loaded");
    while(true) {
       msleep(5000);
    }

    while(true) {
        writeln("Temperature: ",read_temp());
        msleep(1000);
    }

    while(true) {
        // RGB 5-6-5
        foreach(i; 0..7) {
            fill_display(cols[i].r,cols[i].g,cols[i].b);
            msleep(10000);
        }
    }

    writeln("Sent all data");

}
