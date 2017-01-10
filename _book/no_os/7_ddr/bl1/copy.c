/*************************************************************************
	> File Name: copy.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月07日 星期六 11时57分50秒
 ************************************************************************/

#include "common.h"

#define     V210_SDMMC_BASE         *((volatile unsigned int *)0xD0037488)
typedef u8(*copy_sdmmc_to_mem)(u32 chn, u32 start_block, u16 blk_size, u32 *trg, u32 init);

/*
 * copy dat to sdmmc
 * param start block
 * param num of block
 * param target addr
 * return none
 */
void copy_dat_to_sd(u32 start_block, u32 block_size, u32 target_addr)
{
    u32 i = V210_SDMMC_BASE;
    u8 ch;
    copy_sdmmc_to_mem copybl2 = (copy_sdmmc_to_mem)(*(u32 *)0xD0037F98);

    if (i == 0xEB000000) {
        ch = 0;
    } else if (i == 0xEB200000) {
        ch = 2;
    }

    copybl2(ch, start_block, block_size, (u32 *)target_addr, 0);
}
