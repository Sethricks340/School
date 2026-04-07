#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// Operation A: The least significant byte of x, with all other bits set to 1 [0xFFFFFFBA].
int operationA(int x){

    // Individual steps:
    // x = (x & 0xFF);     // Bitmask for LSB
    // int y = 0x00;       // 0x00000000
    // y = ~y;             // 0xFFFFFFFF
    // y = (y >> 8) << 8;  // Remove LSB: 0xFFFFFF00
    // x = (x + y);
    // return x;

    return ((~0x00 >> 8) << 8) + (x & 0xFF); // Can remove temp variable
}

// Operation B: The complement of the least significant byte of x, with all other bytes left unchanged [0x98FDEC45]
int operationB(int x){

    // Individual steps:
    // int y = x;          // Copy x
    // y = ~y;             // Invert the LSB
    // y = (y & 0xFF);     // Bitmask for only LSB
    // x = (x >> 8) << 8;  // Remove LSB off original
    // x = x + y;          // Add inverted LSB and original with LSB removed
    // return x;

    return (((x >> 8) << 8) + (~x & 0xFF)); // No need for a temp variable anymore, done in operation
}

// Operation C: All but the least significant byte of x, with the least significant byte set to 0[0x98FDEC00].
int operationC(int x){
    // Shift right two bytes, then shift back left two bytes. Fills least significant byte with 0x00.
    return ((x >> 8) << 8);
}

void main(){
    
    int x = 0x98FDECBA;

    printf("Original x: %x\n", x);
    printf("Operation A: %x\n", operationA(x));
    printf("Operation B: %x\n", operationB(x));
    printf("Operation C: %x\n", operationC(x));
    
}