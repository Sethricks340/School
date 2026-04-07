#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

void main(){
    uint8_t x = 0x66;
    uint8_t y = 0x93;

    printf("x = 0x%x\n", x);
    printf("y = 0x%x\n", y);
    printf("\n");
    
    printf("~x = 0x%x\n", ~x);
    printf("~y = 0x%x\n", ~y);
    printf("\n");

    printf("x & y = 0x%x\n", x & y);
    printf("x && y = 0x%x\n", x && y);
    printf("\n");

    printf("x | y = 0x%x\n", x | y);
    printf("x || y = 0x%x\n", x || y);
    printf("\n");

    printf("~x | ~y = 0x%x\n", ~x | ~y);
    printf("!x || !y = 0x%x\n", !x || !y);
    printf("\n");

    printf("x & !y = 0x%x\n", x & !y);
    printf("x && ~y = 0x%x\n", x && ~y);


}