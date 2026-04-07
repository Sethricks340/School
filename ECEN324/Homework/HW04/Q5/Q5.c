#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/* WARNING: This is buggy code */
float sum_elements (float a [], unsigned length)
{
    int i;
    float result = 0; 

    for (i = 0; i <= length-1; i++)
        result += a [i];
    return result;
}

void main(){
    float a[3] = {0.1, 1, 2.2};
    printf("sum_elements(a, 3): %f\n", sum_elements(a, 3));
    float b[2] = {0, 9.9};
    printf("sum_elements(b, 2): %f\n", sum_elements(b, 2));
    printf("sum_elements(0, 0): %f\n", sum_elements(b, 0));
}
