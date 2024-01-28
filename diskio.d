/*-----------------------------------------------------------------------
/  PFF - Low level disk interface modlue include file    (C)ChaN, 2014
/-----------------------------------------------------------------------*/

/* Status of Disk Functions */
alias DSTATUS = ubyte;

/* Results of Disk Functions */
enum DRESULT
{
    RES_OK = 0, /* 0: Function succeeded */
    RES_ERROR = 1, /* 1: Disk error */
    RES_NOTRDY = 2, /* 2: Not ready */
    RES_PARERR = 3 /* 3: Invalid parameter */
}

alias RES_OK = DRESULT.RES_OK;
alias RES_ERROR = DRESULT.RES_ERROR;
alias RES_NOTRDY = DRESULT.RES_NOTRDY;
alias RES_PARERR = DRESULT.RES_PARERR;

/*---------------------------------------*/
/* Prototypes for disk control functions */


enum STA_NOINIT = 0x01; /* Drive not initialized */
enum STA_NODISK = 0x02; /* No medium in the drive */

/* _DISKIO_DEFINED */
