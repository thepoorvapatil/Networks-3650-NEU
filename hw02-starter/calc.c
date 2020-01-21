#include<stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
    if(argc != 4 || (strncmp(argv[2], "+", 8)!=0 && strncmp(argv[2], "-", 8)!=0 && strncmp(argv[2], "*", 8)!=0 && strncmp(argv[2], "/", 8)!=0 ) ){
        puts("Usage:\n./ccalc N op N");
        return 1;
    }

    int xx = atoi(argv[1]);
    int yy = atoi(argv[3]);
    char * fmt = "%d %s %d = %d\n";

    if(!strncmp(argv[2], "+", 8))
        printf(fmt, xx, argv[2], yy, xx + yy);

    if(!strncmp(argv[2], "-", 8))
        printf(fmt, xx, argv[2], yy, xx - yy);
    
    if(!strncmp(argv[2], "*", 8))
        printf(fmt, xx, argv[2], y, xx * yy);
    
    if(!strncmp(argv[2], "/", 8))
        printf(fmt, xx, argv[2], yy, xx / yy);

    return 0;
}