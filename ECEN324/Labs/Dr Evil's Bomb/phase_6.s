// Requirements thus far:
// First number must be from 1-6

// If the first and last are equal, go do something
// If not, do something else




// Save calle-saved regs, make room on stack
0x4010f7 <phase_6>      push   %r14                                                                                                                   
0x4010f9 <phase_6+2>    push   %r13                                                                                                                   
0x4010fb <phase_6+4>    push   %r12                                                                                                                   
0x4010fd <phase_6+6>    push   %rbp                                                                                                                   
0x4010fe <phase_6+7>    push   %rbx                                                                                                                   
0x4010ff <phase_6+8>    sub    $0x50,%rsp     

0x401103 <phase_6+12>   lea    0x30(%rsp),%rsi                                                                                                        
0x401108 <phase_6+17>   callq  0x401575 <read_six_numbers>   




        // read six numbers procedure
        0x401575 <read_six_numbers>     sub    $0x8,%rsp   // stack frame                                                                                                      
        0x401579 <read_six_numbers+4>   mov    %rsi,%rdx   //    rdx            0x7fffffffd7e0      140737488345056                                                                                                      
        0x40157c <read_six_numbers+7>   lea    0x4(%rsi),%rcx   // │rcx            0x7fffffffd7e4      140737488345060                                                                                                         
        0x401580 <read_six_numbers+11>  lea    0x14(%rsi),%rax     // │rax            0x7fffffffd7f4      140737488345076                                                                                                   
        0x401584 <read_six_numbers+15>  push   %rax        // push rax on stack                                                                                                      
        0x401585 <read_six_numbers+16>  lea    0x10(%rsi),%rax    //     │rax            0x7fffffffd7f0      140737488345072                                                                                              
        0x401589 <read_six_numbers+20>  push   %rax           // push rax on stack                                                                                                   
        0x40158a <read_six_numbers+21>  lea    0xc(%rsi),%r9   //  r9             0x7fffffffd7ec      140737488345068                                                                                                      
        0x40158e <read_six_numbers+25>  lea    0x8(%rsi),%r8         // │r8             0x7fffffffd7e8      140737488345064                                                                                                   
        0x401592 <read_six_numbers+29>  mov    $0x402719,%esi    // │rsi            0x402719            4204313                                                                                                   
        0x401597 <read_six_numbers+34>  mov    $0x0,%eax       // rax            0x0                 0                                                                                                       
        0x40159c <read_six_numbers+39>  callq  0x400c30 <__isoc99_sscanf@plt>    
        0x4015a1 <read_six_numbers+44>  add    $0x10,%rsp                                                                                                        
        0x4015a5 <read_six_numbers+48>  cmp    $0x5,%eax                                                                                                         
        0x4015a8 <read_six_numbers+51>  jle    0x4015af <read_six_numbers+58>      // input must be greater than 5, or explode                                                                              
        0x4015aa <read_six_numbers+53>  add    $0x8,%rsp                                                                                                         
        0x4015ae <read_six_numbers+57>  retq                                                                                                                     
        0x4015af <read_six_numbers+58>  callq  0x40153f <explode_bomb>  


                // values stored starting at address 0x7fffffffd7e0
                (gdb) x/6dw 0x7fffffffd7e0
                0x7fffffffd7e0: 1       2       3       4
                0x7fffffffd7f0: 5       6
                (gdb)


0x40110d <phase_6+22>   lea    0x30(%rsp),%r12    // │r12            0x7fffffffd7e0      140737488345056                                                                                                       
0x401112 <phase_6+27>   lea    0x14(%r12),%r14   // │r14            0x7fffffffd7f4      140737488345076                                                                                                         
0x401117 <phase_6+32>   mov    $0x1,%r13d                  //  r13            0x1                 1                                                                                               

0x40111d <phase_6+38>   jmp    0x401147 <phase_6+80>   
0x40111f <phase_6+40>   callq  0x40153f <explode_bomb>                                                                                                
0x401124 <phase_6+45>   jmp    0x401156 <phase_6+95>                                                                                                  
0x401126 <phase_6+47>   callq  0x40153f <explode_bomb>                                                                                                
0x40112b <phase_6+52>   add    $0x1,%rbx        // rbx = 2 (not an input)                                                                                                      
0x40112f <phase_6+56>   cmp    $0x5,%ebx        // ebx = 2 (don't know where from?)  -> loop with section below, compare first input to rest. explode if 1st is equal to any

0x401132 <phase_6+59>   jg     0x40113f <phase_6+72>                                                                                                  
0x401134 <phase_6+61>   mov    0x30(%rsp,%rbx,4),%eax     //move second value into eax                                                                                 
0x401138 <phase_6+65>   cmp    %eax,0x0(%rbp)          // compare first input (rbp) and second input    
0x40113b <phase_6+68>   jne    0x40112b <phase_6+52>  
0x40113d <phase_6+70>   jmp    0x401126 <phase_6+47>   // explode bomb if first input == second input
0x40113f <phase_6+72>   add    $0x1,%r13                                                                                                              
0x401143 <phase_6+76>   add    $0x4,%r12     


0x401147 <phase_6+80>   mov    %r12,%rbp    // ││rbp            0x7fffffffd7e0      0x7fffffffd7e0                                                                                                              
0x40114a <phase_6+83>   mov    (%r12),%eax      //   │rax            0x1                 1   (my input was 1 2 3 4 5 6)                                                                                                    
0x40114e <phase_6+87>   sub    $0x1,%eax      // subtract 1 from first number                                                                                                        
0x401151 <phase_6+90>   cmp    $0x5,%eax           // is it greater than 5?                                                                                                   
0x401154 <phase_6+93>   ja     0x40111f <phase_6+40>  // explode bomb if first number greater than 6                                                                                                
0x401156 <phase_6+95>   cmp    %r14,%r12  // r14-> last input,    r12 -> first input
0x401159 <phase_6+98>   je     0x401160 <phase_6+105>       // jump if last input == first input   (not in this case)                                                                                       
0x40115b <phase_6+100>  mov    %r13,%rbx           //  rbx            0x1                 1     (r13 was 1 from phase_6+32)                                                                                                   
0x40115e <phase_6+103>  jmp    0x401134 <phase_6+61>   // jump                                                                                               
0x401160 <phase_6+105>  mov    $0x0,%esi                                                                                                              
0x401165 <phase_6+110>  mov    0x30(%rsp,%rsi,4),%ecx                                                                                                 
0x401169 <phase_6+114>  mov    $0x1,%eax                                                                                                              
0x40116e <phase_6+119>  mov    $0x6042f0,%edx   


// That's a weird literal, I wonder what is there...

; (gdb) x /24w 0x6042f0
; 0x6042f0 <node1>:       979     1       6308608 0
; 0x604300 <node2>:       281     2       6308624 0
; 0x604310 <node3>:       766     3       6308640 0
; 0x604320 <node4>:       920     4       6308656 0
; 0x604330 <node5>:       318     5       6308672 0
; 0x604340 <node6>:       757     6       0       0

// That kinda looks like linked structs, not sure though.

; (gdb) x /24w 0x6042f0
; 0x6042f0 <node1>:       979     1       6308608 0
; 0x604320 <node4>:       920     4       6308656 0
; 0x604310 <node3>:       766     3       6308640 0
; 0x604340 <node6>:       757     6       0       0
; 0x604330 <node5>:       318     5       6308672 0
; 0x604300 <node2>:       281     2       6308624 0

; 1 4 3 6 5 2     <- here is the answer, it wanted the order of the linked list in descending order
; This could definitely use a review, I think I got lucky. 

; 0x4011e2


0x401173 <phase_6+124>  cmp    $0x1,%ecx                                                                                                              
0x401176 <phase_6+127>  jle    0x401183 <phase_6+140>                                                                                                 
0x401178 <phase_6+129>  mov    0x8(%rdx),%rdx                                                                                                         
0x40117c <phase_6+133>  add    $0x1,%eax                                                                                                              
0x40117f <phase_6+136>  cmp    %ecx,%eax  
0x401181 <phase_6+138>  jne    0x401178 <phase_6+129>                                                                                                 
0x401183 <phase_6+140>  mov    %rdx,(%rsp,%rsi,8)                                                                                                     
0x401187 <phase_6+144>  add    $0x1,%rsi                                                                                                              
0x40118b <phase_6+148>  cmp    $0x6,%rsi                                                                                                              
0x40118f <phase_6+152>  jne    0x401165 <phase_6+110>                                                                                                 
0x401191 <phase_6+154>  mov    (%rsp),%rbx                                                                                                            
0x401195 <phase_6+158>  mov    0x8(%rsp),%rax                                                                                                         
0x40119a <phase_6+163>  mov    %rax,0x8(%rbx)                                                                                                         
0x40119e <phase_6+167>  mov    0x10(%rsp),%rdx                                                                                                        
0x4011a3 <phase_6+172>  mov    %rdx,0x8(%rax)                                                                                                         
0x4011a7 <phase_6+176>  mov    0x18(%rsp),%rax                                                                                                        
0x4011ac <phase_6+181>  mov    %rax,0x8(%rdx)   
0x4011b0 <phase_6+185>  mov    0x20(%rsp),%rdx                                                                                                        
0x4011b5 <phase_6+190>  mov    %rdx,0x8(%rax)                                                                                                         
0x4011b9 <phase_6+194>  mov    0x28(%rsp),%rax                                                                                                        
0x4011be <phase_6+199>  mov    %rax,0x8(%rdx)                                                                                                         
0x4011c2 <phase_6+203>  movq   $0x0,0x8(%rax)                                                                                                         
0x4011ca <phase_6+211>  mov    $0x5,%ebp                                                                                                              
0x4011cf <phase_6+216>  jmp    0x4011da <phase_6+227>                                                                                                 
0x4011d1 <phase_6+218>  mov    0x8(%rbx),%rbx                                                                                                         
0x4011d5 <phase_6+222>  sub    $0x1,%ebp                                                                                                              
0x4011d8 <phase_6+225>  je     0x4011eb <phase_6+244>                                                                                                 
0x4011da <phase_6+227>  mov    0x8(%rbx),%rax                                                                                                         
0x4011de <phase_6+231>  mov    (%rax),%eax 
0x4011e0 <phase_6+233>  cmp    %eax,(%rbx)                                                                                                            
0x4011e2 <phase_6+235>  jge    0x4011d1 <phase_6+218>                                                                                                 
0x4011e4 <phase_6+237>  callq  0x40153f <explode_bomb>                                                                                                
0x4011e9 <phase_6+242>  jmp    0x4011d1 <phase_6+218>                                                                                                 
0x4011eb <phase_6+244>  add    $0x50,%rsp                                                                                                             
0x4011ef <phase_6+248>  pop    %rbx                                                                                                                   
0x4011f0 <phase_6+249>  pop    %rbp                                                                                                                   
0x4011f1 <phase_6+250>  pop    %r12                                                                                                                   
0x4011f3 <phase_6+252>  pop    %r13                                                                                                                   
0x4011f5 <phase_6+254>  pop    %r14                                                                                                                   
0x4011f7 <phase_6+256>  retq   












