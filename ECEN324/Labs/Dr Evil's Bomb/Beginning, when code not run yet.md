**Beginning, when code not run yet:**





0x400db6 <main>        push   %rbx

0x400db7 <main+1>      cmp    $0x1,%edi

0x400dba <main+4>      je     0x400ea8 <main+242>

0x400dc0 <main+10>     mov    %rsi,%rbx

0x400dc3 <main+13>     cmp    $0x2,%edi

0x400dc6 <main+16>     jne    0x400ed6 <main+288>

0x400dcc <main+22>     mov    0x8(%rsi),%rdi

0x400dd0 <main+26>     mov    $0x402310,%esi

0x400dd5 <main+31>     callq  0x400c50 <fopen@plt>

0x400dda <main+36>     mov    %rax,0x2039cf(%rip)        # 0x6047b0 <infile>

0x400de1 <main+43>     test   %rax,%rax

0x400de4 <main+46>     je     0x400ebc <main+261>

0x400dea <main+52>     callq  0x401380 <initialize\_bomb>

0x400def <main+57>     mov    $0x402398,%edi

0x400df4 <main+62>     callq  0x400b70 <puts@plt>

0x400df9 <main+67>     mov    $0x4023d8,%edi

0x400dfe <main+72>     callq  0x400b70 <puts@plt>

0x400e03 <main+77>     callq  0x4015b4 <read\_line>

0x400e08 <main+82>     mov    %rax,%rdi

0x400e0b <main+85>     callq  0x400ef2 <phase\_1>

0x400e10 <main+90>     callq  0x4016e2 <phase\_defused>

0x400e15 <main+95>     mov    $0x402408,%edi

0x400e1a <main+100>    callq  0x400b70 <puts@plt>

0x400e1f <main+105>    callq  0x4015b4 <read\_line>

0x400e24 <main+110>    mov    %rax,%rdi

0x400e27 <main+113>    callq  0x400f10 <phase\_2>

0x400e2c <main+118>    callq  0x4016e2 <phase\_defused>

0x400e31 <main+123>    mov    $0x402349,%edi

0x400e36 <main+128>    callq  0x400b70 <puts@plt>

0x400e3b <main+133>    callq  0x4015b4 <read\_line>

0x400e40 <main+138>    mov    %rax,%rdi

0x400e43 <main+141>    callq  0x400f54 <phase\_3>

0x400e48 <main+146>    callq  0x4016e2 <phase\_defused>

0x400e4d <main+151>    mov    $0x402367,%edi

0x400e52 <main+156>    callq  0x400b70 <puts@plt>









**phase 1:**





0x400ef2 <phase\_1>     sub    $0x8,%rsp

0x400ef6 <phase\_1+4>   mov    $0x402460,%esi

0x400efb <phase\_1+9>   callq  0x401318 <strings\_not\_equal>

0x400f00 <phase\_1+14>  test   %eax,%eax

0x400f02 <phase\_1+16>  jne    0x400f09 <phase\_1+23>

0x400f04 <phase\_1+18>  add    $0x8,%rsp

0x400f08 <phase\_1+22>  retq

0x400f09 <phase\_1+23>  callq  0x40153f <explode\_bomb>

0x400f0e <phase\_1+28>  jmp    0x400f04 <phase\_1+18>


**phase 2:**


0x400f10 <phase\_2>     push   %rbp

0x400f11 <phase\_2+1>   push   %rbx

0x400f12 <phase\_2+2>   sub    $0x28,%rsp

0x400f16 <phase\_2+6>   mov    %rsp,%rsi

0x400f19 <phase\_2+9>   callq  0x401575 <read\_six\_numbers>

0x400f1e <phase\_2+14>  cmpl   $0x1,(%rsp)

0x400f22 <phase\_2+18>  jne    0x400f2d <phase\_2+29>

0x400f24 <phase\_2+20>  mov    %rsp,%rbx

0x400f27 <phase\_2+23>  lea    0x14(%rbx),%rbp

0x400f2b <phase\_2+27>  jmp    0x400f42 <phase\_2+50>

0x400f2d <phase\_2+29>  callq  0x40153f <explode\_bomb>

0x400f32 <phase\_2+34>  jmp    0x400f24 <phase\_2+20>

0x400f34 <phase\_2+36>  callq  0x40153f <explode\_bomb>

0x400f39 <phase\_2+41>  add    $0x4,%rbx

0x400f3d <phase\_2+45>  cmp    %rbp,%rbx

0x400f40 <phase\_2+48>  je     0x400f4d <phase\_2+61>

0x400f42 <phase\_2+50>  mov    (%rbx),%eax

0x400f44 <phase\_2+52>  add    %eax,%eax

0x400f46 <phase\_2+54>  cmp    %eax,0x4(%rbx)

0x400f49 <phase\_2+57>  je     0x400f39 <phase\_2+41>

0x400f4b <phase\_2+59>  jmp    0x400f34 <phase\_2+36>

0x400f4d <phase\_2+61>  add    $0x28,%rsp

0x400f51 <phase\_2+65>  pop    %rbx

0x400f52 <phase\_2+66>  pop    %rbp

0x400f53 <phase\_2+67>  retq


**read 6 numbers**

0x401575 <read_six_numbers>      sub    $0x8,%rsp
0x401579 <read_six_numbers+4>    mov    %rsi,%rdx
0x40157c <read_six_numbers+7>    lea    0x4(%rsi),%rcx
0x401580 <read_six_numbers+11>   lea    0x14(%rsi),%rax
0x401584 <read_six_numbers+15>   push   %rax
0x401585 <read_six_numbers+16>   lea    0x10(%rsi),%rax
0x401589 <read_six_numbers+20>   push   %rax
0x40158a <read_six_numbers+21>   lea    0xc(%rsi),%r9
0x40158e <read_six_numbers+25>   lea    0x8(%rsi),%r8
0x401592 <read_six_numbers+29>   mov    $0x402719,%esi
0x401597 <read_six_numbers+34>   mov    $0x0,%eax
0x40159c <read_six_numbers+39>   callq  0x400c30 <__isoc99_sscanf@plt>
0x4015a1 <read_six_numbers+44>   add    $0x10,%rsp
0x4015a5 <read_six_numbers+48>   cmp    $0x5,%eax
0x4015a8 <read_six_numbers+51>   jle    0x4015af <read_six_numbers+58>
0x4015aa <read_six_numbers+53>   add    $0x8,%rsp
0x4015ae <read_six_numbers+57>   retq
0x4015af <read_six_numbers+58>   callq  0x40153f <explode_bomb>



│0x40100f <func4>        push   %rbx                                                                                                                      │
   │0x401010 <func4+1>      mov    %edx,%eax                                                                                                                 │
   │0x401012 <func4+3>      sub    %esi,%eax                                                                                                                 │
   │0x401014 <func4+5>      mov    %eax,%ebx                                                                                                                 │
   │0x401016 <func4+7>      shr    $0x1f,%ebx                                                                                                                │
   │0x401019 <func4+10>     add    %eax,%ebx                                                                                                                 │
   │0x40101b <func4+12>     sar    %ebx                                                                                                                      │
   │0x40101d <func4+14>     add    %esi,%ebx                                                                                                                 │
   │0x40101f <func4+16>     cmp    %edi,%ebx                                                                                                                 │
   │0x401021 <func4+18>     jg     0x401029 <func4+26>                                                                                                       │
   │0x401023 <func4+20>     jl     0x401035 <func4+38>                                                                                                       │
   │0x401025 <func4+22>     mov    %ebx,%eax                                                                                                                 │
   │0x401027 <func4+24>     pop    %rbx                                                                                                                      │
   │0x401028 <func4+25>     retq                                                                                                                             │
   │0x401029 <func4+26>     lea    -0x1(%rbx),%edx                                                                                                           │
   │0x40102c <func4+29>     callq  0x40100f <func4>                                                                                                          │
   │0x401031 <func4+34>     add    %eax,%ebx                                                                                                                 │
   │0x401033 <func4+36>     jmp    0x401025 <func4+22>                                                                                                       │
   │0x401035 <func4+38>     lea    0x1(%rbx),%esi                                                                                                            │
   │0x401038 <func4+41>     callq  0x40100f <func4>                                                                                                          │
   │0x40103d <func4+46>     add    %eax,%ebx                                                                                                                 │
   │0x40103f <func4+48>     jmp    0x401025 <func4+22>      









