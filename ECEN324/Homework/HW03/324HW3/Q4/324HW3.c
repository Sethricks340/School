#include <stdio.h>
#include <stdlib.h>

void main(){
    int a = 0b11010011;
    int b = 0b01101010;

    int not_a = 0b00101100;
    int not_b = 0b10010101;

    int a_and_b = 0b01000010;
    int a_or_b = 0b11111011;
    int a_xor_b = 0b10111001;

    if (not_a == (~a & 0xFF)){
        printf("~a is correct\n");
    }
    else{
        printf("~a is NOT correct\n");
    }

    if (not_b == (~b & 0xFF)){
        printf("~b is correct\n");
    }
    else{
        printf("~b is NOT correct\n");
    }

    if (a_and_b == (a&b)){
        printf("a&b is correct\n");
    }
    else{
        printf("a&b is NOT correct\n");
    }

    if (a_or_b == (a|b)){
        printf("a|b is correct\n");
    }
    else{
        printf("a|b is NOT correct\n");
    }

    if (a_xor_b == (a^b)){
        printf("a^b is correct\n");
    }
    else{
        printf("a^b is NOT correct\n");
    }

}