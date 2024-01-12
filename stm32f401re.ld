EXTERN(vector_table)

/* Entry Point */
ENTRY(reset_handler)

/* Memories definition */
MEMORY
{
 flash (rx)  : ORIGIN = 0x08000000, LENGTH = 512K
 ram   (rwx) : ORIGIN = 0x20000000, LENGTH = 96K
}

/* Section definitions */
SECTIONS
{
  /* We don't need exceptions, and discarding these sections
     prevents linker errors with LDC */
  /DISCARD/ :
  {
    *(.ARM.extab*)
    *(.ARM.exidx*)
  }

  /* program code placed in flash */
 .text : {
    *(.vectors)  /* Startup vector table */
    *(.text)    /* text sections */
    *(.text.*)    /* text sections */
    . = ALIGN(4);
    *(.rodata)  /* Read only data */
    *(.rodata.*)  /* Read only data */
    . = ALIGN(4);
 } >flash

  /* array initialization code placed in flash */
 .preinit_array : {
    . = ALIGN(4);
    __preinit_array_start = .;
    KEEP (*(.preinit_array))
    __preinit_array_end = .;
 } >flash

  /* array initialization code placed in flash */
 .init_array : {
    . = ALIGN(4);
    __init_array_start = .;
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array))
    __init_array_end = .;
 } >flash

  /* array initialization code placed in flash */
 .fini_array : {
    . = ALIGN(4);
    __fini_array_start = .;
    KEEP (*(.fini_array))
    KEEP (*(SORT(.fini_array.*)))
    __fini_array_end = .;
 } >flash

 /* ARM exception table
 .ARM.extab : {
    *(.ARM.extab*)
 } >flash

 /* ARM start address table
 .ARM.exidx : {
    __exidx_start = .;
    *(.ARM.exidx*)
    __exidx_end = .;
 } >flash
*/
 /* _etext = The first address following the program text. */
 . = ALIGN(4);
 _etext = .;

 /* ram not initialized at startup */
 .noinit (NOLOAD) : {
    *(.noinit*)
 } >ram

 . = ALIGN(4);

 /* initialized global variables */
 .data : {
    _data = .;
    *(.data)
    *(.data.*)
    . = ALIGN(4);
    _edata = .; /* The first address following the initialized vars region. */
 } >ram AT >flash

 _data_loadaddr = LOADADDR(.data);

 /* Block starting symbol = uninitialized global variables */
 .bss  (NOLOAD) : {
    *(.bss)
    *(.bss.*)
    *(COMMON)
    . = ALIGN(4);
    _ebss = .; /* The first address following the uninitialized vars region. */
 } >ram

 . = ALIGN(4);

  /* TLS Block starting symbol = uninitialized global variables */
 .tbss (NOLOAD) : {
   _tbss = .;
    *(.tbss)
    *(.tbss.*)
    *(.tcommon)
    . = ALIGN(4);
    _etbss = .; /* The first address following the uninitialized vars region. */
 } >ram

 /*  . = ALIGN(4);*/

 /* TLS initialized variables */
 .tdata ALIGN(_etbss , 4) : {
   _tdata = .;
   *(.tdata)
   *(.tdata.*)
   . = ALIGN(4);
   _etdata = .;
 } >ram AT >flash

_tdata_loadaddr = LOADADDR(.tdata);

 /* throw away exception frames */
 /DISCARD/ : { *(.eh_frame) }
 . = ALIGN(4);
 end = .;
}

/* Setup stack to the top of ram */
PROVIDE(_stack = ORIGIN(ram) + LENGTH(ram));
