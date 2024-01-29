/*---------------------------------------------------------------------------/
/  Petit FatFs - FAT file system module include file  R0.03a
/----------------------------------------------------------------------------/
/ Petit FatFs module is an open source software to implement FAT file system to
/ small embedded systems. This is a free software and is opened for education,
/ research and commercial developments under license policy of following trems.
/
/  Copyright (C) 2019, ChaN, all right reserved.
/
/ * The Petit FatFs module is a free software and there is NO WARRANTY.
/ * No restriction on use. You can use, modify and redistribute it for
/   personal, non-profit or commercial use UNDER YOUR RESPONSIBILITY.
/ * Redistributions of source code must retain the above copyright notice.
/
/----------------------------------------------------------------------------*/

enum PF_DEFINED = 8088; /* Revision ID */

/* Integer types used for FatFs API */

/* Main development platform */ /* C99 or later */


enum PF_INTDEF = 1;

alias CLUST = ushort;

/* File system object structure */

extern (C) {

struct FATFS
{
// align (1):
    ubyte fs_type; /* FAT sub type */
    ubyte flag; /* File status flags */
    ubyte csize; /* Number of sectors per cluster */
    ubyte pad1;
    ushort n_rootdir; /* Number of root directory entries (0 on FAT32) */
    ushort n_fatent; /* Number of FAT entries (= number of clusters + 2) */
    uint fatbase; /* FAT start sector */
    uint dirbase; /* Root directory start sector (Cluster# on FAT32) */
    uint database; /* Data start sector */
    uint fptr; /* File R/W pointer */
    uint fsize; /* File size */
    ushort org_clust; /* File start cluster */
    ushort curr_clust; /* File current cluster */
    uint dsect; /* File current data sector */
}

/* Directory object structure */

struct DIR
{
//align (1):
    ushort index; /* Current read/write index number */
    ubyte* fn; /* Pointer to the SFN (in/out) {file[8],ext[3],status[1]} */
    ushort sclust; /* Table start cluster (0:Static table) */
    ushort clust; /* Current cluster */
    uint sect; /* Current sector */
}

/* File status structure */

struct FILINFO
{
// align (1):
    uint fsize; /* File size */
    ushort fdate; /* Last modified date */
    ushort ftime; /* Last modified time */
    ubyte fattrib; /* Attribute */
    char[13] fname; /* File name */
}

}

/* File function return code (FRESULT) */

enum FRESULT
{
    FR_OK = 0, /* 0 */
    FR_DISK_ERR = 1, /* 1 */
    FR_NOT_READY = 2, /* 2 */
    FR_NO_FILE = 3, /* 3 */
    FR_NOT_OPENED = 4, /* 4 */
    FR_NOT_ENABLED = 5, /* 5 */
    FR_NO_FILESYSTEM = 6 /* 6 */
}

alias FR_OK = FRESULT.FR_OK;
alias FR_DISK_ERR = FRESULT.FR_DISK_ERR;
alias FR_NOT_READY = FRESULT.FR_NOT_READY;
alias FR_NO_FILE = FRESULT.FR_NO_FILE;
alias FR_NOT_OPENED = FRESULT.FR_NOT_OPENED;
alias FR_NOT_ENABLED = FRESULT.FR_NOT_ENABLED;
alias FR_NO_FILESYSTEM = FRESULT.FR_NO_FILESYSTEM;

/*--------------------------------------------------------------*/
/* Petit FatFs module application interface                     */


extern (C) {
    FRESULT pf_mount (FATFS* fs); /* Mount/Unmount a logical drive */
    FRESULT pf_open (const(char)* path); /* Open a file */
    FRESULT pf_read (void* buff, uint btr, uint* br); /* Read data from the open file */
    FRESULT pf_write (const(void)* buff, uint btw, uint* bw); /* Write data to the open file */
    FRESULT pf_lseek (uint ofs); /* Move file pointer of the open file */
    FRESULT pf_opendir (DIR* dj, const(char)* path); /* Open a directory */
    FRESULT pf_readdir (DIR* dj, FILINFO* fno); /* Read a directory item from the open directory */
}
/*--------------------------------------------------------------*/
/* Flags and offset address                                     */

/* File status flag (FATFS.flag) */
enum FA_OPENED = 0x01;
enum FA_WPRT = 0x02;
enum FA__WIP = 0x40;

/* FAT sub type (FATFS.fs_type) */
enum FS_FAT12 = 1;
enum FS_FAT16 = 2;
enum FS_FAT32 = 3;

/* File attribute bits for directory entry */

enum AM_RDO = 0x01; /* Read only */
enum AM_HID = 0x02; /* Hidden */
enum AM_SYS = 0x04; /* System */
enum AM_VOL = 0x08; /* Volume label */
enum AM_LFN = 0x0F; /* LFN entry */
enum AM_DIR = 0x10; /* Directory */
enum AM_ARC = 0x20; /* Archive */
enum AM_MASK = 0x3F; /* Mask of defined bits */

/* _PFATFS */
