/*************************************************************************
	> File Name: s5pv210_addhead_in_bl1.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月04日 星期三 12时24分28秒
 ************************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define IMG_SIZE        16*1024
#define HEAD_SIZE       16

int main(int argc, char *argv[])
{
    unsigned char *chFileBuffer;
    FILE *fp;
    int bufferLen;
    int nByte, fileLen;
    unsigned int CheckSum, Count;
    int i;

    /*
     * check arg num is 3?
     */
    if (argc !=3) {
        printf("Usage: %s <source file> <distination file>\n", argv[0]);
        return -1;
    }
    
    chFileBuffer = calloc(1, IMG_SIZE);
    if (NULL == chFileBuffer) {
        perror("chFileBuffer calloc fail! \n");
        return -1;
    } 

    fp = fopen(argv[1], "rb");
    if (NULL == fp) {
        perror("open source file fail!\n");
        free(chFileBuffer);
        return -1;
    }
        
    fseek(fp, 0L, SEEK_END);
    fileLen = ftell(fp);
    fseek(fp, 0L, SEEK_SET);
    printf("%d byte of %s!\n", fileLen, argv[1]);
    if (fileLen > (IMG_SIZE - HEAD_SIZE)) {
        fprintf(stderr, "Source file is too big(>16Kbyte)!\n");
        free(chFileBuffer);
        fclose(fp);
    }
    
    i = 0;
    CheckSum = 0;
    while(fread((chFileBuffer + HEAD_SIZE + i), 1, 1, fp)) {
        CheckSum += chFileBuffer[HEAD_SIZE + i++];
    }
    printf("CheckSum is %x for %s!\n", CheckSum, argv[1]);
    fclose(fp);

    fileLen += HEAD_SIZE;
    memcpy(chFileBuffer, &fileLen, 4);
    memcpy(chFileBuffer + 8, &CheckSum, 4);

    fp = fopen(argv[2], "wb");
    if (NULL == fp) {
        perror("open distination file error!\n");
        free(chFileBuffer);
        return -1;
    }

    nByte = fwrite(chFileBuffer, 1, fileLen, fp);
    if (nByte != fileLen) {
        perror("distination file write error!\n");
        free(chFileBuffer);
        fclose(fp);
        return -1;
    }
    printf("write %d byte in %s!\n", nByte, argv[2]);
    free(chFileBuffer);
    fclose(fp);
    printf("write successful!\n");
    return 0;
}
