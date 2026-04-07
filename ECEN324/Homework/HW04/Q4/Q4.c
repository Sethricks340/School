#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int fun1 (unsigned word){
    return (int) ((word << 24) >> 24);
}

int fun2 (unsigned word){
    return ((int) word << 24) >> 24;
}

void main(){
    int w = fun1(0x7f);
    printf("fun1(0x7f): %d, %x\n", w, w);
    w = fun1(0x80);
    printf("fun1(0x80): %d, %x\n", w, w);
    w = fun1(0xff);
    printf("fun1(0xff): %d, %x\n", w, w);
    w = fun1(0x100);
    printf("fun1(0x100): %d, %x\n", w, w);

    printf("\n");
    w = fun2(0x7f);
    printf("fun2(0x7f): %d, %x\n", w, w);
    w = fun2(0x80);
    printf("fun2(0x80): %d, %x\n", w, w);
    w = fun2(0xff);
    printf("fun2(0xff): %d, %x\n", w, w);
    w = fun2(0x100);
    printf("fun2(0x100): %d, %x\n", w, w);
}
