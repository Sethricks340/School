#include <stdio.h>

// 6 inputs: values stored starting at address 0x7fffffffd7e0
// int inputs[6] = {7,2,3,4,5,6}; // will blow because first input > 6
int inputs[6] = {1,2,3,4,5,6}; 

int* r12;
int* r14;
int r13;
int* rbp;
int* rbx;
int esi;
int rsi = 0;
int ecx;
int eax;
int edx;
int* rdx;
int *rsp;
int* rax;
int ebp = 0; //?

void phase_6_80(){
    rbp = r12;
    int eax = *r12;
    eax = eax - 1;

    if (eax > 5){ //ja, not jg, might trip up if negative
        printf("BOOM! (First input was greater than 6)");
    }

    if (r12 == r14){ // why comparing pointers? (not values)
        phase_6_105(); // jump to phase_6_105
    }
    rbx = r13;
    phase_6_61(); // jump to phase_6_61
}

void phase_6_105(){
    esi = 0;

    // mov    0x30(%rsp,%rsi,4),%ecx  
    ecx = inputs[rsi]; // each number = 4 bytes long

    eax = 1;
    edx = 0x6042f0;
    ecx = 1;

    if (ecx <= 1){
        phase_6_140();
    }
    rdx = *(rdx + 8);
    eax += 1;

    if (eax != ecx){
        phase_6_129();
    }
    
// 0x401183 <phase_6+140>  mov    %rdx,(%rsp,%rsi,8)   ??

    rsi += 1;

    if (rsi != 6){
        phase_6_110();
    }

    // 0x401191 <phase_6+154>  mov    (%rsp),%rbx                                                                                                           
    // 0x401195 <phase_6+158>  mov    0x8(%rsp),%rax                                                                                                         
    // 0x40119a <phase_6+163>  mov    %rax,0x8(%rbx)                                                                                                         
    // 0x40119e <phase_6+167>  mov    0x10(%rsp),%rdx                                                                                                        
    // 0x4011a3 <phase_6+172>  mov    %rdx,0x8(%rax)                                                                                                         
    // 0x4011a7 <phase_6+176>  mov    0x18(%rsp),%rax                                                                                                        
    // 0x4011ac <phase_6+181>  mov    %rax,0x8(%rdx)   
    // 0x4011b0 <phase_6+185>  mov    0x20(%rsp),%rdx                                                                                                        
    // 0x4011b5 <phase_6+190>  mov    %rdx,0x8(%rax)                                                                                                         
    // 0x4011b9 <phase_6+194>  mov    0x28(%rsp),%rax                                                                                                        
    // 0x4011be <phase_6+199>  mov    %rax,0x8(%rdx)                                                                                                         
    // 0x4011c2 <phase_6+203>  movq   $0x0,0x8(%rax)                                                                                                         
    // 0x4011ca <phase_6+211>  mov    $0x5,%ebp  

    phase_6_227();
}

void phase_6_227(){
    rax = rbx + 8;
    eax = *rax;
    if (*rbx >= eax){
        phase_6_218();
    }
    else{
        printf("BOOM!");
    }
}

void phase_6_218(){
    rbx = *rbx + 8;
    ebp -= 1;
    if (ebp == 1){
        phase_6_244();
    }
}

void phase_6_244(){
    print("success!");
}

void phase_6_129(){

}

void phase_6_110(){

}

void phase_6_140(){

}

void phase_6_61(){
    eax = inputs[5];
    if (*rbp != eax){
        phase_6_52();
    }
    phase_6_47();
}

void phase_6_52(){
    rbx += 1;
    if (rbx > 5){
        phase_6_72();
    }
    eax = inputs[5];
    if (*rbp != eax){
        phase_6_52();
    }
    phase_6_47();
}
void phase_6_47(){
    printf("BOOM!");
}

int main(){
    // in read six numbers
    rdx = &inputs[5];

    // Store address of first input in r12
    // lea 0x30(%rsp),%r12  (%rsp + 0x30) = start of inputs
    r12 = &inputs[0];
    // Store address of last input in r14
    r14 = &inputs[5];
    // Store constant 1 in r13
    r13 = 1;

    phase_6_80(); // jump to <phase_6+80>

    return 0;
}