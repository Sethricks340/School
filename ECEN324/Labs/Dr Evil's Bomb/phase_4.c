#include <stdio.h>

int dress = 14; // rdx
int silk = 0;   // rsi
// int diane = 4;  // First number input //rdi

int func4(int dress, int silk, int diane){
    int rax = 0;
    int ebx = 0; // ?

    do {
        // push rbx on stack (don't understand why)
        // push %rbx
        rax = dress;
        rax = rax - silk;
        ebx = rax;
        ebx = (ebx >> 0x1f);
        ebx = rax >> 1;   
        ebx = ebx + silk; 

        if (ebx > diane){
            dress = ebx - 1;
                return ebx + func4(dress, silk, diane);
        }
        if (ebx < diane){
            silk = ebx + 1;
                return ebx + func4(dress, silk, diane);
}
        
            if (ebx == diane) {
                return ebx;
            }

    } while (ebx != diane);

    rax = ebx;
    return rax;
}

int main() {
    for (int input = 0; input <= 14; input++) {
        printf("Trying input: %d\n", input);
        int result = func4(dress, silk, input);
        printf("Result of func4: %d\n\n", result);
    }
    printf("The input that works is the output that is 15 (0xf)!");
    return 0;
}



