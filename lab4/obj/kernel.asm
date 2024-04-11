
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <entry_from_boot>:
# The entry_from_boot routine sets the stack pointer to the top of the
# OS kernel stack, then jumps to the `kernel` routine.

.globl entry_from_boot
entry_from_boot:
        movq $0x80000, %rsp
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
        movq %rsp, %rbp
   40007:	48 89 e5             	mov    %rsp,%rbp
        pushq $0
   4000a:	6a 00                	push   $0x0
        popfq
   4000c:	9d                   	popf   
        // Check for multiboot command line; if found pass it along.
        cmpl $0x2BADB002, %eax
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
        jne 1f
   40012:	75 0d                	jne    40021 <entry_from_boot+0x21>
        testl $4, (%rbx)
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
        je 1f
   4001a:	74 05                	je     40021 <entry_from_boot+0x21>
        movl 16(%rbx), %edi
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
        jmp 2f
   4001f:	eb 07                	jmp    40028 <entry_from_boot+0x28>
1:      movq $0, %rdi
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
2:      jmp kernel
   40028:	e9 3a 01 00 00       	jmp    40167 <kernel>
   4002d:	90                   	nop

000000000004002e <gpf_int_handler>:
# Interrupt handlers
.align 2

        .globl gpf_int_handler
gpf_int_handler:
        pushq $13               // trap number
   4002e:	6a 0d                	push   $0xd
        jmp generic_exception_handler
   40030:	eb 6e                	jmp    400a0 <generic_exception_handler>

0000000000040032 <pagefault_int_handler>:

        .globl pagefault_int_handler
pagefault_int_handler:
        pushq $14
   40032:	6a 0e                	push   $0xe
        jmp generic_exception_handler
   40034:	eb 6a                	jmp    400a0 <generic_exception_handler>

0000000000040036 <timer_int_handler>:

        .globl timer_int_handler
timer_int_handler:
        pushq $0                // error code
   40036:	6a 00                	push   $0x0
        pushq $32
   40038:	6a 20                	push   $0x20
        jmp generic_exception_handler
   4003a:	eb 64                	jmp    400a0 <generic_exception_handler>

000000000004003c <sys48_int_handler>:

sys48_int_handler:
        pushq $0
   4003c:	6a 00                	push   $0x0
        pushq $48
   4003e:	6a 30                	push   $0x30
        jmp generic_exception_handler
   40040:	eb 5e                	jmp    400a0 <generic_exception_handler>

0000000000040042 <sys49_int_handler>:

sys49_int_handler:
        pushq $0
   40042:	6a 00                	push   $0x0
        pushq $49
   40044:	6a 31                	push   $0x31
        jmp generic_exception_handler
   40046:	eb 58                	jmp    400a0 <generic_exception_handler>

0000000000040048 <sys50_int_handler>:

sys50_int_handler:
        pushq $0
   40048:	6a 00                	push   $0x0
        pushq $50
   4004a:	6a 32                	push   $0x32
        jmp generic_exception_handler
   4004c:	eb 52                	jmp    400a0 <generic_exception_handler>

000000000004004e <sys51_int_handler>:

sys51_int_handler:
        pushq $0
   4004e:	6a 00                	push   $0x0
        pushq $51
   40050:	6a 33                	push   $0x33
        jmp generic_exception_handler
   40052:	eb 4c                	jmp    400a0 <generic_exception_handler>

0000000000040054 <sys52_int_handler>:

sys52_int_handler:
        pushq $0
   40054:	6a 00                	push   $0x0
        pushq $52
   40056:	6a 34                	push   $0x34
        jmp generic_exception_handler
   40058:	eb 46                	jmp    400a0 <generic_exception_handler>

000000000004005a <sys53_int_handler>:

sys53_int_handler:
        pushq $0
   4005a:	6a 00                	push   $0x0
        pushq $53
   4005c:	6a 35                	push   $0x35
        jmp generic_exception_handler
   4005e:	eb 40                	jmp    400a0 <generic_exception_handler>

0000000000040060 <sys54_int_handler>:

sys54_int_handler:
        pushq $0
   40060:	6a 00                	push   $0x0
        pushq $54
   40062:	6a 36                	push   $0x36
        jmp generic_exception_handler
   40064:	eb 3a                	jmp    400a0 <generic_exception_handler>

0000000000040066 <sys55_int_handler>:

sys55_int_handler:
        pushq $0
   40066:	6a 00                	push   $0x0
        pushq $55
   40068:	6a 37                	push   $0x37
        jmp generic_exception_handler
   4006a:	eb 34                	jmp    400a0 <generic_exception_handler>

000000000004006c <sys56_int_handler>:

sys56_int_handler:
        pushq $0
   4006c:	6a 00                	push   $0x0
        pushq $56
   4006e:	6a 38                	push   $0x38
        jmp generic_exception_handler
   40070:	eb 2e                	jmp    400a0 <generic_exception_handler>

0000000000040072 <sys57_int_handler>:

sys57_int_handler:
        pushq $0
   40072:	6a 00                	push   $0x0
        pushq $57
   40074:	6a 39                	push   $0x39
        jmp generic_exception_handler
   40076:	eb 28                	jmp    400a0 <generic_exception_handler>

0000000000040078 <sys58_int_handler>:

sys58_int_handler:
        pushq $0
   40078:	6a 00                	push   $0x0
        pushq $58
   4007a:	6a 3a                	push   $0x3a
        jmp generic_exception_handler
   4007c:	eb 22                	jmp    400a0 <generic_exception_handler>

000000000004007e <sys59_int_handler>:

sys59_int_handler:
        pushq $0
   4007e:	6a 00                	push   $0x0
        pushq $59
   40080:	6a 3b                	push   $0x3b
        jmp generic_exception_handler
   40082:	eb 1c                	jmp    400a0 <generic_exception_handler>

0000000000040084 <sys60_int_handler>:

sys60_int_handler:
        pushq $0
   40084:	6a 00                	push   $0x0
        pushq $60
   40086:	6a 3c                	push   $0x3c
        jmp generic_exception_handler
   40088:	eb 16                	jmp    400a0 <generic_exception_handler>

000000000004008a <sys61_int_handler>:

sys61_int_handler:
        pushq $0
   4008a:	6a 00                	push   $0x0
        pushq $61
   4008c:	6a 3d                	push   $0x3d
        jmp generic_exception_handler
   4008e:	eb 10                	jmp    400a0 <generic_exception_handler>

0000000000040090 <sys62_int_handler>:

sys62_int_handler:
        pushq $0
   40090:	6a 00                	push   $0x0
        pushq $62
   40092:	6a 3e                	push   $0x3e
        jmp generic_exception_handler
   40094:	eb 0a                	jmp    400a0 <generic_exception_handler>

0000000000040096 <sys63_int_handler>:

sys63_int_handler:
        pushq $0
   40096:	6a 00                	push   $0x0
        pushq $63
   40098:	6a 3f                	push   $0x3f
        jmp generic_exception_handler
   4009a:	eb 04                	jmp    400a0 <generic_exception_handler>

000000000004009c <default_int_handler>:

        .globl default_int_handler
default_int_handler:
        pushq $0
   4009c:	6a 00                	push   $0x0
        jmp generic_exception_handler
   4009e:	eb 00                	jmp    400a0 <generic_exception_handler>

00000000000400a0 <generic_exception_handler>:


generic_exception_handler:
        pushq %gs
   400a0:	0f a8                	push   %gs
        pushq %fs
   400a2:	0f a0                	push   %fs
        pushq %r15
   400a4:	41 57                	push   %r15
        pushq %r14
   400a6:	41 56                	push   %r14
        pushq %r13
   400a8:	41 55                	push   %r13
        pushq %r12
   400aa:	41 54                	push   %r12
        pushq %r11
   400ac:	41 53                	push   %r11
        pushq %r10
   400ae:	41 52                	push   %r10
        pushq %r9
   400b0:	41 51                	push   %r9
        pushq %r8
   400b2:	41 50                	push   %r8
        pushq %rdi
   400b4:	57                   	push   %rdi
        pushq %rsi
   400b5:	56                   	push   %rsi
        pushq %rbp
   400b6:	55                   	push   %rbp
        pushq %rbx
   400b7:	53                   	push   %rbx
        pushq %rdx
   400b8:	52                   	push   %rdx
        pushq %rcx
   400b9:	51                   	push   %rcx
        pushq %rax
   400ba:	50                   	push   %rax
        movq %rsp, %rdi
   400bb:	48 89 e7             	mov    %rsp,%rdi
        call exception
   400be:	e8 ca 07 00 00       	call   4088d <exception>

00000000000400c3 <exception_return>:
        # `exception` should never return.


        .globl exception_return
exception_return:
        movq %rdi, %rsp
   400c3:	48 89 fc             	mov    %rdi,%rsp
        popq %rax
   400c6:	58                   	pop    %rax
        popq %rcx
   400c7:	59                   	pop    %rcx
        popq %rdx
   400c8:	5a                   	pop    %rdx
        popq %rbx
   400c9:	5b                   	pop    %rbx
        popq %rbp
   400ca:	5d                   	pop    %rbp
        popq %rsi
   400cb:	5e                   	pop    %rsi
        popq %rdi
   400cc:	5f                   	pop    %rdi
        popq %r8
   400cd:	41 58                	pop    %r8
        popq %r9
   400cf:	41 59                	pop    %r9
        popq %r10
   400d1:	41 5a                	pop    %r10
        popq %r11
   400d3:	41 5b                	pop    %r11
        popq %r12
   400d5:	41 5c                	pop    %r12
        popq %r13
   400d7:	41 5d                	pop    %r13
        popq %r14
   400d9:	41 5e                	pop    %r14
        popq %r15
   400db:	41 5f                	pop    %r15
        popq %fs
   400dd:	0f a1                	pop    %fs
        popq %gs
   400df:	0f a9                	pop    %gs
        addq $16, %rsp
   400e1:	48 83 c4 10          	add    $0x10,%rsp
        iretq
   400e5:	48 cf                	iretq  

00000000000400e7 <sys_int_handlers>:
   400e7:	3c 00                	cmp    $0x0,%al
   400e9:	04 00                	add    $0x0,%al
   400eb:	00 00                	add    %al,(%rax)
   400ed:	00 00                	add    %al,(%rax)
   400ef:	42 00 04 00          	add    %al,(%rax,%r8,1)
   400f3:	00 00                	add    %al,(%rax)
   400f5:	00 00                	add    %al,(%rax)
   400f7:	48 00 04 00          	rex.W add %al,(%rax,%rax,1)
   400fb:	00 00                	add    %al,(%rax)
   400fd:	00 00                	add    %al,(%rax)
   400ff:	4e 00 04 00          	rex.WRX add %r8b,(%rax,%r8,1)
   40103:	00 00                	add    %al,(%rax)
   40105:	00 00                	add    %al,(%rax)
   40107:	54                   	push   %rsp
   40108:	00 04 00             	add    %al,(%rax,%rax,1)
   4010b:	00 00                	add    %al,(%rax)
   4010d:	00 00                	add    %al,(%rax)
   4010f:	5a                   	pop    %rdx
   40110:	00 04 00             	add    %al,(%rax,%rax,1)
   40113:	00 00                	add    %al,(%rax)
   40115:	00 00                	add    %al,(%rax)
   40117:	60                   	(bad)  
   40118:	00 04 00             	add    %al,(%rax,%rax,1)
   4011b:	00 00                	add    %al,(%rax)
   4011d:	00 00                	add    %al,(%rax)
   4011f:	66 00 04 00          	data16 add %al,(%rax,%rax,1)
   40123:	00 00                	add    %al,(%rax)
   40125:	00 00                	add    %al,(%rax)
   40127:	6c                   	insb   (%dx),%es:(%rdi)
   40128:	00 04 00             	add    %al,(%rax,%rax,1)
   4012b:	00 00                	add    %al,(%rax)
   4012d:	00 00                	add    %al,(%rax)
   4012f:	72 00                	jb     40131 <sys_int_handlers+0x4a>
   40131:	04 00                	add    $0x0,%al
   40133:	00 00                	add    %al,(%rax)
   40135:	00 00                	add    %al,(%rax)
   40137:	78 00                	js     40139 <sys_int_handlers+0x52>
   40139:	04 00                	add    $0x0,%al
   4013b:	00 00                	add    %al,(%rax)
   4013d:	00 00                	add    %al,(%rax)
   4013f:	7e 00                	jle    40141 <sys_int_handlers+0x5a>
   40141:	04 00                	add    $0x0,%al
   40143:	00 00                	add    %al,(%rax)
   40145:	00 00                	add    %al,(%rax)
   40147:	84 00                	test   %al,(%rax)
   40149:	04 00                	add    $0x0,%al
   4014b:	00 00                	add    %al,(%rax)
   4014d:	00 00                	add    %al,(%rax)
   4014f:	8a 00                	mov    (%rax),%al
   40151:	04 00                	add    $0x0,%al
   40153:	00 00                	add    %al,(%rax)
   40155:	00 00                	add    %al,(%rax)
   40157:	90                   	nop
   40158:	00 04 00             	add    %al,(%rax,%rax,1)
   4015b:	00 00                	add    %al,(%rax)
   4015d:	00 00                	add    %al,(%rax)
   4015f:	96                   	xchg   %eax,%esi
   40160:	00 04 00             	add    %al,(%rax,%rax,1)
   40163:	00 00                	add    %al,(%rax)
	...

0000000000040167 <kernel>:
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, int program_number);

void kernel(const char* command) {
   40167:	f3 0f 1e fa          	endbr64 
   4016b:	55                   	push   %rbp
   4016c:	48 89 e5             	mov    %rsp,%rbp
   4016f:	48 83 ec 30          	sub    $0x30,%rsp
   40173:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    hardware_init();
   40177:	e8 cc 1b 00 00       	call   41d48 <hardware_init>
    pageinfo_init();
   4017c:	e8 65 0b 00 00       	call   40ce6 <pageinfo_init>
    console_clear();
   40181:	e8 d9 40 00 00       	call   4425f <console_clear>
    timer_init(HZ);
   40186:	bf 64 00 00 00       	mov    $0x64,%edi
   4018b:	e8 20 21 00 00       	call   422b0 <timer_init>

    for(uintptr_t va = 0; va<0x100000; va+=PAGESIZE)
   40190:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40197:	00 
   40198:	eb 6a                	jmp    40204 <kernel+0x9d>
    {
        if (va == 0xB8000) {
   4019a:	48 81 7d f8 00 80 0b 	cmpq   $0xb8000,-0x8(%rbp)
   401a1:	00 
   401a2:	75 2d                	jne    401d1 <kernel+0x6a>
            int result = virtual_memory_map(kernel_pagetable, va, va, PAGESIZE, PTE_P | PTE_W | PTE_U, NULL);
   401a4:	48 8b 05 55 4e 01 00 	mov    0x14e55(%rip),%rax        # 55000 <kernel_pagetable>
   401ab:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   401af:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   401b3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
   401b9:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   401bf:	b9 00 10 00 00       	mov    $0x1000,%ecx
   401c4:	48 89 c7             	mov    %rax,%rdi
   401c7:	e8 70 22 00 00       	call   4243c <virtual_memory_map>
   401cc:	89 45 e8             	mov    %eax,-0x18(%rbp)
   401cf:	eb 2b                	jmp    401fc <kernel+0x95>
        }
        else{
            int result = virtual_memory_map(kernel_pagetable, va, va, PAGESIZE, PTE_P | PTE_W, NULL);
   401d1:	48 8b 05 28 4e 01 00 	mov    0x14e28(%rip),%rax        # 55000 <kernel_pagetable>
   401d8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   401dc:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   401e0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
   401e6:	41 b8 03 00 00 00    	mov    $0x3,%r8d
   401ec:	b9 00 10 00 00       	mov    $0x1000,%ecx
   401f1:	48 89 c7             	mov    %rax,%rdi
   401f4:	e8 43 22 00 00       	call   4243c <virtual_memory_map>
   401f9:	89 45 ec             	mov    %eax,-0x14(%rbp)
    for(uintptr_t va = 0; va<0x100000; va+=PAGESIZE)
   401fc:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40203:	00 
   40204:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   4020b:	00 
   4020c:	76 8c                	jbe    4019a <kernel+0x33>
        }

    }

    // Set up process descriptors
    memset(processes, 0, sizeof(processes));
   4020e:	ba 80 0d 00 00       	mov    $0xd80,%edx
   40213:	be 00 00 00 00       	mov    $0x0,%esi
   40218:	48 8d 05 01 2e 01 00 	lea    0x12e01(%rip),%rax        # 53020 <processes>
   4021f:	48 89 c7             	mov    %rax,%rdi
   40222:	e8 f4 36 00 00       	call   4391b <memset>
    for (pid_t i = 0; i < NPROC; i++) {
   40227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   4022e:	eb 61                	jmp    40291 <kernel+0x12a>
        processes[i].p_pid = i;
   40230:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40233:	48 63 d0             	movslq %eax,%rdx
   40236:	48 89 d0             	mov    %rdx,%rax
   40239:	48 01 c0             	add    %rax,%rax
   4023c:	48 01 d0             	add    %rdx,%rax
   4023f:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40246:	00 
   40247:	48 01 d0             	add    %rdx,%rax
   4024a:	48 c1 e0 03          	shl    $0x3,%rax
   4024e:	48 89 c1             	mov    %rax,%rcx
   40251:	48 8d 15 c8 2d 01 00 	lea    0x12dc8(%rip),%rdx        # 53020 <processes>
   40258:	8b 45 f4             	mov    -0xc(%rbp),%eax
   4025b:	89 04 11             	mov    %eax,(%rcx,%rdx,1)
        processes[i].p_state = P_FREE;
   4025e:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40261:	48 63 d0             	movslq %eax,%rdx
   40264:	48 89 d0             	mov    %rdx,%rax
   40267:	48 01 c0             	add    %rax,%rax
   4026a:	48 01 d0             	add    %rdx,%rax
   4026d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40274:	00 
   40275:	48 01 d0             	add    %rdx,%rax
   40278:	48 c1 e0 03          	shl    $0x3,%rax
   4027c:	48 89 c2             	mov    %rax,%rdx
   4027f:	48 8d 05 62 2e 01 00 	lea    0x12e62(%rip),%rax        # 530e8 <processes+0xc8>
   40286:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    for (pid_t i = 0; i < NPROC; i++) {
   4028d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40291:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   40295:	7e 99                	jle    40230 <kernel+0xc9>


#if FORCE_FORK
    process_setup(1, 4);
#else
    if (command && strcmp(command, "fork") == 0) {
   40297:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   4029c:	74 2b                	je     402c9 <kernel+0x162>
   4029e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   402a2:	48 8d 15 f7 3f 00 00 	lea    0x3ff7(%rip),%rdx        # 442a0 <console_clear+0x41>
   402a9:	48 89 d6             	mov    %rdx,%rsi
   402ac:	48 89 c7             	mov    %rax,%rdi
   402af:	e8 e8 36 00 00       	call   4399c <strcmp>
   402b4:	85 c0                	test   %eax,%eax
   402b6:	75 11                	jne    402c9 <kernel+0x162>
        process_setup(1, 4);
   402b8:	be 04 00 00 00       	mov    $0x4,%esi
   402bd:	bf 01 00 00 00       	mov    $0x1,%edi
   402c2:	e8 c5 01 00 00       	call   4048c <process_setup>
   402c7:	eb 57                	jmp    40320 <kernel+0x1b9>
    } else if (command && strcmp(command, "forkexit") == 0) {
   402c9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
   402ce:	74 2b                	je     402fb <kernel+0x194>
   402d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   402d4:	48 8d 15 ca 3f 00 00 	lea    0x3fca(%rip),%rdx        # 442a5 <console_clear+0x46>
   402db:	48 89 d6             	mov    %rdx,%rsi
   402de:	48 89 c7             	mov    %rax,%rdi
   402e1:	e8 b6 36 00 00       	call   4399c <strcmp>
   402e6:	85 c0                	test   %eax,%eax
   402e8:	75 11                	jne    402fb <kernel+0x194>
        process_setup(1, 5);
   402ea:	be 05 00 00 00       	mov    $0x5,%esi
   402ef:	bf 01 00 00 00       	mov    $0x1,%edi
   402f4:	e8 93 01 00 00       	call   4048c <process_setup>
   402f9:	eb 25                	jmp    40320 <kernel+0x1b9>
    } else {
        for (pid_t i = 1; i <= 4; ++i) {
   402fb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%rbp)
   40302:	eb 16                	jmp    4031a <kernel+0x1b3>
            process_setup(i, i - 1);
   40304:	8b 45 f0             	mov    -0x10(%rbp),%eax
   40307:	8d 50 ff             	lea    -0x1(%rax),%edx
   4030a:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4030d:	89 d6                	mov    %edx,%esi
   4030f:	89 c7                	mov    %eax,%edi
   40311:	e8 76 01 00 00       	call   4048c <process_setup>
        for (pid_t i = 1; i <= 4; ++i) {
   40316:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
   4031a:	83 7d f0 04          	cmpl   $0x4,-0x10(%rbp)
   4031e:	7e e4                	jle    40304 <kernel+0x19d>
        }
    }
#endif
    
    // Switch to the first process using run()
    run(&processes[1]);
   40320:	48 8d 05 d1 2d 01 00 	lea    0x12dd1(%rip),%rax        # 530f8 <processes+0xd8>
   40327:	48 89 c7             	mov    %rax,%rdi
   4032a:	e8 4c 09 00 00       	call   40c7b <run>

000000000004032f <allocator>:
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

int8_t globalowner;

x86_64_pagetable* allocator() {
   4032f:	f3 0f 1e fa          	endbr64 
   40333:	55                   	push   %rbp
   40334:	48 89 e5             	mov    %rsp,%rbp
   40337:	48 83 ec 10          	sub    $0x10,%rsp
    for(int i = 0; i<PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   4033b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   40342:	e9 8c 00 00 00       	jmp    403d3 <allocator+0xa4>
    {
        if(pageinfo[i].refcount == 0)
   40347:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4034a:	48 98                	cltq   
   4034c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40350:	48 8d 05 6a 3a 01 00 	lea    0x13a6a(%rip),%rax        # 53dc1 <pageinfo+0x1>
   40357:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4035b:	84 c0                	test   %al,%al
   4035d:	75 70                	jne    403cf <allocator+0xa0>
        {
            x86_64_pagetable* allocatedPageTable = (x86_64_pagetable*) PAGEADDRESS(i);
   4035f:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40362:	48 98                	cltq   
   40364:	48 c1 e0 0c          	shl    $0xc,%rax
   40368:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
            pageinfo[i].owner = globalowner;
   4036c:	0f b6 05 95 2c 01 00 	movzbl 0x12c95(%rip),%eax        # 53008 <globalowner>
   40373:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40376:	48 63 d2             	movslq %edx,%rdx
   40379:	48 8d 0c 12          	lea    (%rdx,%rdx,1),%rcx
   4037d:	48 8d 15 3c 3a 01 00 	lea    0x13a3c(%rip),%rdx        # 53dc0 <pageinfo>
   40384:	88 04 11             	mov    %al,(%rcx,%rdx,1)
            pageinfo[i].refcount++;
   40387:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4038a:	48 98                	cltq   
   4038c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40390:	48 8d 05 2a 3a 01 00 	lea    0x13a2a(%rip),%rax        # 53dc1 <pageinfo+0x1>
   40397:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4039b:	83 c0 01             	add    $0x1,%eax
   4039e:	89 c1                	mov    %eax,%ecx
   403a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
   403a3:	48 98                	cltq   
   403a5:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   403a9:	48 8d 05 11 3a 01 00 	lea    0x13a11(%rip),%rax        # 53dc1 <pageinfo+0x1>
   403b0:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
            memset(allocatedPageTable, 0, sizeof(x86_64_pagetable));
   403b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   403b7:	ba 00 10 00 00       	mov    $0x1000,%edx
   403bc:	be 00 00 00 00       	mov    $0x0,%esi
   403c1:	48 89 c7             	mov    %rax,%rdi
   403c4:	e8 52 35 00 00       	call   4391b <memset>
            return allocatedPageTable;
   403c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   403cd:	eb 16                	jmp    403e5 <allocator+0xb6>
    for(int i = 0; i<PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   403cf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   403d3:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   403da:	0f 8e 67 ff ff ff    	jle    40347 <allocator+0x18>
        }
    }
    return NULL;
   403e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
   403e5:	c9                   	leave  
   403e6:	c3                   	ret    

00000000000403e7 <copy_pagetable>:

x86_64_pagetable* copy_pagetable(x86_64_pagetable* pagetable, int8_t owner){
   403e7:	f3 0f 1e fa          	endbr64 
   403eb:	55                   	push   %rbp
   403ec:	48 89 e5             	mov    %rsp,%rbp
   403ef:	48 83 ec 50          	sub    $0x50,%rsp
   403f3:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
   403f7:	89 f0                	mov    %esi,%eax
   403f9:	88 45 b4             	mov    %al,-0x4c(%rbp)
    globalowner = owner;
   403fc:	0f b6 45 b4          	movzbl -0x4c(%rbp),%eax
   40400:	88 05 02 2c 01 00    	mov    %al,0x12c02(%rip)        # 53008 <globalowner>
    x86_64_pagetable* processPageTable = allocator();
   40406:	b8 00 00 00 00       	mov    $0x0,%eax
   4040b:	e8 1f ff ff ff       	call   4032f <allocator>
   40410:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40414:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   4041b:	00 
   4041c:	eb 5e                	jmp    4047c <copy_pagetable+0x95>
        vamapping table_mapping = virtual_memory_lookup(pagetable, va);
   4041e:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   40422:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40426:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   4042a:	48 89 ce             	mov    %rcx,%rsi
   4042d:	48 89 c7             	mov    %rax,%rdi
   40430:	e8 81 24 00 00       	call   428b6 <virtual_memory_lookup>
        if (table_mapping.pn != -1) {
   40435:	8b 45 c8             	mov    -0x38(%rbp),%eax
   40438:	83 f8 ff             	cmp    $0xffffffff,%eax
   4043b:	74 37                	je     40474 <copy_pagetable+0x8d>
            uintptr_t pa = table_mapping.pa;
   4043d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   40441:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
            int perm = table_mapping.perm;
   40445:	8b 45 d8             	mov    -0x28(%rbp),%eax
   40448:	89 45 e4             	mov    %eax,-0x1c(%rbp)
            int result = virtual_memory_map(processPageTable, va, pa, PAGESIZE, perm, allocator);
   4044b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
   4044e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   40452:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   40456:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4045a:	4c 8d 0d ce fe ff ff 	lea    -0x132(%rip),%r9        # 4032f <allocator>
   40461:	41 89 c8             	mov    %ecx,%r8d
   40464:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40469:	48 89 c7             	mov    %rax,%rdi
   4046c:	e8 cb 1f 00 00       	call   4243c <virtual_memory_map>
   40471:	89 45 e0             	mov    %eax,-0x20(%rbp)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   40474:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4047b:	00 
   4047c:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   40483:	00 
   40484:	76 98                	jbe    4041e <copy_pagetable+0x37>
        }
    }
    return processPageTable;
   40486:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
}
   4048a:	c9                   	leave  
   4048b:	c3                   	ret    

000000000004048c <process_setup>:

void process_setup(pid_t pid, int program_number) {
   4048c:	f3 0f 1e fa          	endbr64 
   40490:	55                   	push   %rbp
   40491:	48 89 e5             	mov    %rsp,%rbp
   40494:	48 83 ec 50          	sub    $0x50,%rsp
   40498:	89 7d bc             	mov    %edi,-0x44(%rbp)
   4049b:	89 75 b8             	mov    %esi,-0x48(%rbp)
    globalowner = pid;
   4049e:	8b 45 bc             	mov    -0x44(%rbp),%eax
   404a1:	88 05 61 2b 01 00    	mov    %al,0x12b61(%rip)        # 53008 <globalowner>
    process_init(&processes[pid], 0);
   404a7:	8b 45 bc             	mov    -0x44(%rbp),%eax
   404aa:	48 63 d0             	movslq %eax,%rdx
   404ad:	48 89 d0             	mov    %rdx,%rax
   404b0:	48 01 c0             	add    %rax,%rax
   404b3:	48 01 d0             	add    %rdx,%rax
   404b6:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   404bd:	00 
   404be:	48 01 d0             	add    %rdx,%rax
   404c1:	48 c1 e0 03          	shl    $0x3,%rax
   404c5:	48 8d 15 54 2b 01 00 	lea    0x12b54(%rip),%rdx        # 53020 <processes>
   404cc:	48 01 d0             	add    %rdx,%rax
   404cf:	be 00 00 00 00       	mov    $0x0,%esi
   404d4:	48 89 c7             	mov    %rax,%rdi
   404d7:	e8 22 28 00 00       	call   42cfe <process_init>
    processes[pid].p_pagetable = copy_pagetable(kernel_pagetable, pid);
   404dc:	8b 45 bc             	mov    -0x44(%rbp),%eax
   404df:	0f be d0             	movsbl %al,%edx
   404e2:	48 8b 05 17 4b 01 00 	mov    0x14b17(%rip),%rax        # 55000 <kernel_pagetable>
   404e9:	89 d6                	mov    %edx,%esi
   404eb:	48 89 c7             	mov    %rax,%rdi
   404ee:	e8 f4 fe ff ff       	call   403e7 <copy_pagetable>
   404f3:	48 89 c2             	mov    %rax,%rdx
   404f6:	8b 45 bc             	mov    -0x44(%rbp),%eax
   404f9:	48 63 c8             	movslq %eax,%rcx
   404fc:	48 89 c8             	mov    %rcx,%rax
   404ff:	48 01 c0             	add    %rax,%rax
   40502:	48 01 c8             	add    %rcx,%rax
   40505:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   4050c:	00 
   4050d:	48 01 c8             	add    %rcx,%rax
   40510:	48 c1 e0 03          	shl    $0x3,%rax
   40514:	48 89 c1             	mov    %rax,%rcx
   40517:	48 8d 05 d2 2b 01 00 	lea    0x12bd2(%rip),%rax        # 530f0 <processes+0xd0>
   4051e:	48 89 14 01          	mov    %rdx,(%rcx,%rax,1)
    for(uintptr_t va = PROC_START_ADDR; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   40522:	48 c7 45 f8 00 00 10 	movq   $0x100000,-0x8(%rbp)
   40529:	00 
   4052a:	e9 af 00 00 00       	jmp    405de <process_setup+0x152>
    {
        vamapping table_mapping = virtual_memory_lookup(processes[pid].p_pagetable, va);
   4052f:	8b 45 bc             	mov    -0x44(%rbp),%eax
   40532:	48 63 d0             	movslq %eax,%rdx
   40535:	48 89 d0             	mov    %rdx,%rax
   40538:	48 01 c0             	add    %rax,%rax
   4053b:	48 01 d0             	add    %rdx,%rax
   4053e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40545:	00 
   40546:	48 01 d0             	add    %rdx,%rax
   40549:	48 c1 e0 03          	shl    $0x3,%rax
   4054d:	48 89 c2             	mov    %rax,%rdx
   40550:	48 8d 05 99 2b 01 00 	lea    0x12b99(%rip),%rax        # 530f0 <processes+0xd0>
   40557:	48 8b 0c 02          	mov    (%rdx,%rax,1),%rcx
   4055b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   4055f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40563:	48 89 ce             	mov    %rcx,%rsi
   40566:	48 89 c7             	mov    %rax,%rdi
   40569:	e8 48 23 00 00       	call   428b6 <virtual_memory_lookup>
        if (table_mapping.pn != -1) {
   4056e:	8b 45 c0             	mov    -0x40(%rbp),%eax
   40571:	83 f8 ff             	cmp    $0xffffffff,%eax
   40574:	74 60                	je     405d6 <process_setup+0x14a>
            uintptr_t pa = table_mapping.pa;
   40576:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4057a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            int perm = 0;
   4057e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
            int result = virtual_memory_map(processes[pid].p_pagetable, va, pa, PAGESIZE, perm, allocator);
   40585:	8b 45 bc             	mov    -0x44(%rbp),%eax
   40588:	48 63 d0             	movslq %eax,%rdx
   4058b:	48 89 d0             	mov    %rdx,%rax
   4058e:	48 01 c0             	add    %rax,%rax
   40591:	48 01 d0             	add    %rdx,%rax
   40594:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   4059b:	00 
   4059c:	48 01 d0             	add    %rdx,%rax
   4059f:	48 c1 e0 03          	shl    $0x3,%rax
   405a3:	48 89 c2             	mov    %rax,%rdx
   405a6:	48 8d 05 43 2b 01 00 	lea    0x12b43(%rip),%rax        # 530f0 <processes+0xd0>
   405ad:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   405b1:	8b 4d dc             	mov    -0x24(%rbp),%ecx
   405b4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   405b8:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   405bc:	4c 8d 0d 6c fd ff ff 	lea    -0x294(%rip),%r9        # 4032f <allocator>
   405c3:	41 89 c8             	mov    %ecx,%r8d
   405c6:	b9 00 10 00 00       	mov    $0x1000,%ecx
   405cb:	48 89 c7             	mov    %rax,%rdi
   405ce:	e8 69 1e 00 00       	call   4243c <virtual_memory_map>
   405d3:	89 45 d8             	mov    %eax,-0x28(%rbp)
    for(uintptr_t va = PROC_START_ADDR; va < MEMSIZE_VIRTUAL; va += PAGESIZE)
   405d6:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   405dd:	00 
   405de:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   405e5:	00 
   405e6:	0f 86 43 ff ff ff    	jbe    4052f <process_setup+0xa3>
        }
    }
    //processes[pid].p_pagetable = kernel_pagetable;
    //++pageinfo[PAGENUMBER(kernel_pagetable)].refcount;
    int r = program_load(&processes[pid], program_number, NULL);
   405ec:	8b 45 bc             	mov    -0x44(%rbp),%eax
   405ef:	48 63 d0             	movslq %eax,%rdx
   405f2:	48 89 d0             	mov    %rdx,%rax
   405f5:	48 01 c0             	add    %rax,%rax
   405f8:	48 01 d0             	add    %rdx,%rax
   405fb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40602:	00 
   40603:	48 01 d0             	add    %rdx,%rax
   40606:	48 c1 e0 03          	shl    $0x3,%rax
   4060a:	48 8d 15 0f 2a 01 00 	lea    0x12a0f(%rip),%rdx        # 53020 <processes>
   40611:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   40615:	8b 45 b8             	mov    -0x48(%rbp),%eax
   40618:	ba 00 00 00 00       	mov    $0x0,%edx
   4061d:	89 c6                	mov    %eax,%esi
   4061f:	48 89 cf             	mov    %rcx,%rdi
   40622:	e8 09 2f 00 00       	call   43530 <program_load>
   40627:	89 45 f4             	mov    %eax,-0xc(%rbp)
    assert(r >= 0);
   4062a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   4062e:	79 1e                	jns    4064e <process_setup+0x1c2>
   40630:	48 8d 05 77 3c 00 00 	lea    0x3c77(%rip),%rax        # 442ae <console_clear+0x4f>
   40637:	48 89 c2             	mov    %rax,%rdx
   4063a:	be b6 00 00 00       	mov    $0xb6,%esi
   4063f:	48 8d 05 6f 3c 00 00 	lea    0x3c6f(%rip),%rax        # 442b5 <console_clear+0x56>
   40646:	48 89 c7             	mov    %rax,%rdi
   40649:	e8 a9 2e 00 00       	call   434f7 <assert_fail>
    //processes[pid].p_registers.reg_rsp = PROC_START_ADDR + PROC_SIZE * pid;
    processes[pid].p_registers.reg_rsp = MEMSIZE_VIRTUAL;
   4064e:	8b 45 bc             	mov    -0x44(%rbp),%eax
   40651:	48 63 d0             	movslq %eax,%rdx
   40654:	48 89 d0             	mov    %rdx,%rax
   40657:	48 01 c0             	add    %rax,%rax
   4065a:	48 01 d0             	add    %rdx,%rax
   4065d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40664:	00 
   40665:	48 01 d0             	add    %rdx,%rax
   40668:	48 c1 e0 03          	shl    $0x3,%rax
   4066c:	48 89 c2             	mov    %rax,%rdx
   4066f:	48 8d 05 62 2a 01 00 	lea    0x12a62(%rip),%rax        # 530d8 <processes+0xb8>
   40676:	48 c7 04 02 00 00 30 	movq   $0x300000,(%rdx,%rax,1)
   4067d:	00 
    uintptr_t stack_page = processes[pid].p_registers.reg_rsp - PAGESIZE;
   4067e:	8b 45 bc             	mov    -0x44(%rbp),%eax
   40681:	48 63 d0             	movslq %eax,%rdx
   40684:	48 89 d0             	mov    %rdx,%rax
   40687:	48 01 c0             	add    %rax,%rax
   4068a:	48 01 d0             	add    %rdx,%rax
   4068d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40694:	00 
   40695:	48 01 d0             	add    %rdx,%rax
   40698:	48 c1 e0 03          	shl    $0x3,%rax
   4069c:	48 89 c2             	mov    %rax,%rdx
   4069f:	48 8d 05 32 2a 01 00 	lea    0x12a32(%rip),%rax        # 530d8 <processes+0xb8>
   406a6:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   406aa:	48 2d 00 10 00 00    	sub    $0x1000,%rax
   406b0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    //assign_physical_page(stack_page, pid);
    my_assign_physical_page(processes[pid].p_pagetable, stack_page, pid);
   406b4:	8b 45 bc             	mov    -0x44(%rbp),%eax
   406b7:	0f be d0             	movsbl %al,%edx
   406ba:	8b 45 bc             	mov    -0x44(%rbp),%eax
   406bd:	48 63 c8             	movslq %eax,%rcx
   406c0:	48 89 c8             	mov    %rcx,%rax
   406c3:	48 01 c0             	add    %rax,%rax
   406c6:	48 01 c8             	add    %rcx,%rax
   406c9:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   406d0:	00 
   406d1:	48 01 c8             	add    %rcx,%rax
   406d4:	48 c1 e0 03          	shl    $0x3,%rax
   406d8:	48 89 c1             	mov    %rax,%rcx
   406db:	48 8d 05 0e 2a 01 00 	lea    0x12a0e(%rip),%rax        # 530f0 <processes+0xd0>
   406e2:	48 8b 04 01          	mov    (%rcx,%rax,1),%rax
   406e6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   406ea:	48 89 ce             	mov    %rcx,%rsi
   406ed:	48 89 c7             	mov    %rax,%rdi
   406f0:	e8 bf 00 00 00       	call   407b4 <my_assign_physical_page>
    //virtual_memory_map(processes[pid].p_pagetable, stack_page, stack_page,
                       //PAGESIZE, PTE_P | PTE_W | PTE_U, NULL);
    processes[pid].p_state = P_RUNNABLE;
   406f5:	8b 45 bc             	mov    -0x44(%rbp),%eax
   406f8:	48 63 d0             	movslq %eax,%rdx
   406fb:	48 89 d0             	mov    %rdx,%rax
   406fe:	48 01 c0             	add    %rax,%rax
   40701:	48 01 d0             	add    %rdx,%rax
   40704:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   4070b:	00 
   4070c:	48 01 d0             	add    %rdx,%rax
   4070f:	48 c1 e0 03          	shl    $0x3,%rax
   40713:	48 89 c2             	mov    %rax,%rdx
   40716:	48 8d 05 cb 29 01 00 	lea    0x129cb(%rip),%rax        # 530e8 <processes+0xc8>
   4071d:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
}
   40724:	90                   	nop
   40725:	c9                   	leave  
   40726:	c3                   	ret    

0000000000040727 <assign_physical_page>:
// assign_physical_page(addr, owner)
//    Allocates the page with physical address `addr` to the given owner.
//    Fails if physical page `addr` was already allocated. Returns 0 on
//    success and -1 on failure. Used by the program loader.

int assign_physical_page(uintptr_t addr, int8_t owner) {
   40727:	f3 0f 1e fa          	endbr64 
   4072b:	55                   	push   %rbp
   4072c:	48 89 e5             	mov    %rsp,%rbp
   4072f:	48 83 ec 10          	sub    $0x10,%rsp
   40733:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   40737:	89 f0                	mov    %esi,%eax
   40739:	88 45 f4             	mov    %al,-0xc(%rbp)
    if ((addr & 0xFFF) != 0
   4073c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40740:	25 ff 0f 00 00       	and    $0xfff,%eax
   40745:	48 85 c0             	test   %rax,%rax
   40748:	75 27                	jne    40771 <assign_physical_page+0x4a>
        || addr >= MEMSIZE_PHYSICAL
   4074a:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40751:	00 
   40752:	77 1d                	ja     40771 <assign_physical_page+0x4a>
        || pageinfo[PAGENUMBER(addr)].refcount != 0) {
   40754:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40758:	48 c1 e8 0c          	shr    $0xc,%rax
   4075c:	48 98                	cltq   
   4075e:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40762:	48 8d 05 58 36 01 00 	lea    0x13658(%rip),%rax        # 53dc1 <pageinfo+0x1>
   40769:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4076d:	84 c0                	test   %al,%al
   4076f:	74 07                	je     40778 <assign_physical_page+0x51>
        return -1;
   40771:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   40776:	eb 3a                	jmp    407b2 <assign_physical_page+0x8b>
    } else {
        pageinfo[PAGENUMBER(addr)].refcount = 1;
   40778:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4077c:	48 c1 e8 0c          	shr    $0xc,%rax
   40780:	48 98                	cltq   
   40782:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40786:	48 8d 05 34 36 01 00 	lea    0x13634(%rip),%rax        # 53dc1 <pageinfo+0x1>
   4078d:	c6 04 02 01          	movb   $0x1,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40791:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40795:	48 c1 e8 0c          	shr    $0xc,%rax
   40799:	48 98                	cltq   
   4079b:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   4079f:	48 8d 15 1a 36 01 00 	lea    0x1361a(%rip),%rdx        # 53dc0 <pageinfo>
   407a6:	0f b6 45 f4          	movzbl -0xc(%rbp),%eax
   407aa:	88 04 11             	mov    %al,(%rcx,%rdx,1)
        return 0;
   407ad:	b8 00 00 00 00       	mov    $0x0,%eax
    }
}
   407b2:	c9                   	leave  
   407b3:	c3                   	ret    

00000000000407b4 <my_assign_physical_page>:

int my_assign_physical_page(x86_64_pagetable* pagetable, uintptr_t addr, int8_t owner) {
   407b4:	f3 0f 1e fa          	endbr64 
   407b8:	55                   	push   %rbp
   407b9:	48 89 e5             	mov    %rsp,%rbp
   407bc:	48 83 ec 30          	sub    $0x30,%rsp
   407c0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   407c4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
   407c8:	89 d0                	mov    %edx,%eax
   407ca:	88 45 dc             	mov    %al,-0x24(%rbp)
    int r = -1;
   407cd:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
    for(int i = 0; i<PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   407d4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   407db:	e9 9b 00 00 00       	jmp    4087b <my_assign_physical_page+0xc7>
    {
        if(pageinfo[i].refcount == 0)
   407e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
   407e3:	48 98                	cltq   
   407e5:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   407e9:	48 8d 05 d1 35 01 00 	lea    0x135d1(%rip),%rax        # 53dc1 <pageinfo+0x1>
   407f0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   407f4:	84 c0                	test   %al,%al
   407f6:	75 7f                	jne    40877 <my_assign_physical_page+0xc3>
        {
            r = 0;
   407f8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
            uintptr_t allocatedPageAdd = PAGEADDRESS(i);
   407ff:	8b 45 f8             	mov    -0x8(%rbp),%eax
   40802:	48 98                	cltq   
   40804:	48 c1 e0 0c          	shl    $0xc,%rax
   40808:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
            pageinfo[i].owner = owner;
   4080c:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4080f:	48 98                	cltq   
   40811:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   40815:	48 8d 15 a4 35 01 00 	lea    0x135a4(%rip),%rdx        # 53dc0 <pageinfo>
   4081c:	0f b6 45 dc          	movzbl -0x24(%rbp),%eax
   40820:	88 04 11             	mov    %al,(%rcx,%rdx,1)
            pageinfo[i].refcount++;
   40823:	8b 45 f8             	mov    -0x8(%rbp),%eax
   40826:	48 98                	cltq   
   40828:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4082c:	48 8d 05 8e 35 01 00 	lea    0x1358e(%rip),%rax        # 53dc1 <pageinfo+0x1>
   40833:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40837:	83 c0 01             	add    $0x1,%eax
   4083a:	89 c1                	mov    %eax,%ecx
   4083c:	8b 45 f8             	mov    -0x8(%rbp),%eax
   4083f:	48 98                	cltq   
   40841:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40845:	48 8d 05 75 35 01 00 	lea    0x13575(%rip),%rax        # 53dc1 <pageinfo+0x1>
   4084c:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
            virtual_memory_map(pagetable, addr, allocatedPageAdd, PAGESIZE, PTE_P | PTE_W | PTE_U, allocator);
   4084f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40853:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
   40857:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4085b:	4c 8d 0d cd fa ff ff 	lea    -0x533(%rip),%r9        # 4032f <allocator>
   40862:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40868:	b9 00 10 00 00       	mov    $0x1000,%ecx
   4086d:	48 89 c7             	mov    %rax,%rdi
   40870:	e8 c7 1b 00 00       	call   4243c <virtual_memory_map>
            break;
   40875:	eb 11                	jmp    40888 <my_assign_physical_page+0xd4>
    for(int i = 0; i<PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   40877:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   4087b:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   40882:	0f 8e 58 ff ff ff    	jle    407e0 <my_assign_physical_page+0x2c>
        }

    }
    return r;
   40888:	8b 45 fc             	mov    -0x4(%rbp),%eax
} 
   4088b:	c9                   	leave  
   4088c:	c3                   	ret    

000000000004088d <exception>:
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled whenever the kernel is running.

void exception(x86_64_registers* reg) {
   4088d:	f3 0f 1e fa          	endbr64 
   40891:	55                   	push   %rbp
   40892:	48 89 e5             	mov    %rsp,%rbp
   40895:	48 83 ec 50          	sub    $0x50,%rsp
   40899:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    // Copy the saved registers into the `current` process descriptor
    // and always use the kernel's page table.
    current->p_registers = *reg;
   4089d:	48 8b 05 5c 27 01 00 	mov    0x1275c(%rip),%rax        # 53000 <current>
   408a4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   408a8:	48 83 c0 08          	add    $0x8,%rax
   408ac:	48 89 d6             	mov    %rdx,%rsi
   408af:	ba 18 00 00 00       	mov    $0x18,%edx
   408b4:	48 89 c7             	mov    %rax,%rdi
   408b7:	48 89 d1             	mov    %rdx,%rcx
   408ba:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    set_pagetable(kernel_pagetable);
   408bd:	48 8b 05 3c 47 01 00 	mov    0x1473c(%rip),%rax        # 55000 <kernel_pagetable>
   408c4:	48 89 c7             	mov    %rax,%rdi
   408c7:	e8 de 20 00 00       	call   429aa <set_pagetable>
    // Events logged this way are stored in the host's `log.txt` file.
    /*log_printf("proc %d: exception %d\n", current->p_pid, reg->reg_intno);*/

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
   408cc:	8b 05 2a 87 07 00    	mov    0x7872a(%rip),%eax        # b8ffc <cursorpos>
   408d2:	89 c7                	mov    %eax,%edi
   408d4:	e8 e8 24 00 00       	call   42dc1 <console_show_cursor>
    if (reg->reg_intno != INT_PAGEFAULT || (reg->reg_err & PFERR_USER)) {
   408d9:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   408dd:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   408e4:	48 83 f8 0e          	cmp    $0xe,%rax
   408e8:	75 13                	jne    408fd <exception+0x70>
   408ea:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   408ee:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   408f5:	83 e0 04             	and    $0x4,%eax
   408f8:	48 85 c0             	test   %rax,%rax
   408fb:	74 0f                	je     4090c <exception+0x7f>
        check_virtual_memory();
   408fd:	e8 26 08 00 00       	call   41128 <check_virtual_memory>
        memshow_physical();
   40902:	e8 1c 0a 00 00       	call   41323 <memshow_physical>
        memshow_virtual_animate();
   40907:	e8 74 0d 00 00       	call   41680 <memshow_virtual_animate>
	}
#endif
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();
   4090c:	e8 c6 29 00 00       	call   432d7 <check_keyboard>


    // Actually handle the exception.
    switch (reg->reg_intno) {
   40911:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40915:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   4091c:	48 83 e8 0e          	sub    $0xe,%rax
   40920:	48 83 f8 26          	cmp    $0x26,%rax
   40924:	0f 87 73 02 00 00    	ja     40b9d <exception+0x310>
   4092a:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
   40931:	00 
   40932:	48 8d 05 33 3a 00 00 	lea    0x3a33(%rip),%rax        # 4436c <console_clear+0x10d>
   40939:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   4093c:	48 98                	cltq   
   4093e:	48 8d 15 27 3a 00 00 	lea    0x3a27(%rip),%rdx        # 4436c <console_clear+0x10d>
   40945:	48 01 d0             	add    %rdx,%rax
   40948:	3e ff e0             	notrack jmp *%rax
    
    case INT_SYS_PANIC:
        panic(NULL);
   4094b:	bf 00 00 00 00       	mov    $0x0,%edi
   40950:	b8 00 00 00 00       	mov    $0x0,%eax
   40955:	e8 ad 2a 00 00       	call   43407 <panic>
        break;                  // will not be reached

    case INT_SYS_GETPID:
        current->p_registers.reg_rax = current->p_pid;
   4095a:	48 8b 05 9f 26 01 00 	mov    0x1269f(%rip),%rax        # 53000 <current>
   40961:	8b 10                	mov    (%rax),%edx
   40963:	48 8b 05 96 26 01 00 	mov    0x12696(%rip),%rax        # 53000 <current>
   4096a:	48 63 d2             	movslq %edx,%rdx
   4096d:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40971:	e9 49 02 00 00       	jmp    40bbf <exception+0x332>

    case INT_SYS_YIELD:
        schedule();
   40976:	e8 6d 02 00 00       	call   40be8 <schedule>
        break;                  /* will not be reached */
   4097b:	e9 3f 02 00 00       	jmp    40bbf <exception+0x332>

    case INT_SYS_PAGE_ALLOC: {
        uintptr_t addr = current->p_registers.reg_rdi;
   40980:	48 8b 05 79 26 01 00 	mov    0x12679(%rip),%rax        # 53000 <current>
   40987:	48 8b 40 38          	mov    0x38(%rax),%rax
   4098b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        //int r = assign_physical_page(addr, current->p_pid);
        int r = -1;
   4098f:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
        for(int i = 0; i<PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   40996:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   4099d:	e9 af 00 00 00       	jmp    40a51 <exception+0x1c4>
        {
            if(pageinfo[i].refcount == 0)
   409a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
   409a5:	48 98                	cltq   
   409a7:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   409ab:	48 8d 05 0f 34 01 00 	lea    0x1340f(%rip),%rax        # 53dc1 <pageinfo+0x1>
   409b2:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   409b6:	84 c0                	test   %al,%al
   409b8:	0f 85 8f 00 00 00    	jne    40a4d <exception+0x1c0>
            {
                r = 0;
   409be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
                uintptr_t allocatedPageAdd = PAGEADDRESS(i);
   409c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
   409c8:	48 98                	cltq   
   409ca:	48 c1 e0 0c          	shl    $0xc,%rax
   409ce:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
                pageinfo[i].owner = current->p_pid;
   409d2:	48 8b 05 27 26 01 00 	mov    0x12627(%rip),%rax        # 53000 <current>
   409d9:	8b 00                	mov    (%rax),%eax
   409db:	89 c1                	mov    %eax,%ecx
   409dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
   409e0:	48 98                	cltq   
   409e2:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   409e6:	48 8d 05 d3 33 01 00 	lea    0x133d3(%rip),%rax        # 53dc0 <pageinfo>
   409ed:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
                pageinfo[i].refcount++;
   409f0:	8b 45 f8             	mov    -0x8(%rbp),%eax
   409f3:	48 98                	cltq   
   409f5:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   409f9:	48 8d 05 c1 33 01 00 	lea    0x133c1(%rip),%rax        # 53dc1 <pageinfo+0x1>
   40a00:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   40a04:	83 c0 01             	add    $0x1,%eax
   40a07:	89 c1                	mov    %eax,%ecx
   40a09:	8b 45 f8             	mov    -0x8(%rbp),%eax
   40a0c:	48 98                	cltq   
   40a0e:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40a12:	48 8d 05 a8 33 01 00 	lea    0x133a8(%rip),%rax        # 53dc1 <pageinfo+0x1>
   40a19:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
                virtual_memory_map(current->p_pagetable, addr, allocatedPageAdd, PAGESIZE, PTE_P | PTE_W | PTE_U, NULL);
   40a1c:	48 8b 05 dd 25 01 00 	mov    0x125dd(%rip),%rax        # 53000 <current>
   40a23:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40a2a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   40a2e:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
   40a32:	41 b9 00 00 00 00    	mov    $0x0,%r9d
   40a38:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   40a3e:	b9 00 10 00 00       	mov    $0x1000,%ecx
   40a43:	48 89 c7             	mov    %rax,%rdi
   40a46:	e8 f1 19 00 00       	call   4243c <virtual_memory_map>
                break;
   40a4b:	eb 11                	jmp    40a5e <exception+0x1d1>
        for(int i = 0; i<PAGENUMBER(MEMSIZE_PHYSICAL); i++)
   40a4d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   40a51:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   40a58:	0f 8e 44 ff ff ff    	jle    409a2 <exception+0x115>
        if (r >= 0) {
            virtual_memory_map(current->p_pagetable, addr, addr,
                               PAGESIZE, PTE_P | PTE_W | PTE_U, NULL);
        }
        */
        current->p_registers.reg_rax = r;
   40a5e:	48 8b 05 9b 25 01 00 	mov    0x1259b(%rip),%rax        # 53000 <current>
   40a65:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40a68:	48 63 d2             	movslq %edx,%rdx
   40a6b:	48 89 50 08          	mov    %rdx,0x8(%rax)
        break;
   40a6f:	e9 4b 01 00 00       	jmp    40bbf <exception+0x332>
    }

    case INT_SYS_FORK:
    {
        int r = fork();
   40a74:	b8 00 00 00 00       	mov    $0x0,%eax
   40a79:	e8 c1 0f 00 00       	call   41a3f <fork>
   40a7e:	89 45 f4             	mov    %eax,-0xc(%rbp)
        break;
   40a81:	e9 39 01 00 00       	jmp    40bbf <exception+0x332>
    }

    case INT_TIMER:
        ++ticks;
   40a86:	8b 05 14 33 01 00    	mov    0x13314(%rip),%eax        # 53da0 <ticks>
   40a8c:	83 c0 01             	add    $0x1,%eax
   40a8f:	89 05 0b 33 01 00    	mov    %eax,0x1330b(%rip)        # 53da0 <ticks>
        schedule();
   40a95:	e8 4e 01 00 00       	call   40be8 <schedule>
        break;                  /* will not be reached */
   40a9a:	e9 20 01 00 00       	jmp    40bbf <exception+0x332>
    return val;
}

static inline uintptr_t rcr2(void) {
    uintptr_t val;
    asm volatile("movq %%cr2,%0" : "=r" (val));
   40a9f:	0f 20 d0             	mov    %cr2,%rax
   40aa2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    return val;
   40aa6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax

    case INT_PAGEFAULT: {
        // Analyze faulting address and access type.
        uintptr_t addr = rcr2();
   40aaa:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        const char* operation = reg->reg_err & PFERR_WRITE
   40aae:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40ab2:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40ab9:	83 e0 02             	and    $0x2,%eax
                ? "write" : "read";
   40abc:	48 85 c0             	test   %rax,%rax
   40abf:	74 09                	je     40aca <exception+0x23d>
   40ac1:	48 8d 05 f6 37 00 00 	lea    0x37f6(%rip),%rax        # 442be <console_clear+0x5f>
   40ac8:	eb 07                	jmp    40ad1 <exception+0x244>
   40aca:	48 8d 05 f3 37 00 00 	lea    0x37f3(%rip),%rax        # 442c4 <console_clear+0x65>
        const char* operation = reg->reg_err & PFERR_WRITE
   40ad1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        const char* problem = reg->reg_err & PFERR_PRESENT
   40ad5:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40ad9:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40ae0:	83 e0 01             	and    $0x1,%eax
                ? "protection problem" : "missing page";
   40ae3:	48 85 c0             	test   %rax,%rax
   40ae6:	74 09                	je     40af1 <exception+0x264>
   40ae8:	48 8d 05 da 37 00 00 	lea    0x37da(%rip),%rax        # 442c9 <console_clear+0x6a>
   40aef:	eb 07                	jmp    40af8 <exception+0x26b>
   40af1:	48 8d 05 e4 37 00 00 	lea    0x37e4(%rip),%rax        # 442dc <console_clear+0x7d>
        const char* problem = reg->reg_err & PFERR_PRESENT
   40af8:	48 89 45 c8          	mov    %rax,-0x38(%rbp)

        if (!(reg->reg_err & PFERR_USER)) {
   40afc:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40b00:	48 8b 80 90 00 00 00 	mov    0x90(%rax),%rax
   40b07:	83 e0 04             	and    $0x4,%eax
   40b0a:	48 85 c0             	test   %rax,%rax
   40b0d:	75 31                	jne    40b40 <exception+0x2b3>
            panic("Kernel page fault for %p (%s %s, rip=%p)!\n",
   40b0f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40b13:	48 8b b0 98 00 00 00 	mov    0x98(%rax),%rsi
   40b1a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   40b1e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   40b22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40b26:	49 89 f0             	mov    %rsi,%r8
   40b29:	48 89 c6             	mov    %rax,%rsi
   40b2c:	48 8d 05 bd 37 00 00 	lea    0x37bd(%rip),%rax        # 442f0 <console_clear+0x91>
   40b33:	48 89 c7             	mov    %rax,%rdi
   40b36:	b8 00 00 00 00       	mov    $0x0,%eax
   40b3b:	e8 c7 28 00 00       	call   43407 <panic>
                  addr, operation, problem, reg->reg_rip);
        }
        console_printf(CPOS(24, 0), 0x0C00,
   40b40:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40b44:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
                       "Process %d page fault for %p (%s %s, rip=%p)!\n",
                       current->p_pid, addr, operation, problem, reg->reg_rip);
   40b4b:	48 8b 05 ae 24 01 00 	mov    0x124ae(%rip),%rax        # 53000 <current>
        console_printf(CPOS(24, 0), 0x0C00,
   40b52:	8b 00                	mov    (%rax),%eax
   40b54:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
   40b58:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
   40b5c:	52                   	push   %rdx
   40b5d:	ff 75 c8             	push   -0x38(%rbp)
   40b60:	49 89 f1             	mov    %rsi,%r9
   40b63:	49 89 c8             	mov    %rcx,%r8
   40b66:	89 c1                	mov    %eax,%ecx
   40b68:	48 8d 05 b1 37 00 00 	lea    0x37b1(%rip),%rax        # 44320 <console_clear+0xc1>
   40b6f:	48 89 c2             	mov    %rax,%rdx
   40b72:	be 00 0c 00 00       	mov    $0xc00,%esi
   40b77:	bf 80 07 00 00       	mov    $0x780,%edi
   40b7c:	b8 00 00 00 00       	mov    $0x0,%eax
   40b81:	e8 16 36 00 00       	call   4419c <console_printf>
   40b86:	48 83 c4 10          	add    $0x10,%rsp
        current->p_state = P_BROKEN;
   40b8a:	48 8b 05 6f 24 01 00 	mov    0x1246f(%rip),%rax        # 53000 <current>
   40b91:	c7 80 c8 00 00 00 03 	movl   $0x3,0xc8(%rax)
   40b98:	00 00 00 
        break;
   40b9b:	eb 22                	jmp    40bbf <exception+0x332>
    }

    default:
        panic("Unexpected exception %d!\n", reg->reg_intno);
   40b9d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40ba1:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
   40ba8:	48 89 c6             	mov    %rax,%rsi
   40bab:	48 8d 05 9d 37 00 00 	lea    0x379d(%rip),%rax        # 4434f <console_clear+0xf0>
   40bb2:	48 89 c7             	mov    %rax,%rdi
   40bb5:	b8 00 00 00 00       	mov    $0x0,%eax
   40bba:	e8 48 28 00 00       	call   43407 <panic>

    }


    // Return to the current process (or run something else).
    if (current->p_state == P_RUNNABLE) {
   40bbf:	48 8b 05 3a 24 01 00 	mov    0x1243a(%rip),%rax        # 53000 <current>
   40bc6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40bcc:	83 f8 01             	cmp    $0x1,%eax
   40bcf:	75 0f                	jne    40be0 <exception+0x353>
        run(current);
   40bd1:	48 8b 05 28 24 01 00 	mov    0x12428(%rip),%rax        # 53000 <current>
   40bd8:	48 89 c7             	mov    %rax,%rdi
   40bdb:	e8 9b 00 00 00       	call   40c7b <run>
    } else {
        schedule();
   40be0:	e8 03 00 00 00       	call   40be8 <schedule>
    }
}
   40be5:	90                   	nop
   40be6:	c9                   	leave  
   40be7:	c3                   	ret    

0000000000040be8 <schedule>:

// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule(void) {
   40be8:	f3 0f 1e fa          	endbr64 
   40bec:	55                   	push   %rbp
   40bed:	48 89 e5             	mov    %rsp,%rbp
   40bf0:	48 83 ec 10          	sub    $0x10,%rsp
    pid_t pid = current->p_pid;
   40bf4:	48 8b 05 05 24 01 00 	mov    0x12405(%rip),%rax        # 53000 <current>
   40bfb:	8b 00                	mov    (%rax),%eax
   40bfd:	89 45 fc             	mov    %eax,-0x4(%rbp)
    while (1) {
        pid = (pid + 1) % NPROC;
   40c00:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40c03:	83 c0 01             	add    $0x1,%eax
   40c06:	99                   	cltd   
   40c07:	c1 ea 1c             	shr    $0x1c,%edx
   40c0a:	01 d0                	add    %edx,%eax
   40c0c:	83 e0 0f             	and    $0xf,%eax
   40c0f:	29 d0                	sub    %edx,%eax
   40c11:	89 45 fc             	mov    %eax,-0x4(%rbp)
        if (processes[pid].p_state == P_RUNNABLE) {
   40c14:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40c17:	48 63 d0             	movslq %eax,%rdx
   40c1a:	48 89 d0             	mov    %rdx,%rax
   40c1d:	48 01 c0             	add    %rax,%rax
   40c20:	48 01 d0             	add    %rdx,%rax
   40c23:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40c2a:	00 
   40c2b:	48 01 d0             	add    %rdx,%rax
   40c2e:	48 c1 e0 03          	shl    $0x3,%rax
   40c32:	48 89 c2             	mov    %rax,%rdx
   40c35:	48 8d 05 ac 24 01 00 	lea    0x124ac(%rip),%rax        # 530e8 <processes+0xc8>
   40c3c:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40c3f:	83 f8 01             	cmp    $0x1,%eax
   40c42:	75 30                	jne    40c74 <schedule+0x8c>
            run(&processes[pid]);
   40c44:	8b 45 fc             	mov    -0x4(%rbp),%eax
   40c47:	48 63 d0             	movslq %eax,%rdx
   40c4a:	48 89 d0             	mov    %rdx,%rax
   40c4d:	48 01 c0             	add    %rax,%rax
   40c50:	48 01 d0             	add    %rdx,%rax
   40c53:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40c5a:	00 
   40c5b:	48 01 d0             	add    %rdx,%rax
   40c5e:	48 c1 e0 03          	shl    $0x3,%rax
   40c62:	48 8d 15 b7 23 01 00 	lea    0x123b7(%rip),%rdx        # 53020 <processes>
   40c69:	48 01 d0             	add    %rdx,%rax
   40c6c:	48 89 c7             	mov    %rax,%rdi
   40c6f:	e8 07 00 00 00       	call   40c7b <run>
        }
        // If Control-C was typed, exit the virtual machine.
        check_keyboard();
   40c74:	e8 5e 26 00 00       	call   432d7 <check_keyboard>
        pid = (pid + 1) % NPROC;
   40c79:	eb 85                	jmp    40c00 <schedule+0x18>

0000000000040c7b <run>:
//    Run process `p`. This means reloading all the registers from
//    `p->p_registers` using the `popal`, `popl`, and `iret` instructions.
//
//    As a side effect, sets `current = p`.

void run(proc* p) {
   40c7b:	f3 0f 1e fa          	endbr64 
   40c7f:	55                   	push   %rbp
   40c80:	48 89 e5             	mov    %rsp,%rbp
   40c83:	48 83 ec 10          	sub    $0x10,%rsp
   40c87:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    assert(p->p_state == P_RUNNABLE);
   40c8b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40c8f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
   40c95:	83 f8 01             	cmp    $0x1,%eax
   40c98:	74 1e                	je     40cb8 <run+0x3d>
   40c9a:	48 8d 05 67 37 00 00 	lea    0x3767(%rip),%rax        # 44408 <console_clear+0x1a9>
   40ca1:	48 89 c2             	mov    %rax,%rdx
   40ca4:	be 83 01 00 00       	mov    $0x183,%esi
   40ca9:	48 8d 05 05 36 00 00 	lea    0x3605(%rip),%rax        # 442b5 <console_clear+0x56>
   40cb0:	48 89 c7             	mov    %rax,%rdi
   40cb3:	e8 3f 28 00 00       	call   434f7 <assert_fail>
    current = p;
   40cb8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40cbc:	48 89 05 3d 23 01 00 	mov    %rax,0x1233d(%rip)        # 53000 <current>

    // Load the process's current pagetable.
    set_pagetable(p->p_pagetable);
   40cc3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40cc7:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   40cce:	48 89 c7             	mov    %rax,%rdi
   40cd1:	e8 d4 1c 00 00       	call   429aa <set_pagetable>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(&p->p_registers);
   40cd6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40cda:	48 83 c0 08          	add    $0x8,%rax
   40cde:	48 89 c7             	mov    %rax,%rdi
   40ce1:	e8 dd f3 ff ff       	call   400c3 <exception_return>

0000000000040ce6 <pageinfo_init>:


// pageinfo_init
//    Initialize the `pageinfo[]` array.

void pageinfo_init(void) {
   40ce6:	f3 0f 1e fa          	endbr64 
   40cea:	55                   	push   %rbp
   40ceb:	48 89 e5             	mov    %rsp,%rbp
   40cee:	48 83 ec 10          	sub    $0x10,%rsp
    extern char end[];

    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   40cf2:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   40cf9:	00 
   40cfa:	e9 93 00 00 00       	jmp    40d92 <pageinfo_init+0xac>
        int owner;
        if (physical_memory_isreserved(addr)) {
   40cff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40d03:	48 89 c7             	mov    %rax,%rdi
   40d06:	e8 11 1e 00 00       	call   42b1c <physical_memory_isreserved>
   40d0b:	85 c0                	test   %eax,%eax
   40d0d:	74 09                	je     40d18 <pageinfo_init+0x32>
            owner = PO_RESERVED;
   40d0f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%rbp)
   40d16:	eb 31                	jmp    40d49 <pageinfo_init+0x63>
        } else if ((addr >= KERNEL_START_ADDR && addr < (uintptr_t) end)
   40d18:	48 81 7d f8 ff ff 03 	cmpq   $0x3ffff,-0x8(%rbp)
   40d1f:	00 
   40d20:	76 0d                	jbe    40d2f <pageinfo_init+0x49>
   40d22:	48 8d 05 e7 b2 01 00 	lea    0x1b2e7(%rip),%rax        # 5c010 <end>
   40d29:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40d2d:	72 0a                	jb     40d39 <pageinfo_init+0x53>
                   || addr == KERNEL_STACK_TOP - PAGESIZE) {
   40d2f:	48 81 7d f8 00 f0 07 	cmpq   $0x7f000,-0x8(%rbp)
   40d36:	00 
   40d37:	75 09                	jne    40d42 <pageinfo_init+0x5c>
            owner = PO_KERNEL;
   40d39:	c7 45 f4 fe ff ff ff 	movl   $0xfffffffe,-0xc(%rbp)
   40d40:	eb 07                	jmp    40d49 <pageinfo_init+0x63>
        } else {
            owner = PO_FREE;
   40d42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
        }
        pageinfo[PAGENUMBER(addr)].owner = owner;
   40d49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40d4d:	48 c1 e8 0c          	shr    $0xc,%rax
   40d51:	89 c2                	mov    %eax,%edx
   40d53:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40d56:	89 c1                	mov    %eax,%ecx
   40d58:	48 63 c2             	movslq %edx,%rax
   40d5b:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40d5f:	48 8d 05 5a 30 01 00 	lea    0x1305a(%rip),%rax        # 53dc0 <pageinfo>
   40d66:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
        pageinfo[PAGENUMBER(addr)].refcount = (owner != PO_FREE);
   40d69:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   40d6d:	0f 95 c2             	setne  %dl
   40d70:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40d74:	48 c1 e8 0c          	shr    $0xc,%rax
   40d78:	89 d1                	mov    %edx,%ecx
   40d7a:	48 98                	cltq   
   40d7c:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   40d80:	48 8d 05 3a 30 01 00 	lea    0x1303a(%rip),%rax        # 53dc1 <pageinfo+0x1>
   40d87:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   40d8a:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40d91:	00 
   40d92:	48 81 7d f8 ff ff 1f 	cmpq   $0x1fffff,-0x8(%rbp)
   40d99:	00 
   40d9a:	0f 86 5f ff ff ff    	jbe    40cff <pageinfo_init+0x19>
    }
}
   40da0:	90                   	nop
   40da1:	90                   	nop
   40da2:	c9                   	leave  
   40da3:	c3                   	ret    

0000000000040da4 <check_page_table_mappings>:

// check_page_table_mappings
//    Check operating system invariants about kernel mappings for page
//    table `pt`. Panic if any of the invariants are false.

void check_page_table_mappings(x86_64_pagetable* pt) {
   40da4:	f3 0f 1e fa          	endbr64 
   40da8:	55                   	push   %rbp
   40da9:	48 89 e5             	mov    %rsp,%rbp
   40dac:	48 83 ec 50          	sub    $0x50,%rsp
   40db0:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
    extern char start_data[], end[];
    assert(PTE_ADDR(pt) == (uintptr_t) pt);
   40db4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40db8:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40dbe:	48 89 c2             	mov    %rax,%rdx
   40dc1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40dc5:	48 39 c2             	cmp    %rax,%rdx
   40dc8:	74 1e                	je     40de8 <check_page_table_mappings+0x44>
   40dca:	48 8d 05 57 36 00 00 	lea    0x3657(%rip),%rax        # 44428 <console_clear+0x1c9>
   40dd1:	48 89 c2             	mov    %rax,%rdx
   40dd4:	be ad 01 00 00       	mov    $0x1ad,%esi
   40dd9:	48 8d 05 d5 34 00 00 	lea    0x34d5(%rip),%rax        # 442b5 <console_clear+0x56>
   40de0:	48 89 c7             	mov    %rax,%rdi
   40de3:	e8 0f 27 00 00       	call   434f7 <assert_fail>

    // kernel memory is identity mapped; data is writable
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   40de8:	48 c7 45 f8 00 00 04 	movq   $0x40000,-0x8(%rbp)
   40def:	00 
   40df0:	e9 b5 00 00 00       	jmp    40eaa <check_page_table_mappings+0x106>
         va += PAGESIZE) {
        vamapping vam = virtual_memory_lookup(pt, va);
   40df5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   40df9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   40dfd:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40e01:	48 89 ce             	mov    %rcx,%rsi
   40e04:	48 89 c7             	mov    %rax,%rdi
   40e07:	e8 aa 1a 00 00       	call   428b6 <virtual_memory_lookup>
        if (vam.pa != va) {
   40e0c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40e10:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40e14:	74 2c                	je     40e42 <check_page_table_mappings+0x9e>
            console_printf(CPOS(22, 0), 0xC000, "%p vs %p\n", va, vam.pa);
   40e16:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   40e1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   40e1e:	49 89 d0             	mov    %rdx,%r8
   40e21:	48 89 c1             	mov    %rax,%rcx
   40e24:	48 8d 05 1c 36 00 00 	lea    0x361c(%rip),%rax        # 44447 <console_clear+0x1e8>
   40e2b:	48 89 c2             	mov    %rax,%rdx
   40e2e:	be 00 c0 00 00       	mov    $0xc000,%esi
   40e33:	bf e0 06 00 00       	mov    $0x6e0,%edi
   40e38:	b8 00 00 00 00       	mov    $0x0,%eax
   40e3d:	e8 5a 33 00 00       	call   4419c <console_printf>
        }
        assert(vam.pa == va);
   40e42:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40e46:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40e4a:	74 1e                	je     40e6a <check_page_table_mappings+0xc6>
   40e4c:	48 8d 05 fe 35 00 00 	lea    0x35fe(%rip),%rax        # 44451 <console_clear+0x1f2>
   40e53:	48 89 c2             	mov    %rax,%rdx
   40e56:	be b6 01 00 00       	mov    $0x1b6,%esi
   40e5b:	48 8d 05 53 34 00 00 	lea    0x3453(%rip),%rax        # 442b5 <console_clear+0x56>
   40e62:	48 89 c7             	mov    %rax,%rdi
   40e65:	e8 8d 26 00 00       	call   434f7 <assert_fail>
        if (va >= (uintptr_t) start_data) {
   40e6a:	48 8d 05 8f 41 00 00 	lea    0x418f(%rip),%rax        # 45000 <showing.0>
   40e71:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40e75:	72 2b                	jb     40ea2 <check_page_table_mappings+0xfe>
            assert(vam.perm & PTE_W);
   40e77:	8b 45 d0             	mov    -0x30(%rbp),%eax
   40e7a:	48 98                	cltq   
   40e7c:	83 e0 02             	and    $0x2,%eax
   40e7f:	48 85 c0             	test   %rax,%rax
   40e82:	75 1e                	jne    40ea2 <check_page_table_mappings+0xfe>
   40e84:	48 8d 05 d3 35 00 00 	lea    0x35d3(%rip),%rax        # 4445e <console_clear+0x1ff>
   40e8b:	48 89 c2             	mov    %rax,%rdx
   40e8e:	be b8 01 00 00       	mov    $0x1b8,%esi
   40e93:	48 8d 05 1b 34 00 00 	lea    0x341b(%rip),%rax        # 442b5 <console_clear+0x56>
   40e9a:	48 89 c7             	mov    %rax,%rdi
   40e9d:	e8 55 26 00 00       	call   434f7 <assert_fail>
         va += PAGESIZE) {
   40ea2:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   40ea9:	00 
    for (uintptr_t va = KERNEL_START_ADDR; va < (uintptr_t) end;
   40eaa:	48 8d 05 5f b1 01 00 	lea    0x1b15f(%rip),%rax        # 5c010 <end>
   40eb1:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
   40eb5:	0f 82 3a ff ff ff    	jb     40df5 <check_page_table_mappings+0x51>
        }
    }

    // kernel stack is identity mapped and writable
    uintptr_t kstack = KERNEL_STACK_TOP - PAGESIZE;
   40ebb:	48 c7 45 f0 00 f0 07 	movq   $0x7f000,-0x10(%rbp)
   40ec2:	00 
    vamapping vam = virtual_memory_lookup(pt, kstack);
   40ec3:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   40ec7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
   40ecb:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   40ecf:	48 89 ce             	mov    %rcx,%rsi
   40ed2:	48 89 c7             	mov    %rax,%rdi
   40ed5:	e8 dc 19 00 00       	call   428b6 <virtual_memory_lookup>
    assert(vam.pa == kstack);
   40eda:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   40ede:	48 39 45 f0          	cmp    %rax,-0x10(%rbp)
   40ee2:	74 1e                	je     40f02 <check_page_table_mappings+0x15e>
   40ee4:	48 8d 05 84 35 00 00 	lea    0x3584(%rip),%rax        # 4446f <console_clear+0x210>
   40eeb:	48 89 c2             	mov    %rax,%rdx
   40eee:	be bf 01 00 00       	mov    $0x1bf,%esi
   40ef3:	48 8d 05 bb 33 00 00 	lea    0x33bb(%rip),%rax        # 442b5 <console_clear+0x56>
   40efa:	48 89 c7             	mov    %rax,%rdi
   40efd:	e8 f5 25 00 00       	call   434f7 <assert_fail>
    assert(vam.perm & PTE_W);
   40f02:	8b 45 e8             	mov    -0x18(%rbp),%eax
   40f05:	48 98                	cltq   
   40f07:	83 e0 02             	and    $0x2,%eax
   40f0a:	48 85 c0             	test   %rax,%rax
   40f0d:	75 1e                	jne    40f2d <check_page_table_mappings+0x189>
   40f0f:	48 8d 05 48 35 00 00 	lea    0x3548(%rip),%rax        # 4445e <console_clear+0x1ff>
   40f16:	48 89 c2             	mov    %rax,%rdx
   40f19:	be c0 01 00 00       	mov    $0x1c0,%esi
   40f1e:	48 8d 05 90 33 00 00 	lea    0x3390(%rip),%rax        # 442b5 <console_clear+0x56>
   40f25:	48 89 c7             	mov    %rax,%rdi
   40f28:	e8 ca 25 00 00       	call   434f7 <assert_fail>
}
   40f2d:	90                   	nop
   40f2e:	c9                   	leave  
   40f2f:	c3                   	ret    

0000000000040f30 <check_page_table_ownership>:
//    counts for page table `pt`. Panic if any of the invariants are false.

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount);

void check_page_table_ownership(x86_64_pagetable* pt, pid_t pid) {
   40f30:	f3 0f 1e fa          	endbr64 
   40f34:	55                   	push   %rbp
   40f35:	48 89 e5             	mov    %rsp,%rbp
   40f38:	48 83 ec 20          	sub    $0x20,%rsp
   40f3c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   40f40:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    // calculate expected reference count for page tables
    int owner = pid;
   40f43:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   40f46:	89 45 fc             	mov    %eax,-0x4(%rbp)
    int expected_refcount = 1;
   40f49:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
    if (pt == kernel_pagetable) {
   40f50:	48 8b 05 a9 40 01 00 	mov    0x140a9(%rip),%rax        # 55000 <kernel_pagetable>
   40f57:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
   40f5b:	0f 85 85 00 00 00    	jne    40fe6 <check_page_table_ownership+0xb6>
        owner = PO_KERNEL;
   40f61:	c7 45 fc fe ff ff ff 	movl   $0xfffffffe,-0x4(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   40f68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   40f6f:	eb 6f                	jmp    40fe0 <check_page_table_ownership+0xb0>
            if (processes[xpid].p_state != P_FREE
   40f71:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40f74:	48 63 d0             	movslq %eax,%rdx
   40f77:	48 89 d0             	mov    %rdx,%rax
   40f7a:	48 01 c0             	add    %rax,%rax
   40f7d:	48 01 d0             	add    %rdx,%rax
   40f80:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40f87:	00 
   40f88:	48 01 d0             	add    %rdx,%rax
   40f8b:	48 c1 e0 03          	shl    $0x3,%rax
   40f8f:	48 89 c2             	mov    %rax,%rdx
   40f92:	48 8d 05 4f 21 01 00 	lea    0x1214f(%rip),%rax        # 530e8 <processes+0xc8>
   40f99:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   40f9c:	85 c0                	test   %eax,%eax
   40f9e:	74 3c                	je     40fdc <check_page_table_ownership+0xac>
                && processes[xpid].p_pagetable == kernel_pagetable) {
   40fa0:	8b 45 f4             	mov    -0xc(%rbp),%eax
   40fa3:	48 63 d0             	movslq %eax,%rdx
   40fa6:	48 89 d0             	mov    %rdx,%rax
   40fa9:	48 01 c0             	add    %rax,%rax
   40fac:	48 01 d0             	add    %rdx,%rax
   40faf:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   40fb6:	00 
   40fb7:	48 01 d0             	add    %rdx,%rax
   40fba:	48 c1 e0 03          	shl    $0x3,%rax
   40fbe:	48 89 c2             	mov    %rax,%rdx
   40fc1:	48 8d 05 28 21 01 00 	lea    0x12128(%rip),%rax        # 530f0 <processes+0xd0>
   40fc8:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   40fcc:	48 8b 05 2d 40 01 00 	mov    0x1402d(%rip),%rax        # 55000 <kernel_pagetable>
   40fd3:	48 39 c2             	cmp    %rax,%rdx
   40fd6:	75 04                	jne    40fdc <check_page_table_ownership+0xac>
                ++expected_refcount;
   40fd8:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
        for (int xpid = 0; xpid < NPROC; ++xpid) {
   40fdc:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   40fe0:	83 7d f4 0f          	cmpl   $0xf,-0xc(%rbp)
   40fe4:	7e 8b                	jle    40f71 <check_page_table_ownership+0x41>
            }
        }
    }
    check_page_table_ownership_level(pt, 0, owner, expected_refcount);
   40fe6:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   40fe9:	8b 55 fc             	mov    -0x4(%rbp),%edx
   40fec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   40ff0:	be 00 00 00 00       	mov    $0x0,%esi
   40ff5:	48 89 c7             	mov    %rax,%rdi
   40ff8:	e8 03 00 00 00       	call   41000 <check_page_table_ownership_level>
}
   40ffd:	90                   	nop
   40ffe:	c9                   	leave  
   40fff:	c3                   	ret    

0000000000041000 <check_page_table_ownership_level>:

static void check_page_table_ownership_level(x86_64_pagetable* pt, int level,
                                             int owner, int refcount) {
   41000:	f3 0f 1e fa          	endbr64 
   41004:	55                   	push   %rbp
   41005:	48 89 e5             	mov    %rsp,%rbp
   41008:	48 83 ec 30          	sub    $0x30,%rsp
   4100c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   41010:	89 75 e4             	mov    %esi,-0x1c(%rbp)
   41013:	89 55 e0             	mov    %edx,-0x20(%rbp)
   41016:	89 4d dc             	mov    %ecx,-0x24(%rbp)
    assert(PAGENUMBER(pt) < NPAGES);
   41019:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4101d:	48 c1 e8 0c          	shr    $0xc,%rax
   41021:	3d ff 01 00 00       	cmp    $0x1ff,%eax
   41026:	7e 1e                	jle    41046 <check_page_table_ownership_level+0x46>
   41028:	48 8d 05 51 34 00 00 	lea    0x3451(%rip),%rax        # 44480 <console_clear+0x221>
   4102f:	48 89 c2             	mov    %rax,%rdx
   41032:	be dd 01 00 00       	mov    $0x1dd,%esi
   41037:	48 8d 05 77 32 00 00 	lea    0x3277(%rip),%rax        # 442b5 <console_clear+0x56>
   4103e:	48 89 c7             	mov    %rax,%rdi
   41041:	e8 b1 24 00 00       	call   434f7 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].owner == owner);
   41046:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4104a:	48 c1 e8 0c          	shr    $0xc,%rax
   4104e:	48 98                	cltq   
   41050:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41054:	48 8d 05 65 2d 01 00 	lea    0x12d65(%rip),%rax        # 53dc0 <pageinfo>
   4105b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4105f:	0f be c0             	movsbl %al,%eax
   41062:	39 45 e0             	cmp    %eax,-0x20(%rbp)
   41065:	74 1e                	je     41085 <check_page_table_ownership_level+0x85>
   41067:	48 8d 05 2a 34 00 00 	lea    0x342a(%rip),%rax        # 44498 <console_clear+0x239>
   4106e:	48 89 c2             	mov    %rax,%rdx
   41071:	be de 01 00 00       	mov    $0x1de,%esi
   41076:	48 8d 05 38 32 00 00 	lea    0x3238(%rip),%rax        # 442b5 <console_clear+0x56>
   4107d:	48 89 c7             	mov    %rax,%rdi
   41080:	e8 72 24 00 00       	call   434f7 <assert_fail>
    assert(pageinfo[PAGENUMBER(pt)].refcount == refcount);
   41085:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41089:	48 c1 e8 0c          	shr    $0xc,%rax
   4108d:	48 98                	cltq   
   4108f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41093:	48 8d 05 27 2d 01 00 	lea    0x12d27(%rip),%rax        # 53dc1 <pageinfo+0x1>
   4109a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4109e:	0f be c0             	movsbl %al,%eax
   410a1:	39 45 dc             	cmp    %eax,-0x24(%rbp)
   410a4:	74 1e                	je     410c4 <check_page_table_ownership_level+0xc4>
   410a6:	48 8d 05 13 34 00 00 	lea    0x3413(%rip),%rax        # 444c0 <console_clear+0x261>
   410ad:	48 89 c2             	mov    %rax,%rdx
   410b0:	be df 01 00 00       	mov    $0x1df,%esi
   410b5:	48 8d 05 f9 31 00 00 	lea    0x31f9(%rip),%rax        # 442b5 <console_clear+0x56>
   410bc:	48 89 c7             	mov    %rax,%rdi
   410bf:	e8 33 24 00 00       	call   434f7 <assert_fail>
    if (level < 3) {
   410c4:	83 7d e4 02          	cmpl   $0x2,-0x1c(%rbp)
   410c8:	7f 5b                	jg     41125 <check_page_table_ownership_level+0x125>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   410ca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   410d1:	eb 49                	jmp    4111c <check_page_table_ownership_level+0x11c>
            if (pt->entry[index]) {
   410d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   410d7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   410da:	48 63 d2             	movslq %edx,%rdx
   410dd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   410e1:	48 85 c0             	test   %rax,%rax
   410e4:	74 32                	je     41118 <check_page_table_ownership_level+0x118>
                x86_64_pagetable* nextpt =
                    (x86_64_pagetable*) PTE_ADDR(pt->entry[index]);
   410e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   410ea:	8b 55 fc             	mov    -0x4(%rbp),%edx
   410ed:	48 63 d2             	movslq %edx,%rdx
   410f0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   410f4:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
                x86_64_pagetable* nextpt =
   410fa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
                check_page_table_ownership_level(nextpt, level + 1, owner, 1);
   410fe:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41101:	8d 70 01             	lea    0x1(%rax),%esi
   41104:	8b 55 e0             	mov    -0x20(%rbp),%edx
   41107:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4110b:	b9 01 00 00 00       	mov    $0x1,%ecx
   41110:	48 89 c7             	mov    %rax,%rdi
   41113:	e8 e8 fe ff ff       	call   41000 <check_page_table_ownership_level>
        for (int index = 0; index < NPAGETABLEENTRIES; ++index) {
   41118:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4111c:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41123:	7e ae                	jle    410d3 <check_page_table_ownership_level+0xd3>
            }
        }
    }
}
   41125:	90                   	nop
   41126:	c9                   	leave  
   41127:	c3                   	ret    

0000000000041128 <check_virtual_memory>:

// check_virtual_memory
//    Check operating system invariants about virtual memory. Panic if any
//    of the invariants are false.

void check_virtual_memory(void) {
   41128:	f3 0f 1e fa          	endbr64 
   4112c:	55                   	push   %rbp
   4112d:	48 89 e5             	mov    %rsp,%rbp
   41130:	48 83 ec 10          	sub    $0x10,%rsp
    // Process 0 must never be used.
    assert(processes[0].p_state == P_FREE);
   41134:	8b 05 ae 1f 01 00    	mov    0x11fae(%rip),%eax        # 530e8 <processes+0xc8>
   4113a:	85 c0                	test   %eax,%eax
   4113c:	74 1e                	je     4115c <check_virtual_memory+0x34>
   4113e:	48 8d 05 ab 33 00 00 	lea    0x33ab(%rip),%rax        # 444f0 <console_clear+0x291>
   41145:	48 89 c2             	mov    %rax,%rdx
   41148:	be f2 01 00 00       	mov    $0x1f2,%esi
   4114d:	48 8d 05 61 31 00 00 	lea    0x3161(%rip),%rax        # 442b5 <console_clear+0x56>
   41154:	48 89 c7             	mov    %rax,%rdi
   41157:	e8 9b 23 00 00       	call   434f7 <assert_fail>
    // that don't have their own page tables.
    // Active processes have their own page tables. A process page table
    // should be owned by that process and have reference count 1.
    // All level-2-4 page tables must have reference count 1.

    check_page_table_mappings(kernel_pagetable);
   4115c:	48 8b 05 9d 3e 01 00 	mov    0x13e9d(%rip),%rax        # 55000 <kernel_pagetable>
   41163:	48 89 c7             	mov    %rax,%rdi
   41166:	e8 39 fc ff ff       	call   40da4 <check_page_table_mappings>
    check_page_table_ownership(kernel_pagetable, -1);
   4116b:	48 8b 05 8e 3e 01 00 	mov    0x13e8e(%rip),%rax        # 55000 <kernel_pagetable>
   41172:	be ff ff ff ff       	mov    $0xffffffff,%esi
   41177:	48 89 c7             	mov    %rax,%rdi
   4117a:	e8 b1 fd ff ff       	call   40f30 <check_page_table_ownership>

    for (int pid = 0; pid < NPROC; ++pid) {
   4117f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41186:	e9 dc 00 00 00       	jmp    41267 <check_virtual_memory+0x13f>
        if (processes[pid].p_state != P_FREE
   4118b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4118e:	48 63 d0             	movslq %eax,%rdx
   41191:	48 89 d0             	mov    %rdx,%rax
   41194:	48 01 c0             	add    %rax,%rax
   41197:	48 01 d0             	add    %rdx,%rax
   4119a:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   411a1:	00 
   411a2:	48 01 d0             	add    %rdx,%rax
   411a5:	48 c1 e0 03          	shl    $0x3,%rax
   411a9:	48 89 c2             	mov    %rax,%rdx
   411ac:	48 8d 05 35 1f 01 00 	lea    0x11f35(%rip),%rax        # 530e8 <processes+0xc8>
   411b3:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   411b6:	85 c0                	test   %eax,%eax
   411b8:	0f 84 a5 00 00 00    	je     41263 <check_virtual_memory+0x13b>
            && processes[pid].p_pagetable != kernel_pagetable) {
   411be:	8b 45 fc             	mov    -0x4(%rbp),%eax
   411c1:	48 63 d0             	movslq %eax,%rdx
   411c4:	48 89 d0             	mov    %rdx,%rax
   411c7:	48 01 c0             	add    %rax,%rax
   411ca:	48 01 d0             	add    %rdx,%rax
   411cd:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   411d4:	00 
   411d5:	48 01 d0             	add    %rdx,%rax
   411d8:	48 c1 e0 03          	shl    $0x3,%rax
   411dc:	48 89 c2             	mov    %rax,%rdx
   411df:	48 8d 05 0a 1f 01 00 	lea    0x11f0a(%rip),%rax        # 530f0 <processes+0xd0>
   411e6:	48 8b 14 02          	mov    (%rdx,%rax,1),%rdx
   411ea:	48 8b 05 0f 3e 01 00 	mov    0x13e0f(%rip),%rax        # 55000 <kernel_pagetable>
   411f1:	48 39 c2             	cmp    %rax,%rdx
   411f4:	74 6d                	je     41263 <check_virtual_memory+0x13b>
            check_page_table_mappings(processes[pid].p_pagetable);
   411f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
   411f9:	48 63 d0             	movslq %eax,%rdx
   411fc:	48 89 d0             	mov    %rdx,%rax
   411ff:	48 01 c0             	add    %rax,%rax
   41202:	48 01 d0             	add    %rdx,%rax
   41205:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   4120c:	00 
   4120d:	48 01 d0             	add    %rdx,%rax
   41210:	48 c1 e0 03          	shl    $0x3,%rax
   41214:	48 89 c2             	mov    %rax,%rdx
   41217:	48 8d 05 d2 1e 01 00 	lea    0x11ed2(%rip),%rax        # 530f0 <processes+0xd0>
   4121e:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   41222:	48 89 c7             	mov    %rax,%rdi
   41225:	e8 7a fb ff ff       	call   40da4 <check_page_table_mappings>
            check_page_table_ownership(processes[pid].p_pagetable, pid);
   4122a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4122d:	48 63 d0             	movslq %eax,%rdx
   41230:	48 89 d0             	mov    %rdx,%rax
   41233:	48 01 c0             	add    %rax,%rax
   41236:	48 01 d0             	add    %rdx,%rax
   41239:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41240:	00 
   41241:	48 01 d0             	add    %rdx,%rax
   41244:	48 c1 e0 03          	shl    $0x3,%rax
   41248:	48 89 c2             	mov    %rax,%rdx
   4124b:	48 8d 05 9e 1e 01 00 	lea    0x11e9e(%rip),%rax        # 530f0 <processes+0xd0>
   41252:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   41256:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41259:	89 d6                	mov    %edx,%esi
   4125b:	48 89 c7             	mov    %rax,%rdi
   4125e:	e8 cd fc ff ff       	call   40f30 <check_page_table_ownership>
    for (int pid = 0; pid < NPROC; ++pid) {
   41263:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41267:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   4126b:	0f 8e 1a ff ff ff    	jle    4118b <check_virtual_memory+0x63>
        }
    }

    // Check that all referenced pages refer to active processes
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41271:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   41278:	e9 95 00 00 00       	jmp    41312 <check_virtual_memory+0x1ea>
        if (pageinfo[pn].refcount > 0 && pageinfo[pn].owner >= 0) {
   4127d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41280:	48 98                	cltq   
   41282:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41286:	48 8d 05 34 2b 01 00 	lea    0x12b34(%rip),%rax        # 53dc1 <pageinfo+0x1>
   4128d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41291:	84 c0                	test   %al,%al
   41293:	7e 79                	jle    4130e <check_virtual_memory+0x1e6>
   41295:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41298:	48 98                	cltq   
   4129a:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4129e:	48 8d 05 1b 2b 01 00 	lea    0x12b1b(%rip),%rax        # 53dc0 <pageinfo>
   412a5:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   412a9:	84 c0                	test   %al,%al
   412ab:	78 61                	js     4130e <check_virtual_memory+0x1e6>
            assert(processes[pageinfo[pn].owner].p_state != P_FREE);
   412ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
   412b0:	48 98                	cltq   
   412b2:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   412b6:	48 8d 05 03 2b 01 00 	lea    0x12b03(%rip),%rax        # 53dc0 <pageinfo>
   412bd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   412c1:	0f be c0             	movsbl %al,%eax
   412c4:	48 63 d0             	movslq %eax,%rdx
   412c7:	48 89 d0             	mov    %rdx,%rax
   412ca:	48 01 c0             	add    %rax,%rax
   412cd:	48 01 d0             	add    %rdx,%rax
   412d0:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   412d7:	00 
   412d8:	48 01 d0             	add    %rdx,%rax
   412db:	48 c1 e0 03          	shl    $0x3,%rax
   412df:	48 89 c2             	mov    %rax,%rdx
   412e2:	48 8d 05 ff 1d 01 00 	lea    0x11dff(%rip),%rax        # 530e8 <processes+0xc8>
   412e9:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   412ec:	85 c0                	test   %eax,%eax
   412ee:	75 1e                	jne    4130e <check_virtual_memory+0x1e6>
   412f0:	48 8d 05 19 32 00 00 	lea    0x3219(%rip),%rax        # 44510 <console_clear+0x2b1>
   412f7:	48 89 c2             	mov    %rax,%rdx
   412fa:	be 09 02 00 00       	mov    $0x209,%esi
   412ff:	48 8d 05 af 2f 00 00 	lea    0x2faf(%rip),%rax        # 442b5 <console_clear+0x56>
   41306:	48 89 c7             	mov    %rax,%rdi
   41309:	e8 e9 21 00 00       	call   434f7 <assert_fail>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4130e:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41312:	81 7d f8 ff 01 00 00 	cmpl   $0x1ff,-0x8(%rbp)
   41319:	0f 8e 5e ff ff ff    	jle    4127d <check_virtual_memory+0x155>
        }
    }
}
   4131f:	90                   	nop
   41320:	90                   	nop
   41321:	c9                   	leave  
   41322:	c3                   	ret    

0000000000041323 <memshow_physical>:
    '6' | 0x0C00, '7' | 0x0A00, '8' | 0x0900, '9' | 0x0E00,
    'A' | 0x0F00, 'B' | 0x0C00, 'C' | 0x0A00, 'D' | 0x0900,
    'E' | 0x0E00, 'F' | 0x0F00
};

void memshow_physical(void) {
   41323:	f3 0f 1e fa          	endbr64 
   41327:	55                   	push   %rbp
   41328:	48 89 e5             	mov    %rsp,%rbp
   4132b:	48 83 ec 10          	sub    $0x10,%rsp
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY");
   4132f:	48 8d 05 2e 32 00 00 	lea    0x322e(%rip),%rax        # 44564 <memstate_colors+0x24>
   41336:	48 89 c2             	mov    %rax,%rdx
   41339:	be 00 0f 00 00       	mov    $0xf00,%esi
   4133e:	bf 20 00 00 00       	mov    $0x20,%edi
   41343:	b8 00 00 00 00       	mov    $0x0,%eax
   41348:	e8 4f 2e 00 00       	call   4419c <console_printf>
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4134d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   41354:	e9 05 01 00 00       	jmp    4145e <memshow_physical+0x13b>
        if (pn % 64 == 0) {
   41359:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4135c:	83 e0 3f             	and    $0x3f,%eax
   4135f:	85 c0                	test   %eax,%eax
   41361:	75 40                	jne    413a3 <memshow_physical+0x80>
            console_printf(CPOS(1 + pn / 64, 3), 0x0F00, "0x%06X ", pn << 12);
   41363:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41366:	c1 e0 0c             	shl    $0xc,%eax
   41369:	89 c2                	mov    %eax,%edx
   4136b:	8b 45 fc             	mov    -0x4(%rbp),%eax
   4136e:	8d 48 3f             	lea    0x3f(%rax),%ecx
   41371:	85 c0                	test   %eax,%eax
   41373:	0f 48 c1             	cmovs  %ecx,%eax
   41376:	c1 f8 06             	sar    $0x6,%eax
   41379:	8d 48 01             	lea    0x1(%rax),%ecx
   4137c:	89 c8                	mov    %ecx,%eax
   4137e:	c1 e0 02             	shl    $0x2,%eax
   41381:	01 c8                	add    %ecx,%eax
   41383:	c1 e0 04             	shl    $0x4,%eax
   41386:	83 c0 03             	add    $0x3,%eax
   41389:	89 d1                	mov    %edx,%ecx
   4138b:	48 8d 15 e2 31 00 00 	lea    0x31e2(%rip),%rdx        # 44574 <memstate_colors+0x34>
   41392:	be 00 0f 00 00       	mov    $0xf00,%esi
   41397:	89 c7                	mov    %eax,%edi
   41399:	b8 00 00 00 00       	mov    $0x0,%eax
   4139e:	e8 f9 2d 00 00       	call   4419c <console_printf>
        }

        int owner = pageinfo[pn].owner;
   413a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413a6:	48 98                	cltq   
   413a8:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   413ac:	48 8d 05 0d 2a 01 00 	lea    0x12a0d(%rip),%rax        # 53dc0 <pageinfo>
   413b3:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   413b7:	0f be c0             	movsbl %al,%eax
   413ba:	89 45 f8             	mov    %eax,-0x8(%rbp)
        if (pageinfo[pn].refcount == 0) {
   413bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413c0:	48 98                	cltq   
   413c2:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   413c6:	48 8d 05 f4 29 01 00 	lea    0x129f4(%rip),%rax        # 53dc1 <pageinfo+0x1>
   413cd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   413d1:	84 c0                	test   %al,%al
   413d3:	75 07                	jne    413dc <memshow_physical+0xb9>
            owner = PO_FREE;
   413d5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
        }
        uint16_t color = memstate_colors[owner - PO_KERNEL];
   413dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
   413df:	83 c0 02             	add    $0x2,%eax
   413e2:	48 98                	cltq   
   413e4:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   413e8:	48 8d 05 51 31 00 00 	lea    0x3151(%rip),%rax        # 44540 <memstate_colors>
   413ef:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   413f3:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
        // darker color for shared pages
        if (pageinfo[pn].refcount > 1) {
   413f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   413fa:	48 98                	cltq   
   413fc:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41400:	48 8d 05 ba 29 01 00 	lea    0x129ba(%rip),%rax        # 53dc1 <pageinfo+0x1>
   41407:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4140b:	3c 01                	cmp    $0x1,%al
   4140d:	7e 06                	jle    41415 <memshow_physical+0xf2>
            color &= 0x77FF;
   4140f:	66 81 65 f6 ff 77    	andw   $0x77ff,-0xa(%rbp)
        }

        console[CPOS(1 + pn / 64, 12 + pn % 64)] = color;
   41415:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41418:	8d 50 3f             	lea    0x3f(%rax),%edx
   4141b:	85 c0                	test   %eax,%eax
   4141d:	0f 48 c2             	cmovs  %edx,%eax
   41420:	c1 f8 06             	sar    $0x6,%eax
   41423:	8d 50 01             	lea    0x1(%rax),%edx
   41426:	89 d0                	mov    %edx,%eax
   41428:	c1 e0 02             	shl    $0x2,%eax
   4142b:	01 d0                	add    %edx,%eax
   4142d:	c1 e0 04             	shl    $0x4,%eax
   41430:	89 c1                	mov    %eax,%ecx
   41432:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41435:	99                   	cltd   
   41436:	c1 ea 1a             	shr    $0x1a,%edx
   41439:	01 d0                	add    %edx,%eax
   4143b:	83 e0 3f             	and    $0x3f,%eax
   4143e:	29 d0                	sub    %edx,%eax
   41440:	83 c0 0c             	add    $0xc,%eax
   41443:	01 c8                	add    %ecx,%eax
   41445:	48 98                	cltq   
   41447:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   4144b:	48 8d 15 ae 6b 07 00 	lea    0x76bae(%rip),%rdx        # b8000 <console>
   41452:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41456:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   4145a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   4145e:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41465:	0f 8e ee fe ff ff    	jle    41359 <memshow_physical+0x36>
    }
}
   4146b:	90                   	nop
   4146c:	90                   	nop
   4146d:	c9                   	leave  
   4146e:	c3                   	ret    

000000000004146f <memshow_virtual>:

// memshow_virtual(pagetable, name)
//    Draw a picture of the virtual memory map `pagetable` (named `name`) on
//    the CGA console.

void memshow_virtual(x86_64_pagetable* pagetable, const char* name) {
   4146f:	f3 0f 1e fa          	endbr64 
   41473:	55                   	push   %rbp
   41474:	48 89 e5             	mov    %rsp,%rbp
   41477:	48 83 ec 40          	sub    $0x40,%rsp
   4147b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4147f:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    assert((uintptr_t) pagetable == PTE_ADDR(pagetable));
   41483:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41487:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4148d:	48 89 c2             	mov    %rax,%rdx
   41490:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41494:	48 39 c2             	cmp    %rax,%rdx
   41497:	74 1e                	je     414b7 <memshow_virtual+0x48>
   41499:	48 8d 05 e0 30 00 00 	lea    0x30e0(%rip),%rax        # 44580 <memstate_colors+0x40>
   414a0:	48 89 c2             	mov    %rax,%rdx
   414a3:	be 35 02 00 00       	mov    $0x235,%esi
   414a8:	48 8d 05 06 2e 00 00 	lea    0x2e06(%rip),%rax        # 442b5 <console_clear+0x56>
   414af:	48 89 c7             	mov    %rax,%rdi
   414b2:	e8 40 20 00 00       	call   434f7 <assert_fail>

    console_printf(CPOS(10, 26), 0x0F00, "VIRTUAL ADDRESS SPACE FOR %s", name);
   414b7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   414bb:	48 89 c1             	mov    %rax,%rcx
   414be:	48 8d 05 e8 30 00 00 	lea    0x30e8(%rip),%rax        # 445ad <memstate_colors+0x6d>
   414c5:	48 89 c2             	mov    %rax,%rdx
   414c8:	be 00 0f 00 00       	mov    $0xf00,%esi
   414cd:	bf 3a 03 00 00       	mov    $0x33a,%edi
   414d2:	b8 00 00 00 00       	mov    $0x0,%eax
   414d7:	e8 c0 2c 00 00       	call   4419c <console_printf>
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   414dc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   414e3:	00 
   414e4:	e9 85 01 00 00       	jmp    4166e <memshow_virtual+0x1ff>
        vamapping vam = virtual_memory_lookup(pagetable, va);
   414e9:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   414ed:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   414f1:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   414f5:	48 89 ce             	mov    %rcx,%rsi
   414f8:	48 89 c7             	mov    %rax,%rdi
   414fb:	e8 b6 13 00 00       	call   428b6 <virtual_memory_lookup>
        uint16_t color;
        if (vam.pn < 0) {
   41500:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41503:	85 c0                	test   %eax,%eax
   41505:	79 0b                	jns    41512 <memshow_virtual+0xa3>
            color = ' ';
   41507:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%rbp)
   4150d:	e9 d0 00 00 00       	jmp    415e2 <memshow_virtual+0x173>
        } else {
            assert(vam.pa < MEMSIZE_PHYSICAL);
   41512:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41516:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   4151c:	76 1e                	jbe    4153c <memshow_virtual+0xcd>
   4151e:	48 8d 05 a5 30 00 00 	lea    0x30a5(%rip),%rax        # 445ca <memstate_colors+0x8a>
   41525:	48 89 c2             	mov    %rax,%rdx
   41528:	be 3e 02 00 00       	mov    $0x23e,%esi
   4152d:	48 8d 05 81 2d 00 00 	lea    0x2d81(%rip),%rax        # 442b5 <console_clear+0x56>
   41534:	48 89 c7             	mov    %rax,%rdi
   41537:	e8 bb 1f 00 00       	call   434f7 <assert_fail>
            int owner = pageinfo[vam.pn].owner;
   4153c:	8b 45 d0             	mov    -0x30(%rbp),%eax
   4153f:	48 98                	cltq   
   41541:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41545:	48 8d 05 74 28 01 00 	lea    0x12874(%rip),%rax        # 53dc0 <pageinfo>
   4154c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41550:	0f be c0             	movsbl %al,%eax
   41553:	89 45 f0             	mov    %eax,-0x10(%rbp)
            if (pageinfo[vam.pn].refcount == 0) {
   41556:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41559:	48 98                	cltq   
   4155b:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4155f:	48 8d 05 5b 28 01 00 	lea    0x1285b(%rip),%rax        # 53dc1 <pageinfo+0x1>
   41566:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4156a:	84 c0                	test   %al,%al
   4156c:	75 07                	jne    41575 <memshow_virtual+0x106>
                owner = PO_FREE;
   4156e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
            }
            color = memstate_colors[owner - PO_KERNEL];
   41575:	8b 45 f0             	mov    -0x10(%rbp),%eax
   41578:	83 c0 02             	add    $0x2,%eax
   4157b:	48 98                	cltq   
   4157d:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41581:	48 8d 05 b8 2f 00 00 	lea    0x2fb8(%rip),%rax        # 44540 <memstate_colors>
   41588:	0f b7 04 02          	movzwl (%rdx,%rax,1),%eax
   4158c:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            // reverse video for user-accessible pages
            if (vam.perm & PTE_U) {
   41590:	8b 45 e0             	mov    -0x20(%rbp),%eax
   41593:	48 98                	cltq   
   41595:	83 e0 04             	and    $0x4,%eax
   41598:	48 85 c0             	test   %rax,%rax
   4159b:	74 27                	je     415c4 <memshow_virtual+0x155>
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   4159d:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   415a1:	c1 e0 04             	shl    $0x4,%eax
   415a4:	66 25 00 f0          	and    $0xf000,%ax
   415a8:	89 c2                	mov    %eax,%edx
   415aa:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   415ae:	c1 f8 04             	sar    $0x4,%eax
   415b1:	66 25 00 0f          	and    $0xf00,%ax
   415b5:	09 c2                	or     %eax,%edx
                    | (color & 0x00FF);
   415b7:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   415bb:	0f b6 c0             	movzbl %al,%eax
   415be:	09 d0                	or     %edx,%eax
                color = ((color & 0x0F00) << 4) | ((color & 0xF000) >> 4)
   415c0:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
            }
            // darker color for shared pages
            if (pageinfo[vam.pn].refcount > 1) {
   415c4:	8b 45 d0             	mov    -0x30(%rbp),%eax
   415c7:	48 98                	cltq   
   415c9:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   415cd:	48 8d 05 ed 27 01 00 	lea    0x127ed(%rip),%rax        # 53dc1 <pageinfo+0x1>
   415d4:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   415d8:	3c 01                	cmp    $0x1,%al
   415da:	7e 06                	jle    415e2 <memshow_virtual+0x173>
                color &= 0x77FF;
   415dc:	66 81 65 f6 ff 77    	andw   $0x77ff,-0xa(%rbp)
            }
        }
        uint32_t pn = PAGENUMBER(va);
   415e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   415e6:	48 c1 e8 0c          	shr    $0xc,%rax
   415ea:	89 45 ec             	mov    %eax,-0x14(%rbp)
        if (pn % 64 == 0) {
   415ed:	8b 45 ec             	mov    -0x14(%rbp),%eax
   415f0:	83 e0 3f             	and    $0x3f,%eax
   415f3:	85 c0                	test   %eax,%eax
   415f5:	75 39                	jne    41630 <memshow_virtual+0x1c1>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00, "0x%06X ", va);
   415f7:	8b 45 ec             	mov    -0x14(%rbp),%eax
   415fa:	c1 e8 06             	shr    $0x6,%eax
   415fd:	89 c2                	mov    %eax,%edx
   415ff:	89 d0                	mov    %edx,%eax
   41601:	c1 e0 02             	shl    $0x2,%eax
   41604:	01 d0                	add    %edx,%eax
   41606:	c1 e0 04             	shl    $0x4,%eax
   41609:	05 73 03 00 00       	add    $0x373,%eax
   4160e:	89 c7                	mov    %eax,%edi
   41610:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41614:	48 89 c1             	mov    %rax,%rcx
   41617:	48 8d 05 56 2f 00 00 	lea    0x2f56(%rip),%rax        # 44574 <memstate_colors+0x34>
   4161e:	48 89 c2             	mov    %rax,%rdx
   41621:	be 00 0f 00 00       	mov    $0xf00,%esi
   41626:	b8 00 00 00 00       	mov    $0x0,%eax
   4162b:	e8 6c 2b 00 00       	call   4419c <console_printf>
        }
        console[CPOS(11 + pn / 64, 12 + pn % 64)] = color;
   41630:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41633:	c1 e8 06             	shr    $0x6,%eax
   41636:	89 c2                	mov    %eax,%edx
   41638:	89 d0                	mov    %edx,%eax
   4163a:	c1 e0 02             	shl    $0x2,%eax
   4163d:	01 d0                	add    %edx,%eax
   4163f:	c1 e0 04             	shl    $0x4,%eax
   41642:	89 c2                	mov    %eax,%edx
   41644:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41647:	83 e0 3f             	and    $0x3f,%eax
   4164a:	01 d0                	add    %edx,%eax
   4164c:	05 7c 03 00 00       	add    $0x37c,%eax
   41651:	89 c0                	mov    %eax,%eax
   41653:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   41657:	48 8d 15 a2 69 07 00 	lea    0x769a2(%rip),%rdx        # b8000 <console>
   4165e:	0f b7 45 f6          	movzwl -0xa(%rbp),%eax
   41662:	66 89 04 11          	mov    %ax,(%rcx,%rdx,1)
    for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41666:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4166d:	00 
   4166e:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41675:	00 
   41676:	0f 86 6d fe ff ff    	jbe    414e9 <memshow_virtual+0x7a>
    }
}
   4167c:	90                   	nop
   4167d:	90                   	nop
   4167e:	c9                   	leave  
   4167f:	c3                   	ret    

0000000000041680 <memshow_virtual_animate>:

// memshow_virtual_animate
//    Draw a picture of process virtual memory maps on the CGA console.
//    Starts with process 1, then switches to a new process every 0.25 sec.

void memshow_virtual_animate(void) {
   41680:	f3 0f 1e fa          	endbr64 
   41684:	55                   	push   %rbp
   41685:	48 89 e5             	mov    %rsp,%rbp
   41688:	48 83 ec 10          	sub    $0x10,%rsp
    static unsigned last_ticks = 0;
    static int showing = 1;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   4168c:	8b 05 2e 2b 01 00    	mov    0x12b2e(%rip),%eax        # 541c0 <last_ticks.1>
   41692:	85 c0                	test   %eax,%eax
   41694:	74 13                	je     416a9 <memshow_virtual_animate+0x29>
   41696:	8b 05 04 27 01 00    	mov    0x12704(%rip),%eax        # 53da0 <ticks>
   4169c:	8b 15 1e 2b 01 00    	mov    0x12b1e(%rip),%edx        # 541c0 <last_ticks.1>
   416a2:	29 d0                	sub    %edx,%eax
   416a4:	83 f8 31             	cmp    $0x31,%eax
   416a7:	76 2c                	jbe    416d5 <memshow_virtual_animate+0x55>
        last_ticks = ticks;
   416a9:	8b 05 f1 26 01 00    	mov    0x126f1(%rip),%eax        # 53da0 <ticks>
   416af:	89 05 0b 2b 01 00    	mov    %eax,0x12b0b(%rip)        # 541c0 <last_ticks.1>
        ++showing;
   416b5:	8b 05 45 39 00 00    	mov    0x3945(%rip),%eax        # 45000 <showing.0>
   416bb:	83 c0 01             	add    $0x1,%eax
   416be:	89 05 3c 39 00 00    	mov    %eax,0x393c(%rip)        # 45000 <showing.0>
    }

    // the current process may have died -- don't display it if so
    while (showing <= 2*NPROC
   416c4:	eb 0f                	jmp    416d5 <memshow_virtual_animate+0x55>
           && processes[showing % NPROC].p_state == P_FREE) {
        ++showing;
   416c6:	8b 05 34 39 00 00    	mov    0x3934(%rip),%eax        # 45000 <showing.0>
   416cc:	83 c0 01             	add    $0x1,%eax
   416cf:	89 05 2b 39 00 00    	mov    %eax,0x392b(%rip)        # 45000 <showing.0>
    while (showing <= 2*NPROC
   416d5:	8b 05 25 39 00 00    	mov    0x3925(%rip),%eax        # 45000 <showing.0>
           && processes[showing % NPROC].p_state == P_FREE) {
   416db:	83 f8 20             	cmp    $0x20,%eax
   416de:	7f 3d                	jg     4171d <memshow_virtual_animate+0x9d>
   416e0:	8b 05 1a 39 00 00    	mov    0x391a(%rip),%eax        # 45000 <showing.0>
   416e6:	99                   	cltd   
   416e7:	c1 ea 1c             	shr    $0x1c,%edx
   416ea:	01 d0                	add    %edx,%eax
   416ec:	83 e0 0f             	and    $0xf,%eax
   416ef:	29 d0                	sub    %edx,%eax
   416f1:	48 63 d0             	movslq %eax,%rdx
   416f4:	48 89 d0             	mov    %rdx,%rax
   416f7:	48 01 c0             	add    %rax,%rax
   416fa:	48 01 d0             	add    %rdx,%rax
   416fd:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41704:	00 
   41705:	48 01 d0             	add    %rdx,%rax
   41708:	48 c1 e0 03          	shl    $0x3,%rax
   4170c:	48 89 c2             	mov    %rax,%rdx
   4170f:	48 8d 05 d2 19 01 00 	lea    0x119d2(%rip),%rax        # 530e8 <processes+0xc8>
   41716:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41719:	85 c0                	test   %eax,%eax
   4171b:	74 a9                	je     416c6 <memshow_virtual_animate+0x46>
    }
    showing = showing % NPROC;
   4171d:	8b 05 dd 38 00 00    	mov    0x38dd(%rip),%eax        # 45000 <showing.0>
   41723:	99                   	cltd   
   41724:	c1 ea 1c             	shr    $0x1c,%edx
   41727:	01 d0                	add    %edx,%eax
   41729:	83 e0 0f             	and    $0xf,%eax
   4172c:	29 d0                	sub    %edx,%eax
   4172e:	89 05 cc 38 00 00    	mov    %eax,0x38cc(%rip)        # 45000 <showing.0>

    if (processes[showing].p_state != P_FREE) {
   41734:	8b 05 c6 38 00 00    	mov    0x38c6(%rip),%eax        # 45000 <showing.0>
   4173a:	48 63 d0             	movslq %eax,%rdx
   4173d:	48 89 d0             	mov    %rdx,%rax
   41740:	48 01 c0             	add    %rax,%rax
   41743:	48 01 d0             	add    %rdx,%rax
   41746:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   4174d:	00 
   4174e:	48 01 d0             	add    %rdx,%rax
   41751:	48 c1 e0 03          	shl    $0x3,%rax
   41755:	48 89 c2             	mov    %rax,%rdx
   41758:	48 8d 05 89 19 01 00 	lea    0x11989(%rip),%rax        # 530e8 <processes+0xc8>
   4175f:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41762:	85 c0                	test   %eax,%eax
   41764:	74 63                	je     417c9 <memshow_virtual_animate+0x149>
        char s[4];
        snprintf(s, 4, "%d ", showing);
   41766:	8b 15 94 38 00 00    	mov    0x3894(%rip),%edx        # 45000 <showing.0>
   4176c:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
   41770:	89 d1                	mov    %edx,%ecx
   41772:	48 8d 15 6b 2e 00 00 	lea    0x2e6b(%rip),%rdx        # 445e4 <memstate_colors+0xa4>
   41779:	be 04 00 00 00       	mov    $0x4,%esi
   4177e:	48 89 c7             	mov    %rax,%rdi
   41781:	b8 00 00 00 00       	mov    $0x0,%eax
   41786:	e8 9a 2a 00 00       	call   44225 <snprintf>
        memshow_virtual(processes[showing].p_pagetable, s);
   4178b:	8b 05 6f 38 00 00    	mov    0x386f(%rip),%eax        # 45000 <showing.0>
   41791:	48 63 d0             	movslq %eax,%rdx
   41794:	48 89 d0             	mov    %rdx,%rax
   41797:	48 01 c0             	add    %rax,%rax
   4179a:	48 01 d0             	add    %rdx,%rax
   4179d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   417a4:	00 
   417a5:	48 01 d0             	add    %rdx,%rax
   417a8:	48 c1 e0 03          	shl    $0x3,%rax
   417ac:	48 89 c2             	mov    %rax,%rdx
   417af:	48 8d 05 3a 19 01 00 	lea    0x1193a(%rip),%rax        # 530f0 <processes+0xd0>
   417b6:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   417ba:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
   417be:	48 89 d6             	mov    %rdx,%rsi
   417c1:	48 89 c7             	mov    %rax,%rdi
   417c4:	e8 a6 fc ff ff       	call   4146f <memshow_virtual>
    }
}
   417c9:	90                   	nop
   417ca:	c9                   	leave  
   417cb:	c3                   	ret    

00000000000417cc <memdump_physical>:


// Dumps to the log file same information as memshow_physical

void memdump_physical(void) {
   417cc:	f3 0f 1e fa          	endbr64 
   417d0:	55                   	push   %rbp
   417d1:	48 89 e5             	mov    %rsp,%rbp
   417d4:	48 83 ec 10          	sub    $0x10,%rsp
  log_printf("PM_DUMP %u ", ticks);
   417d8:	8b 05 c2 25 01 00    	mov    0x125c2(%rip),%eax        # 53da0 <ticks>
   417de:	89 c6                	mov    %eax,%esi
   417e0:	48 8d 05 01 2e 00 00 	lea    0x2e01(%rip),%rax        # 445e8 <memstate_colors+0xa8>
   417e7:	48 89 c7             	mov    %rax,%rdi
   417ea:	b8 00 00 00 00       	mov    $0x0,%eax
   417ef:	e8 da 19 00 00       	call   431ce <log_printf>
  for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   417f4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   417fb:	eb 4c                	jmp    41849 <memdump_physical+0x7d>
    uint8_t owner = pageinfo[pn].owner;
   417fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41800:	48 98                	cltq   
   41802:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41806:	48 8d 05 b3 25 01 00 	lea    0x125b3(%rip),%rax        # 53dc0 <pageinfo>
   4180d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41811:	88 45 fb             	mov    %al,-0x5(%rbp)
    log_printf("%u %u ", owner, pageinfo[pn].refcount);
   41814:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41817:	48 98                	cltq   
   41819:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4181d:	48 8d 05 9d 25 01 00 	lea    0x1259d(%rip),%rax        # 53dc1 <pageinfo+0x1>
   41824:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41828:	0f be d0             	movsbl %al,%edx
   4182b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   4182f:	89 c6                	mov    %eax,%esi
   41831:	48 8d 05 bc 2d 00 00 	lea    0x2dbc(%rip),%rax        # 445f4 <memstate_colors+0xb4>
   41838:	48 89 c7             	mov    %rax,%rdi
   4183b:	b8 00 00 00 00       	mov    $0x0,%eax
   41840:	e8 89 19 00 00       	call   431ce <log_printf>
  for (int pn = 0; pn < PAGENUMBER(MEMSIZE_PHYSICAL); ++pn) {
   41845:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41849:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%rbp)
   41850:	7e ab                	jle    417fd <memdump_physical+0x31>
  }
  log_printf("\n");
   41852:	48 8d 05 a2 2d 00 00 	lea    0x2da2(%rip),%rax        # 445fb <memstate_colors+0xbb>
   41859:	48 89 c7             	mov    %rax,%rdi
   4185c:	b8 00 00 00 00       	mov    $0x0,%eax
   41861:	e8 68 19 00 00       	call   431ce <log_printf>
}
   41866:	90                   	nop
   41867:	c9                   	leave  
   41868:	c3                   	ret    

0000000000041869 <memdump_virtual>:


// Helper for memdump_virtual_all

void memdump_virtual(x86_64_pagetable* pagetable, const char* name) {
   41869:	f3 0f 1e fa          	endbr64 
   4186d:	55                   	push   %rbp
   4186e:	48 89 e5             	mov    %rsp,%rbp
   41871:	48 83 ec 40          	sub    $0x40,%rsp
   41875:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   41879:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  log_printf("VM_DUMP %s %u ", name, ticks);
   4187d:	8b 15 1d 25 01 00    	mov    0x1251d(%rip),%edx        # 53da0 <ticks>
   41883:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   41887:	48 89 c6             	mov    %rax,%rsi
   4188a:	48 8d 05 6c 2d 00 00 	lea    0x2d6c(%rip),%rax        # 445fd <memstate_colors+0xbd>
   41891:	48 89 c7             	mov    %rax,%rdi
   41894:	b8 00 00 00 00       	mov    $0x0,%eax
   41899:	e8 30 19 00 00       	call   431ce <log_printf>
  assert((uintptr_t)pagetable == PTE_ADDR(pagetable));
   4189e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   418a2:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   418a8:	48 89 c2             	mov    %rax,%rdx
   418ab:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   418af:	48 39 c2             	cmp    %rax,%rdx
   418b2:	74 1e                	je     418d2 <memdump_virtual+0x69>
   418b4:	48 8d 05 55 2d 00 00 	lea    0x2d55(%rip),%rax        # 44610 <memstate_colors+0xd0>
   418bb:	48 89 c2             	mov    %rax,%rdx
   418be:	be 84 02 00 00       	mov    $0x284,%esi
   418c3:	48 8d 05 eb 29 00 00 	lea    0x29eb(%rip),%rax        # 442b5 <console_clear+0x56>
   418ca:	48 89 c7             	mov    %rax,%rdi
   418cd:	e8 25 1c 00 00       	call   434f7 <assert_fail>
  for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   418d2:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
   418d9:	00 
   418da:	e9 8b 00 00 00       	jmp    4196a <memdump_virtual+0x101>
    vamapping vam = virtual_memory_lookup(pagetable, va);
   418df:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
   418e3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   418e7:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   418eb:	48 89 ce             	mov    %rcx,%rsi
   418ee:	48 89 c7             	mov    %rax,%rdi
   418f1:	e8 c0 0f 00 00       	call   428b6 <virtual_memory_lookup>
    if (vam.pn < 0) {
   418f6:	8b 45 d8             	mov    -0x28(%rbp),%eax
   418f9:	85 c0                	test   %eax,%eax
   418fb:	79 16                	jns    41913 <memdump_virtual+0xaa>
      log_printf("0 0 0 ");
   418fd:	48 8d 05 38 2d 00 00 	lea    0x2d38(%rip),%rax        # 4463c <memstate_colors+0xfc>
   41904:	48 89 c7             	mov    %rax,%rdi
   41907:	b8 00 00 00 00       	mov    $0x0,%eax
   4190c:	e8 bd 18 00 00       	call   431ce <log_printf>
   41911:	eb 4f                	jmp    41962 <memdump_virtual+0xf9>
      continue;
    }

    uint8_t owner = pageinfo[vam.pn].owner;
   41913:	8b 45 d8             	mov    -0x28(%rbp),%eax
   41916:	48 98                	cltq   
   41918:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   4191c:	48 8d 05 9d 24 01 00 	lea    0x1249d(%rip),%rax        # 53dc0 <pageinfo>
   41923:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   41927:	88 45 f7             	mov    %al,-0x9(%rbp)
    uint8_t refcount = pageinfo[vam.pn].refcount;
   4192a:	8b 45 d8             	mov    -0x28(%rbp),%eax
   4192d:	48 98                	cltq   
   4192f:	48 8d 14 00          	lea    (%rax,%rax,1),%rdx
   41933:	48 8d 05 87 24 01 00 	lea    0x12487(%rip),%rax        # 53dc1 <pageinfo+0x1>
   4193a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
   4193e:	88 45 f6             	mov    %al,-0xa(%rbp)
    log_printf("%u %u %u ", owner, refcount, vam.perm);
   41941:	8b 4d e8             	mov    -0x18(%rbp),%ecx
   41944:	0f b6 55 f6          	movzbl -0xa(%rbp),%edx
   41948:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4194c:	89 c6                	mov    %eax,%esi
   4194e:	48 8d 05 ee 2c 00 00 	lea    0x2cee(%rip),%rax        # 44643 <memstate_colors+0x103>
   41955:	48 89 c7             	mov    %rax,%rdi
   41958:	b8 00 00 00 00       	mov    $0x0,%eax
   4195d:	e8 6c 18 00 00       	call   431ce <log_printf>
  for (uintptr_t va = 0; va < MEMSIZE_VIRTUAL; va += PAGESIZE) {
   41962:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   41969:	00 
   4196a:	48 81 7d f8 ff ff 2f 	cmpq   $0x2fffff,-0x8(%rbp)
   41971:	00 
   41972:	0f 86 67 ff ff ff    	jbe    418df <memdump_virtual+0x76>
  }
  log_printf("\n");
   41978:	48 8d 05 7c 2c 00 00 	lea    0x2c7c(%rip),%rax        # 445fb <memstate_colors+0xbb>
   4197f:	48 89 c7             	mov    %rax,%rdi
   41982:	b8 00 00 00 00       	mov    $0x0,%eax
   41987:	e8 42 18 00 00       	call   431ce <log_printf>
}
   4198c:	90                   	nop
   4198d:	c9                   	leave  
   4198e:	c3                   	ret    

000000000004198f <memdump_virtual_all>:


// Dumps to the log file same information as memshow_virtual_animate

void memdump_virtual_all() {
   4198f:	f3 0f 1e fa          	endbr64 
   41993:	55                   	push   %rbp
   41994:	48 89 e5             	mov    %rsp,%rbp
   41997:	48 83 ec 10          	sub    $0x10,%rsp
  for (uint32_t i = 0; i < NPROC; ++i) {
   4199b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   419a2:	e9 8a 00 00 00       	jmp    41a31 <memdump_virtual_all+0xa2>
    if (processes[i].p_state != P_FREE) {
   419a7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   419aa:	48 89 d0             	mov    %rdx,%rax
   419ad:	48 01 c0             	add    %rax,%rax
   419b0:	48 01 d0             	add    %rdx,%rax
   419b3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   419ba:	00 
   419bb:	48 01 d0             	add    %rdx,%rax
   419be:	48 c1 e0 03          	shl    $0x3,%rax
   419c2:	48 89 c2             	mov    %rax,%rdx
   419c5:	48 8d 05 1c 17 01 00 	lea    0x1171c(%rip),%rax        # 530e8 <processes+0xc8>
   419cc:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   419cf:	85 c0                	test   %eax,%eax
   419d1:	74 5a                	je     41a2d <memdump_virtual_all+0x9e>
      char s[4];
      snprintf(s, 4, "%d ", i);
   419d3:	8b 55 fc             	mov    -0x4(%rbp),%edx
   419d6:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   419da:	89 d1                	mov    %edx,%ecx
   419dc:	48 8d 15 01 2c 00 00 	lea    0x2c01(%rip),%rdx        # 445e4 <memstate_colors+0xa4>
   419e3:	be 04 00 00 00       	mov    $0x4,%esi
   419e8:	48 89 c7             	mov    %rax,%rdi
   419eb:	b8 00 00 00 00       	mov    $0x0,%eax
   419f0:	e8 30 28 00 00       	call   44225 <snprintf>
      memdump_virtual(processes[i].p_pagetable, s);
   419f5:	8b 55 fc             	mov    -0x4(%rbp),%edx
   419f8:	48 89 d0             	mov    %rdx,%rax
   419fb:	48 01 c0             	add    %rax,%rax
   419fe:	48 01 d0             	add    %rdx,%rax
   41a01:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41a08:	00 
   41a09:	48 01 d0             	add    %rdx,%rax
   41a0c:	48 c1 e0 03          	shl    $0x3,%rax
   41a10:	48 89 c2             	mov    %rax,%rdx
   41a13:	48 8d 05 d6 16 01 00 	lea    0x116d6(%rip),%rax        # 530f0 <processes+0xd0>
   41a1a:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   41a1e:	48 8d 55 f8          	lea    -0x8(%rbp),%rdx
   41a22:	48 89 d6             	mov    %rdx,%rsi
   41a25:	48 89 c7             	mov    %rax,%rdi
   41a28:	e8 3c fe ff ff       	call   41869 <memdump_virtual>
  for (uint32_t i = 0; i < NPROC; ++i) {
   41a2d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   41a31:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
   41a35:	0f 86 6c ff ff ff    	jbe    419a7 <memdump_virtual_all+0x18>
    }
  }
}
   41a3b:	90                   	nop
   41a3c:	90                   	nop
   41a3d:	c9                   	leave  
   41a3e:	c3                   	ret    

0000000000041a3f <fork>:

int fork() {
   41a3f:	f3 0f 1e fa          	endbr64 
   41a43:	55                   	push   %rbp
   41a44:	48 89 e5             	mov    %rsp,%rbp
   41a47:	48 83 ec 40          	sub    $0x40,%rsp

    int r = -1;
   41a4b:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)

    for(int i = 1 ; i<NPROC; i++)
   41a52:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
   41a59:	e9 7b 02 00 00       	jmp    41cd9 <fork+0x29a>
    {
        if(processes[i].p_state == P_FREE){
   41a5e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41a61:	48 63 d0             	movslq %eax,%rdx
   41a64:	48 89 d0             	mov    %rdx,%rax
   41a67:	48 01 c0             	add    %rax,%rax
   41a6a:	48 01 d0             	add    %rdx,%rax
   41a6d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41a74:	00 
   41a75:	48 01 d0             	add    %rdx,%rax
   41a78:	48 c1 e0 03          	shl    $0x3,%rax
   41a7c:	48 89 c2             	mov    %rax,%rdx
   41a7f:	48 8d 05 62 16 01 00 	lea    0x11662(%rip),%rax        # 530e8 <processes+0xc8>
   41a86:	8b 04 02             	mov    (%rdx,%rax,1),%eax
   41a89:	85 c0                	test   %eax,%eax
   41a8b:	0f 85 44 02 00 00    	jne    41cd5 <fork+0x296>
            r = i;
   41a91:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41a94:	89 45 fc             	mov    %eax,-0x4(%rbp)
            processes[i].p_registers = current->p_registers;
   41a97:	48 8b 0d 62 15 01 00 	mov    0x11562(%rip),%rcx        # 53000 <current>
   41a9e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41aa1:	48 63 d0             	movslq %eax,%rdx
   41aa4:	48 89 d0             	mov    %rdx,%rax
   41aa7:	48 01 c0             	add    %rax,%rax
   41aaa:	48 01 d0             	add    %rdx,%rax
   41aad:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41ab4:	00 
   41ab5:	48 01 d0             	add    %rdx,%rax
   41ab8:	48 c1 e0 03          	shl    $0x3,%rax
   41abc:	48 89 c2             	mov    %rax,%rdx
   41abf:	48 8d 05 5a 15 01 00 	lea    0x1155a(%rip),%rax        # 53020 <processes>
   41ac6:	48 01 d0             	add    %rdx,%rax
   41ac9:	48 83 c0 08          	add    $0x8,%rax
   41acd:	48 8d 51 08          	lea    0x8(%rcx),%rdx
   41ad1:	b9 18 00 00 00       	mov    $0x18,%ecx
   41ad6:	48 89 c7             	mov    %rax,%rdi
   41ad9:	48 89 d6             	mov    %rdx,%rsi
   41adc:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
            processes[i].p_pid = i;
   41adf:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41ae2:	48 63 d0             	movslq %eax,%rdx
   41ae5:	48 89 d0             	mov    %rdx,%rax
   41ae8:	48 01 c0             	add    %rax,%rax
   41aeb:	48 01 d0             	add    %rdx,%rax
   41aee:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41af5:	00 
   41af6:	48 01 d0             	add    %rdx,%rax
   41af9:	48 c1 e0 03          	shl    $0x3,%rax
   41afd:	48 89 c1             	mov    %rax,%rcx
   41b00:	48 8d 15 19 15 01 00 	lea    0x11519(%rip),%rdx        # 53020 <processes>
   41b07:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b0a:	89 04 11             	mov    %eax,(%rcx,%rdx,1)
            processes[i].p_registers.reg_rax = 0;
   41b0d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b10:	48 63 d0             	movslq %eax,%rdx
   41b13:	48 89 d0             	mov    %rdx,%rax
   41b16:	48 01 c0             	add    %rax,%rax
   41b19:	48 01 d0             	add    %rdx,%rax
   41b1c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41b23:	00 
   41b24:	48 01 d0             	add    %rdx,%rax
   41b27:	48 c1 e0 03          	shl    $0x3,%rax
   41b2b:	48 89 c2             	mov    %rax,%rdx
   41b2e:	48 8d 05 f3 14 01 00 	lea    0x114f3(%rip),%rax        # 53028 <processes+0x8>
   41b35:	48 c7 04 02 00 00 00 	movq   $0x0,(%rdx,%rax,1)
   41b3c:	00 
            current->p_registers.reg_rax = r;
   41b3d:	48 8b 05 bc 14 01 00 	mov    0x114bc(%rip),%rax        # 53000 <current>
   41b44:	8b 55 fc             	mov    -0x4(%rbp),%edx
   41b47:	48 63 d2             	movslq %edx,%rdx
   41b4a:	48 89 50 08          	mov    %rdx,0x8(%rax)
            processes[i].p_state = P_RUNNABLE;
   41b4e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b51:	48 63 d0             	movslq %eax,%rdx
   41b54:	48 89 d0             	mov    %rdx,%rax
   41b57:	48 01 c0             	add    %rax,%rax
   41b5a:	48 01 d0             	add    %rdx,%rax
   41b5d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41b64:	00 
   41b65:	48 01 d0             	add    %rdx,%rax
   41b68:	48 c1 e0 03          	shl    $0x3,%rax
   41b6c:	48 89 c2             	mov    %rax,%rdx
   41b6f:	48 8d 05 72 15 01 00 	lea    0x11572(%rip),%rax        # 530e8 <processes+0xc8>
   41b76:	c7 04 02 01 00 00 00 	movl   $0x1,(%rdx,%rax,1)
            processes[i].p_pagetable = copy_pagetable(current->p_pagetable, i);
   41b7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41b80:	0f be d0             	movsbl %al,%edx
   41b83:	48 8b 05 76 14 01 00 	mov    0x11476(%rip),%rax        # 53000 <current>
   41b8a:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   41b91:	89 d6                	mov    %edx,%esi
   41b93:	48 89 c7             	mov    %rax,%rdi
   41b96:	e8 4c e8 ff ff       	call   403e7 <copy_pagetable>
   41b9b:	48 89 c2             	mov    %rax,%rdx
   41b9e:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41ba1:	48 63 c8             	movslq %eax,%rcx
   41ba4:	48 89 c8             	mov    %rcx,%rax
   41ba7:	48 01 c0             	add    %rax,%rax
   41baa:	48 01 c8             	add    %rcx,%rax
   41bad:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   41bb4:	00 
   41bb5:	48 01 c8             	add    %rcx,%rax
   41bb8:	48 c1 e0 03          	shl    $0x3,%rax
   41bbc:	48 89 c1             	mov    %rax,%rcx
   41bbf:	48 8d 05 2a 15 01 00 	lea    0x1152a(%rip),%rax        # 530f0 <processes+0xd0>
   41bc6:	48 89 14 01          	mov    %rdx,(%rcx,%rax,1)
            for(int va = 0; va < MEMSIZE_VIRTUAL; va+=PAGESIZE)
   41bca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   41bd1:	e9 f0 00 00 00       	jmp    41cc6 <fork+0x287>
            {
                vamapping vmap = virtual_memory_lookup(current->p_pagetable, va);
   41bd6:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41bd9:	48 63 d0             	movslq %eax,%rdx
   41bdc:	48 8b 05 1d 14 01 00 	mov    0x1141d(%rip),%rax        # 53000 <current>
   41be3:	48 8b 88 d0 00 00 00 	mov    0xd0(%rax),%rcx
   41bea:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   41bee:	48 89 ce             	mov    %rcx,%rsi
   41bf1:	48 89 c7             	mov    %rax,%rdi
   41bf4:	e8 bd 0c 00 00       	call   428b6 <virtual_memory_lookup>
                uintptr_t pa = vmap.pa;
   41bf9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41bfd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
                int perm = vmap.perm;
   41c01:	8b 45 d0             	mov    -0x30(%rbp),%eax
   41c04:	89 45 e4             	mov    %eax,-0x1c(%rbp)
                if(pa != (uintptr_t)-1 && (perm & PTE_U) && (perm & PTE_W) && (perm & PTE_P)){
   41c07:	48 83 7d e8 ff       	cmpq   $0xffffffffffffffff,-0x18(%rbp)
   41c0c:	0f 84 ad 00 00 00    	je     41cbf <fork+0x280>
   41c12:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41c15:	48 98                	cltq   
   41c17:	83 e0 04             	and    $0x4,%eax
   41c1a:	48 85 c0             	test   %rax,%rax
   41c1d:	0f 84 9c 00 00 00    	je     41cbf <fork+0x280>
   41c23:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41c26:	48 98                	cltq   
   41c28:	83 e0 02             	and    $0x2,%eax
   41c2b:	48 85 c0             	test   %rax,%rax
   41c2e:	0f 84 8b 00 00 00    	je     41cbf <fork+0x280>
   41c34:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   41c37:	48 98                	cltq   
   41c39:	83 e0 01             	and    $0x1,%eax
   41c3c:	48 85 c0             	test   %rax,%rax
   41c3f:	74 7e                	je     41cbf <fork+0x280>
                    globalowner = i;
   41c41:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41c44:	88 05 be 13 01 00    	mov    %al,0x113be(%rip)        # 53008 <globalowner>
                    x86_64_pagetable* newPhysicalPage = allocator();
   41c4a:	b8 00 00 00 00       	mov    $0x0,%eax
   41c4f:	e8 db e6 ff ff       	call   4032f <allocator>
   41c54:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
                    memcpy((void *)newPhysicalPage, (void *)pa, PAGESIZE);
   41c58:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   41c5c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41c60:	ba 00 10 00 00       	mov    $0x1000,%edx
   41c65:	48 89 ce             	mov    %rcx,%rsi
   41c68:	48 89 c7             	mov    %rax,%rdi
   41c6b:	e8 3a 1c 00 00       	call   438aa <memcpy>
                    virtual_memory_map(processes[i].p_pagetable, va, (uintptr_t)newPhysicalPage, PAGESIZE, (PTE_P | PTE_W | PTE_U), NULL);
   41c70:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   41c74:	8b 45 f4             	mov    -0xc(%rbp),%eax
   41c77:	48 63 f0             	movslq %eax,%rsi
   41c7a:	8b 45 f8             	mov    -0x8(%rbp),%eax
   41c7d:	48 63 c8             	movslq %eax,%rcx
   41c80:	48 89 c8             	mov    %rcx,%rax
   41c83:	48 01 c0             	add    %rax,%rax
   41c86:	48 01 c8             	add    %rcx,%rax
   41c89:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
   41c90:	00 
   41c91:	48 01 c8             	add    %rcx,%rax
   41c94:	48 c1 e0 03          	shl    $0x3,%rax
   41c98:	48 89 c1             	mov    %rax,%rcx
   41c9b:	48 8d 05 4e 14 01 00 	lea    0x1144e(%rip),%rax        # 530f0 <processes+0xd0>
   41ca2:	48 8b 04 01          	mov    (%rcx,%rax,1),%rax
   41ca6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
   41cac:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   41cb2:	b9 00 10 00 00       	mov    $0x1000,%ecx
   41cb7:	48 89 c7             	mov    %rax,%rdi
   41cba:	e8 7d 07 00 00       	call   4243c <virtual_memory_map>
            for(int va = 0; va < MEMSIZE_VIRTUAL; va+=PAGESIZE)
   41cbf:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%rbp)
   41cc6:	81 7d f4 ff ff 2f 00 	cmpl   $0x2fffff,-0xc(%rbp)
   41ccd:	0f 8e 03 ff ff ff    	jle    41bd6 <fork+0x197>
                }
            }
            break;
   41cd3:	eb 0e                	jmp    41ce3 <fork+0x2a4>
    for(int i = 1 ; i<NPROC; i++)
   41cd5:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   41cd9:	83 7d f8 0f          	cmpl   $0xf,-0x8(%rbp)
   41cdd:	0f 8e 7b fd ff ff    	jle    41a5e <fork+0x1f>
            
        }
    }
    return r;
   41ce3:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   41ce6:	c9                   	leave  
   41ce7:	c3                   	ret    

0000000000041ce8 <pageindex>:
static inline int pageindex(uintptr_t addr, int level) {
   41ce8:	55                   	push   %rbp
   41ce9:	48 89 e5             	mov    %rsp,%rbp
   41cec:	48 83 ec 10          	sub    $0x10,%rsp
   41cf0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41cf4:	89 75 f4             	mov    %esi,-0xc(%rbp)
    assert(level >= 0 && level <= 3);
   41cf7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   41cfb:	78 06                	js     41d03 <pageindex+0x1b>
   41cfd:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
   41d01:	7e 1e                	jle    41d21 <pageindex+0x39>
   41d03:	48 8d 05 56 29 00 00 	lea    0x2956(%rip),%rax        # 44660 <memstate_colors+0x120>
   41d0a:	48 89 c2             	mov    %rax,%rdx
   41d0d:	be 1e 00 00 00       	mov    $0x1e,%esi
   41d12:	48 8d 05 60 29 00 00 	lea    0x2960(%rip),%rax        # 44679 <memstate_colors+0x139>
   41d19:	48 89 c7             	mov    %rax,%rdi
   41d1c:	e8 d6 17 00 00       	call   434f7 <assert_fail>
    return (int) (addr >> (PAGEOFFBITS + (3 - level) * PAGEINDEXBITS)) & 0x1FF;
   41d21:	b8 03 00 00 00       	mov    $0x3,%eax
   41d26:	2b 45 f4             	sub    -0xc(%rbp),%eax
   41d29:	89 c2                	mov    %eax,%edx
   41d2b:	89 d0                	mov    %edx,%eax
   41d2d:	c1 e0 03             	shl    $0x3,%eax
   41d30:	01 d0                	add    %edx,%eax
   41d32:	83 c0 0c             	add    $0xc,%eax
   41d35:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   41d39:	89 c1                	mov    %eax,%ecx
   41d3b:	48 d3 ea             	shr    %cl,%rdx
   41d3e:	48 89 d0             	mov    %rdx,%rax
   41d41:	25 ff 01 00 00       	and    $0x1ff,%eax
}
   41d46:	c9                   	leave  
   41d47:	c3                   	ret    

0000000000041d48 <hardware_init>:

static void segments_init(void);
static void interrupt_init(void);
static void virtual_memory_init(void);

void hardware_init(void) {
   41d48:	f3 0f 1e fa          	endbr64 
   41d4c:	55                   	push   %rbp
   41d4d:	48 89 e5             	mov    %rsp,%rbp
    segments_init();
   41d50:	e8 5f 01 00 00       	call   41eb4 <segments_init>
    interrupt_init();
   41d55:	e8 44 04 00 00       	call   4219e <interrupt_init>
    virtual_memory_init();
   41d5a:	e8 22 06 00 00       	call   42381 <virtual_memory_init>
}
   41d5f:	90                   	nop
   41d60:	5d                   	pop    %rbp
   41d61:	c3                   	ret    

0000000000041d62 <set_app_segment>:
#define SEGSEL_TASKSTATE        0x28            // task state segment

// Segments
static uint64_t segments[7];

static void set_app_segment(uint64_t* segment, uint64_t type, int dpl) {
   41d62:	f3 0f 1e fa          	endbr64 
   41d66:	55                   	push   %rbp
   41d67:	48 89 e5             	mov    %rsp,%rbp
   41d6a:	48 83 ec 18          	sub    $0x18,%rsp
   41d6e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41d72:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41d76:	89 55 ec             	mov    %edx,-0x14(%rbp)
    *segment = type
        | X86SEG_S                    // code/data segment
        | ((uint64_t) dpl << 45)
   41d79:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41d7c:	48 98                	cltq   
   41d7e:	48 c1 e0 2d          	shl    $0x2d,%rax
   41d82:	48 0b 45 f0          	or     -0x10(%rbp),%rax
        | X86SEG_P;                   // segment present
   41d86:	48 ba 00 00 00 00 00 	movabs $0x900000000000,%rdx
   41d8d:	90 00 00 
   41d90:	48 09 c2             	or     %rax,%rdx
    *segment = type
   41d93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41d97:	48 89 10             	mov    %rdx,(%rax)
}
   41d9a:	90                   	nop
   41d9b:	c9                   	leave  
   41d9c:	c3                   	ret    

0000000000041d9d <set_sys_segment>:

static void set_sys_segment(uint64_t* segment, uint64_t type, int dpl,
                            uintptr_t addr, size_t size) {
   41d9d:	f3 0f 1e fa          	endbr64 
   41da1:	55                   	push   %rbp
   41da2:	48 89 e5             	mov    %rsp,%rbp
   41da5:	48 83 ec 28          	sub    $0x28,%rsp
   41da9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41dad:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41db1:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41db4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   41db8:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41dbc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41dc0:	48 c1 e0 10          	shl    $0x10,%rax
   41dc4:	48 89 c2             	mov    %rax,%rdx
   41dc7:	48 b8 00 00 ff ff ff 	movabs $0xffffff0000,%rax
   41dce:	00 00 00 
   41dd1:	48 21 c2             	and    %rax,%rdx
        | ((addr & 0x00000000FF000000UL) << 32)
   41dd4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41dd8:	48 c1 e0 20          	shl    $0x20,%rax
   41ddc:	48 89 c1             	mov    %rax,%rcx
   41ddf:	48 b8 00 00 00 00 00 	movabs $0xff00000000000000,%rax
   41de6:	00 00 ff 
   41de9:	48 21 c8             	and    %rcx,%rax
   41dec:	48 09 c2             	or     %rax,%rdx
        | ((size - 1) & 0x0FFFFUL)
   41def:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41df3:	48 83 e8 01          	sub    $0x1,%rax
   41df7:	0f b7 c0             	movzwl %ax,%eax
        | (((size - 1) & 0xF0000UL) << 48)
   41dfa:	48 09 d0             	or     %rdx,%rax
        | type
   41dfd:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41e01:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41e04:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41e07:	48 98                	cltq   
   41e09:	48 c1 e0 2d          	shl    $0x2d,%rax
   41e0d:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P;                   // segment present
   41e10:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
   41e17:	80 00 00 
   41e1a:	48 09 c2             	or     %rax,%rdx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   41e1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e21:	48 89 10             	mov    %rdx,(%rax)
    segment[1] = addr >> 32;
   41e24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e28:	48 83 c0 08          	add    $0x8,%rax
   41e2c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   41e30:	48 c1 ea 20          	shr    $0x20,%rdx
   41e34:	48 89 10             	mov    %rdx,(%rax)
}
   41e37:	90                   	nop
   41e38:	c9                   	leave  
   41e39:	c3                   	ret    

0000000000041e3a <set_gate>:

// Processor state for taking an interrupt
static x86_64_taskstate kernel_task_descriptor;

static void set_gate(x86_64_gatedescriptor* gate, uint64_t type, int dpl,
                     uintptr_t function) {
   41e3a:	f3 0f 1e fa          	endbr64 
   41e3e:	55                   	push   %rbp
   41e3f:	48 89 e5             	mov    %rsp,%rbp
   41e42:	48 83 ec 20          	sub    $0x20,%rsp
   41e46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   41e4a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   41e4e:	89 55 ec             	mov    %edx,-0x14(%rbp)
   41e51:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41e55:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41e59:	0f b7 c0             	movzwl %ax,%eax
        | (SEGSEL_KERN_CODE << 16)
        | type
   41e5c:	48 0b 45 f0          	or     -0x10(%rbp),%rax
   41e60:	48 89 c2             	mov    %rax,%rdx
        | ((uint64_t) dpl << 45)
   41e63:	8b 45 ec             	mov    -0x14(%rbp),%eax
   41e66:	48 98                	cltq   
   41e68:	48 c1 e0 2d          	shl    $0x2d,%rax
   41e6c:	48 09 c2             	or     %rax,%rdx
        | X86SEG_P
        | ((function & 0x00000000FFFF0000UL) << 32);
   41e6f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41e73:	48 c1 e0 20          	shl    $0x20,%rax
   41e77:	48 89 c1             	mov    %rax,%rcx
   41e7a:	48 b8 00 00 00 00 00 	movabs $0xffff000000000000,%rax
   41e81:	00 ff ff 
   41e84:	48 21 c8             	and    %rcx,%rax
   41e87:	48 09 c2             	or     %rax,%rdx
   41e8a:	48 b8 00 00 08 00 00 	movabs $0x800000080000,%rax
   41e91:	80 00 00 
   41e94:	48 09 c2             	or     %rax,%rdx
    gate->gd_low = (function & 0x000000000000FFFFUL)
   41e97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41e9b:	48 89 10             	mov    %rdx,(%rax)
    gate->gd_high = function >> 32;
   41e9e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   41ea2:	48 c1 e8 20          	shr    $0x20,%rax
   41ea6:	48 89 c2             	mov    %rax,%rdx
   41ea9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   41ead:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
   41eb1:	90                   	nop
   41eb2:	c9                   	leave  
   41eb3:	c3                   	ret    

0000000000041eb4 <segments_init>:
extern void default_int_handler(void);
extern void gpf_int_handler(void);
extern void pagefault_int_handler(void);
extern void timer_int_handler(void);

void segments_init(void) {
   41eb4:	f3 0f 1e fa          	endbr64 
   41eb8:	55                   	push   %rbp
   41eb9:	48 89 e5             	mov    %rsp,%rbp
   41ebc:	48 83 ec 40          	sub    $0x40,%rsp
    // Segments for kernel & user code & data
    // The privilege level, which can be 0 or 3, differentiates between
    // kernel and user code. (Data segments are unused in WeensyOS.)
    segments[0] = 0;
   41ec0:	48 c7 05 55 31 01 00 	movq   $0x0,0x13155(%rip)        # 55020 <segments>
   41ec7:	00 00 00 00 
    set_app_segment(&segments[SEGSEL_KERN_CODE >> 3], X86SEG_X | X86SEG_L, 0);
   41ecb:	ba 00 00 00 00       	mov    $0x0,%edx
   41ed0:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41ed7:	08 20 00 
   41eda:	48 89 c6             	mov    %rax,%rsi
   41edd:	48 8d 05 44 31 01 00 	lea    0x13144(%rip),%rax        # 55028 <segments+0x8>
   41ee4:	48 89 c7             	mov    %rax,%rdi
   41ee7:	e8 76 fe ff ff       	call   41d62 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_CODE >> 3], X86SEG_X | X86SEG_L, 3);
   41eec:	ba 03 00 00 00       	mov    $0x3,%edx
   41ef1:	48 b8 00 00 00 00 00 	movabs $0x20080000000000,%rax
   41ef8:	08 20 00 
   41efb:	48 89 c6             	mov    %rax,%rsi
   41efe:	48 8d 05 2b 31 01 00 	lea    0x1312b(%rip),%rax        # 55030 <segments+0x10>
   41f05:	48 89 c7             	mov    %rax,%rdi
   41f08:	e8 55 fe ff ff       	call   41d62 <set_app_segment>
    set_app_segment(&segments[SEGSEL_KERN_DATA >> 3], X86SEG_W, 0);
   41f0d:	ba 00 00 00 00       	mov    $0x0,%edx
   41f12:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41f19:	02 00 00 
   41f1c:	48 89 c6             	mov    %rax,%rsi
   41f1f:	48 8d 05 12 31 01 00 	lea    0x13112(%rip),%rax        # 55038 <segments+0x18>
   41f26:	48 89 c7             	mov    %rax,%rdi
   41f29:	e8 34 fe ff ff       	call   41d62 <set_app_segment>
    set_app_segment(&segments[SEGSEL_APP_DATA >> 3], X86SEG_W, 3);
   41f2e:	ba 03 00 00 00       	mov    $0x3,%edx
   41f33:	48 b8 00 00 00 00 00 	movabs $0x20000000000,%rax
   41f3a:	02 00 00 
   41f3d:	48 89 c6             	mov    %rax,%rsi
   41f40:	48 8d 05 f9 30 01 00 	lea    0x130f9(%rip),%rax        # 55040 <segments+0x20>
   41f47:	48 89 c7             	mov    %rax,%rdi
   41f4a:	e8 13 fe ff ff       	call   41d62 <set_app_segment>
    set_sys_segment(&segments[SEGSEL_TASKSTATE >> 3], X86SEG_TSS, 0,
   41f4f:	48 8d 05 0a 41 01 00 	lea    0x1410a(%rip),%rax        # 56060 <kernel_task_descriptor>
   41f56:	41 b8 60 00 00 00    	mov    $0x60,%r8d
   41f5c:	48 89 c1             	mov    %rax,%rcx
   41f5f:	ba 00 00 00 00       	mov    $0x0,%edx
   41f64:	48 b8 00 00 00 00 00 	movabs $0x90000000000,%rax
   41f6b:	09 00 00 
   41f6e:	48 89 c6             	mov    %rax,%rsi
   41f71:	48 8d 05 d0 30 01 00 	lea    0x130d0(%rip),%rax        # 55048 <segments+0x28>
   41f78:	48 89 c7             	mov    %rax,%rdi
   41f7b:	e8 1d fe ff ff       	call   41d9d <set_sys_segment>
                    (uintptr_t) &kernel_task_descriptor,
                    sizeof(kernel_task_descriptor));

    x86_64_pseudodescriptor gdt;
    gdt.pseudod_limit = sizeof(segments) - 1;
   41f80:	66 c7 45 d6 37 00    	movw   $0x37,-0x2a(%rbp)
    gdt.pseudod_base = (uint64_t) segments;
   41f86:	48 8d 05 93 30 01 00 	lea    0x13093(%rip),%rax        # 55020 <segments>
   41f8d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)

    // Kernel task descriptor lets us receive interrupts
    memset(&kernel_task_descriptor, 0, sizeof(kernel_task_descriptor));
   41f91:	ba 60 00 00 00       	mov    $0x60,%edx
   41f96:	be 00 00 00 00       	mov    $0x0,%esi
   41f9b:	48 8d 05 be 40 01 00 	lea    0x140be(%rip),%rax        # 56060 <kernel_task_descriptor>
   41fa2:	48 89 c7             	mov    %rax,%rdi
   41fa5:	e8 71 19 00 00       	call   4391b <memset>
    kernel_task_descriptor.ts_rsp[0] = KERNEL_STACK_TOP;
   41faa:	48 c7 05 af 40 01 00 	movq   $0x80000,0x140af(%rip)        # 56064 <kernel_task_descriptor+0x4>
   41fb1:	00 00 08 00 

    // Interrupt handler; most interrupts are effectively ignored
    memset(interrupt_descriptors, 0, sizeof(interrupt_descriptors));
   41fb5:	ba 00 10 00 00       	mov    $0x1000,%edx
   41fba:	be 00 00 00 00       	mov    $0x0,%esi
   41fbf:	48 8d 05 9a 30 01 00 	lea    0x1309a(%rip),%rax        # 55060 <interrupt_descriptors>
   41fc6:	48 89 c7             	mov    %rax,%rdi
   41fc9:	e8 4d 19 00 00       	call   4391b <memset>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   41fce:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%rbp)
   41fd5:	eb 3c                	jmp    42013 <segments_init+0x15f>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 0,
   41fd7:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   41fde:	48 89 c2             	mov    %rax,%rdx
   41fe1:	8b 45 fc             	mov    -0x4(%rbp),%eax
   41fe4:	48 c1 e0 04          	shl    $0x4,%rax
   41fe8:	48 89 c1             	mov    %rax,%rcx
   41feb:	48 8d 05 6e 30 01 00 	lea    0x1306e(%rip),%rax        # 55060 <interrupt_descriptors>
   41ff2:	48 01 c8             	add    %rcx,%rax
   41ff5:	48 89 d1             	mov    %rdx,%rcx
   41ff8:	ba 00 00 00 00       	mov    $0x0,%edx
   41ffd:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   42004:	0e 00 00 
   42007:	48 89 c7             	mov    %rax,%rdi
   4200a:	e8 2b fe ff ff       	call   41e3a <set_gate>
    for (unsigned i = 16; i < arraysize(interrupt_descriptors); ++i) {
   4200f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42013:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
   4201a:	76 bb                	jbe    41fd7 <segments_init+0x123>
                 (uint64_t) default_int_handler);
    }

    // Timer interrupt
    set_gate(&interrupt_descriptors[INT_TIMER], X86GATE_INTERRUPT, 0,
   4201c:	48 c7 c0 36 00 04 00 	mov    $0x40036,%rax
   42023:	48 89 c1             	mov    %rax,%rcx
   42026:	ba 00 00 00 00       	mov    $0x0,%edx
   4202b:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42032:	0e 00 00 
   42035:	48 89 c6             	mov    %rax,%rsi
   42038:	48 8d 05 21 32 01 00 	lea    0x13221(%rip),%rax        # 55260 <interrupt_descriptors+0x200>
   4203f:	48 89 c7             	mov    %rax,%rdi
   42042:	e8 f3 fd ff ff       	call   41e3a <set_gate>
             (uint64_t) timer_int_handler);

    // GPF and page fault
    set_gate(&interrupt_descriptors[INT_GPF], X86GATE_INTERRUPT, 0,
   42047:	48 c7 c0 2e 00 04 00 	mov    $0x4002e,%rax
   4204e:	48 89 c1             	mov    %rax,%rcx
   42051:	ba 00 00 00 00       	mov    $0x0,%edx
   42056:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   4205d:	0e 00 00 
   42060:	48 89 c6             	mov    %rax,%rsi
   42063:	48 8d 05 c6 30 01 00 	lea    0x130c6(%rip),%rax        # 55130 <interrupt_descriptors+0xd0>
   4206a:	48 89 c7             	mov    %rax,%rdi
   4206d:	e8 c8 fd ff ff       	call   41e3a <set_gate>
             (uint64_t) gpf_int_handler);
    set_gate(&interrupt_descriptors[INT_PAGEFAULT], X86GATE_INTERRUPT, 0,
   42072:	48 c7 c0 32 00 04 00 	mov    $0x40032,%rax
   42079:	48 89 c1             	mov    %rax,%rcx
   4207c:	ba 00 00 00 00       	mov    $0x0,%edx
   42081:	48 b8 00 00 00 00 00 	movabs $0xe0000000000,%rax
   42088:	0e 00 00 
   4208b:	48 89 c6             	mov    %rax,%rsi
   4208e:	48 8d 05 ab 30 01 00 	lea    0x130ab(%rip),%rax        # 55140 <interrupt_descriptors+0xe0>
   42095:	48 89 c7             	mov    %rax,%rdi
   42098:	e8 9d fd ff ff       	call   41e3a <set_gate>
             (uint64_t) pagefault_int_handler);

    // System calls get special handling.
    // Note that the last argument is '3'.  This means that unprivileged
    // (level-3) applications may generate these interrupts.
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   4209d:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%rbp)
   420a4:	eb 50                	jmp    420f6 <segments_init+0x242>
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
                 (uint64_t) sys_int_handlers[i - INT_SYS]);
   420a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
   420a9:	83 e8 30             	sub    $0x30,%eax
   420ac:	89 c0                	mov    %eax,%eax
   420ae:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   420b5:	00 
   420b6:	48 8d 05 2a e0 ff ff 	lea    -0x1fd6(%rip),%rax        # 400e7 <sys_int_handlers>
   420bd:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
        set_gate(&interrupt_descriptors[i], X86GATE_INTERRUPT, 3,
   420c1:	48 89 c2             	mov    %rax,%rdx
   420c4:	8b 45 f8             	mov    -0x8(%rbp),%eax
   420c7:	48 c1 e0 04          	shl    $0x4,%rax
   420cb:	48 89 c1             	mov    %rax,%rcx
   420ce:	48 8d 05 8b 2f 01 00 	lea    0x12f8b(%rip),%rax        # 55060 <interrupt_descriptors>
   420d5:	48 01 c8             	add    %rcx,%rax
   420d8:	48 89 d1             	mov    %rdx,%rcx
   420db:	ba 03 00 00 00       	mov    $0x3,%edx
   420e0:	48 be 00 00 00 00 00 	movabs $0xe0000000000,%rsi
   420e7:	0e 00 00 
   420ea:	48 89 c7             	mov    %rax,%rdi
   420ed:	e8 48 fd ff ff       	call   41e3a <set_gate>
    for (unsigned i = INT_SYS; i < INT_SYS + 16; ++i) {
   420f2:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   420f6:	83 7d f8 3f          	cmpl   $0x3f,-0x8(%rbp)
   420fa:	76 aa                	jbe    420a6 <segments_init+0x1f2>
    }

    x86_64_pseudodescriptor idt;
    idt.pseudod_limit = sizeof(interrupt_descriptors) - 1;
   420fc:	66 c7 45 cc ff 0f    	movw   $0xfff,-0x34(%rbp)
    idt.pseudod_base = (uint64_t) interrupt_descriptors;
   42102:	48 8d 05 57 2f 01 00 	lea    0x12f57(%rip),%rax        # 55060 <interrupt_descriptors>
   42109:	48 89 45 ce          	mov    %rax,-0x32(%rbp)

    // Reload segment pointers
    asm volatile("lgdt %0\n\t"
   4210d:	b8 28 00 00 00       	mov    $0x28,%eax
   42112:	0f 01 55 d6          	lgdt   -0x2a(%rbp)
   42116:	0f 00 d8             	ltr    %ax
   42119:	0f 01 5d cc          	lidt   -0x34(%rbp)
    asm volatile("movq %%cr0,%0" : "=r" (val));
   4211d:	0f 20 c0             	mov    %cr0,%rax
   42120:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    return val;
   42124:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
                     "r" ((uint16_t) SEGSEL_TASKSTATE),
                     "m" (idt)
                 : "memory");

    // Set up control registers: check alignment
    uint32_t cr0 = rcr0();
   42128:	89 45 f4             	mov    %eax,-0xc(%rbp)
    cr0 |= CR0_PE | CR0_PG | CR0_WP | CR0_AM | CR0_MP | CR0_NE;
   4212b:	81 4d f4 23 00 05 80 	orl    $0x80050023,-0xc(%rbp)
   42132:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42135:	89 45 f0             	mov    %eax,-0x10(%rbp)
    uint64_t xval = val;
   42138:	8b 45 f0             	mov    -0x10(%rbp),%eax
   4213b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    asm volatile("movq %0,%%cr0" : : "r" (xval));
   4213f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42143:	0f 22 c0             	mov    %rax,%cr0
}
   42146:	90                   	nop
    lcr0(cr0);
}
   42147:	90                   	nop
   42148:	c9                   	leave  
   42149:	c3                   	ret    

000000000004214a <interrupt_mask>:
#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

static uint16_t interrupts_enabled;

static void interrupt_mask(void) {
   4214a:	f3 0f 1e fa          	endbr64 
   4214e:	55                   	push   %rbp
   4214f:	48 89 e5             	mov    %rsp,%rbp
   42152:	48 83 ec 20          	sub    $0x20,%rsp
    uint16_t masked = ~interrupts_enabled;
   42156:	0f b7 05 63 3f 01 00 	movzwl 0x13f63(%rip),%eax        # 560c0 <interrupts_enabled>
   4215d:	f7 d0                	not    %eax
   4215f:	66 89 45 fe          	mov    %ax,-0x2(%rbp)
    outb(IO_PIC1+1, masked & 0xFF);
   42163:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   42167:	0f b6 c0             	movzbl %al,%eax
   4216a:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%rbp)
   42171:	88 45 ef             	mov    %al,-0x11(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42174:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42178:	8b 55 f0             	mov    -0x10(%rbp),%edx
   4217b:	ee                   	out    %al,(%dx)
}
   4217c:	90                   	nop
    outb(IO_PIC2+1, (masked >> 8) & 0xFF);
   4217d:	0f b7 45 fe          	movzwl -0x2(%rbp),%eax
   42181:	66 c1 e8 08          	shr    $0x8,%ax
   42185:	0f b6 c0             	movzbl %al,%eax
   42188:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%rbp)
   4218f:	88 45 f7             	mov    %al,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42192:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   42196:	8b 55 f8             	mov    -0x8(%rbp),%edx
   42199:	ee                   	out    %al,(%dx)
}
   4219a:	90                   	nop
}
   4219b:	90                   	nop
   4219c:	c9                   	leave  
   4219d:	c3                   	ret    

000000000004219e <interrupt_init>:

void interrupt_init(void) {
   4219e:	f3 0f 1e fa          	endbr64 
   421a2:	55                   	push   %rbp
   421a3:	48 89 e5             	mov    %rsp,%rbp
   421a6:	48 83 ec 60          	sub    $0x60,%rsp
    // mask all interrupts
    interrupts_enabled = 0;
   421aa:	66 c7 05 0d 3f 01 00 	movw   $0x0,0x13f0d(%rip)        # 560c0 <interrupts_enabled>
   421b1:	00 00 
    interrupt_mask();
   421b3:	e8 92 ff ff ff       	call   4214a <interrupt_mask>
   421b8:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%rbp)
   421bf:	c6 45 a3 11          	movb   $0x11,-0x5d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421c3:	0f b6 45 a3          	movzbl -0x5d(%rbp),%eax
   421c7:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   421ca:	ee                   	out    %al,(%dx)
}
   421cb:	90                   	nop
   421cc:	c7 45 ac 21 00 00 00 	movl   $0x21,-0x54(%rbp)
   421d3:	c6 45 ab 20          	movb   $0x20,-0x55(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421d7:	0f b6 45 ab          	movzbl -0x55(%rbp),%eax
   421db:	8b 55 ac             	mov    -0x54(%rbp),%edx
   421de:	ee                   	out    %al,(%dx)
}
   421df:	90                   	nop
   421e0:	c7 45 b4 21 00 00 00 	movl   $0x21,-0x4c(%rbp)
   421e7:	c6 45 b3 04          	movb   $0x4,-0x4d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421eb:	0f b6 45 b3          	movzbl -0x4d(%rbp),%eax
   421ef:	8b 55 b4             	mov    -0x4c(%rbp),%edx
   421f2:	ee                   	out    %al,(%dx)
}
   421f3:	90                   	nop
   421f4:	c7 45 bc 21 00 00 00 	movl   $0x21,-0x44(%rbp)
   421fb:	c6 45 bb 03          	movb   $0x3,-0x45(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   421ff:	0f b6 45 bb          	movzbl -0x45(%rbp),%eax
   42203:	8b 55 bc             	mov    -0x44(%rbp),%edx
   42206:	ee                   	out    %al,(%dx)
}
   42207:	90                   	nop
   42208:	c7 45 c4 a0 00 00 00 	movl   $0xa0,-0x3c(%rbp)
   4220f:	c6 45 c3 11          	movb   $0x11,-0x3d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42213:	0f b6 45 c3          	movzbl -0x3d(%rbp),%eax
   42217:	8b 55 c4             	mov    -0x3c(%rbp),%edx
   4221a:	ee                   	out    %al,(%dx)
}
   4221b:	90                   	nop
   4221c:	c7 45 cc a1 00 00 00 	movl   $0xa1,-0x34(%rbp)
   42223:	c6 45 cb 28          	movb   $0x28,-0x35(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42227:	0f b6 45 cb          	movzbl -0x35(%rbp),%eax
   4222b:	8b 55 cc             	mov    -0x34(%rbp),%edx
   4222e:	ee                   	out    %al,(%dx)
}
   4222f:	90                   	nop
   42230:	c7 45 d4 a1 00 00 00 	movl   $0xa1,-0x2c(%rbp)
   42237:	c6 45 d3 02          	movb   $0x2,-0x2d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4223b:	0f b6 45 d3          	movzbl -0x2d(%rbp),%eax
   4223f:	8b 55 d4             	mov    -0x2c(%rbp),%edx
   42242:	ee                   	out    %al,(%dx)
}
   42243:	90                   	nop
   42244:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%rbp)
   4224b:	c6 45 db 01          	movb   $0x1,-0x25(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4224f:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
   42253:	8b 55 dc             	mov    -0x24(%rbp),%edx
   42256:	ee                   	out    %al,(%dx)
}
   42257:	90                   	nop
   42258:	c7 45 e4 20 00 00 00 	movl   $0x20,-0x1c(%rbp)
   4225f:	c6 45 e3 68          	movb   $0x68,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42263:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   42267:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   4226a:	ee                   	out    %al,(%dx)
}
   4226b:	90                   	nop
   4226c:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
   42273:	c6 45 eb 0a          	movb   $0xa,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42277:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   4227b:	8b 55 ec             	mov    -0x14(%rbp),%edx
   4227e:	ee                   	out    %al,(%dx)
}
   4227f:	90                   	nop
   42280:	c7 45 f4 a0 00 00 00 	movl   $0xa0,-0xc(%rbp)
   42287:	c6 45 f3 68          	movb   $0x68,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4228b:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   4228f:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42292:	ee                   	out    %al,(%dx)
}
   42293:	90                   	nop
   42294:	c7 45 fc a0 00 00 00 	movl   $0xa0,-0x4(%rbp)
   4229b:	c6 45 fb 0a          	movb   $0xa,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4229f:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   422a3:	8b 55 fc             	mov    -0x4(%rbp),%edx
   422a6:	ee                   	out    %al,(%dx)
}
   422a7:	90                   	nop

    outb(IO_PIC2, 0x68);               /* OCW3 */
    outb(IO_PIC2, 0x0a);               /* OCW3 */

    // re-disable interrupts
    interrupt_mask();
   422a8:	e8 9d fe ff ff       	call   4214a <interrupt_mask>
}
   422ad:	90                   	nop
   422ae:	c9                   	leave  
   422af:	c3                   	ret    

00000000000422b0 <timer_init>:

// timer_init(rate)
//    Set the timer interrupt to fire `rate` times a second. Disables the
//    timer interrupt if `rate <= 0`.

void timer_init(int rate) {
   422b0:	f3 0f 1e fa          	endbr64 
   422b4:	55                   	push   %rbp
   422b5:	48 89 e5             	mov    %rsp,%rbp
   422b8:	48 83 ec 28          	sub    $0x28,%rsp
   422bc:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (rate > 0) {
   422bf:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   422c3:	0f 8e 9f 00 00 00    	jle    42368 <timer_init+0xb8>
   422c9:	c7 45 ec 43 00 00 00 	movl   $0x43,-0x14(%rbp)
   422d0:	c6 45 eb 34          	movb   $0x34,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   422d4:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   422d8:	8b 55 ec             	mov    -0x14(%rbp),%edx
   422db:	ee                   	out    %al,(%dx)
}
   422dc:	90                   	nop
        outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
        outb(IO_TIMER1, TIMER_DIV(rate) % 256);
   422dd:	8b 45 dc             	mov    -0x24(%rbp),%eax
   422e0:	89 c2                	mov    %eax,%edx
   422e2:	c1 ea 1f             	shr    $0x1f,%edx
   422e5:	01 d0                	add    %edx,%eax
   422e7:	d1 f8                	sar    %eax
   422e9:	05 de 34 12 00       	add    $0x1234de,%eax
   422ee:	99                   	cltd   
   422ef:	f7 7d dc             	idivl  -0x24(%rbp)
   422f2:	89 c2                	mov    %eax,%edx
   422f4:	89 d0                	mov    %edx,%eax
   422f6:	c1 f8 1f             	sar    $0x1f,%eax
   422f9:	c1 e8 18             	shr    $0x18,%eax
   422fc:	89 c1                	mov    %eax,%ecx
   422fe:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
   42301:	0f b6 c0             	movzbl %al,%eax
   42304:	29 c8                	sub    %ecx,%eax
   42306:	0f b6 c0             	movzbl %al,%eax
   42309:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%rbp)
   42310:	88 45 f3             	mov    %al,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42313:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42317:	8b 55 f4             	mov    -0xc(%rbp),%edx
   4231a:	ee                   	out    %al,(%dx)
}
   4231b:	90                   	nop
        outb(IO_TIMER1, TIMER_DIV(rate) / 256);
   4231c:	8b 45 dc             	mov    -0x24(%rbp),%eax
   4231f:	89 c2                	mov    %eax,%edx
   42321:	c1 ea 1f             	shr    $0x1f,%edx
   42324:	01 d0                	add    %edx,%eax
   42326:	d1 f8                	sar    %eax
   42328:	05 de 34 12 00       	add    $0x1234de,%eax
   4232d:	99                   	cltd   
   4232e:	f7 7d dc             	idivl  -0x24(%rbp)
   42331:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   42337:	85 c0                	test   %eax,%eax
   42339:	0f 48 c2             	cmovs  %edx,%eax
   4233c:	c1 f8 08             	sar    $0x8,%eax
   4233f:	0f b6 c0             	movzbl %al,%eax
   42342:	c7 45 fc 40 00 00 00 	movl   $0x40,-0x4(%rbp)
   42349:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4234c:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42350:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42353:	ee                   	out    %al,(%dx)
}
   42354:	90                   	nop
        interrupts_enabled |= 1 << (INT_TIMER - INT_HARDWARE);
   42355:	0f b7 05 64 3d 01 00 	movzwl 0x13d64(%rip),%eax        # 560c0 <interrupts_enabled>
   4235c:	83 c8 01             	or     $0x1,%eax
   4235f:	66 89 05 5a 3d 01 00 	mov    %ax,0x13d5a(%rip)        # 560c0 <interrupts_enabled>
   42366:	eb 11                	jmp    42379 <timer_init+0xc9>
    } else {
        interrupts_enabled &= ~(1 << (INT_TIMER - INT_HARDWARE));
   42368:	0f b7 05 51 3d 01 00 	movzwl 0x13d51(%rip),%eax        # 560c0 <interrupts_enabled>
   4236f:	83 e0 fe             	and    $0xfffffffe,%eax
   42372:	66 89 05 47 3d 01 00 	mov    %ax,0x13d47(%rip)        # 560c0 <interrupts_enabled>
    }
    interrupt_mask();
   42379:	e8 cc fd ff ff       	call   4214a <interrupt_mask>
}
   4237e:	90                   	nop
   4237f:	c9                   	leave  
   42380:	c3                   	ret    

0000000000042381 <virtual_memory_init>:
//    `kernel_pagetable`.

static x86_64_pagetable kernel_pagetables[5];
x86_64_pagetable* kernel_pagetable;

void virtual_memory_init(void) {
   42381:	f3 0f 1e fa          	endbr64 
   42385:	55                   	push   %rbp
   42386:	48 89 e5             	mov    %rsp,%rbp
   42389:	48 83 ec 10          	sub    $0x10,%rsp
    kernel_pagetable = &kernel_pagetables[0];
   4238d:	48 8d 05 6c 4c 01 00 	lea    0x14c6c(%rip),%rax        # 57000 <kernel_pagetables>
   42394:	48 89 05 65 2c 01 00 	mov    %rax,0x12c65(%rip)        # 55000 <kernel_pagetable>
    memset(kernel_pagetables, 0, sizeof(kernel_pagetables));
   4239b:	ba 00 50 00 00       	mov    $0x5000,%edx
   423a0:	be 00 00 00 00       	mov    $0x0,%esi
   423a5:	48 8d 05 54 4c 01 00 	lea    0x14c54(%rip),%rax        # 57000 <kernel_pagetables>
   423ac:	48 89 c7             	mov    %rax,%rdi
   423af:	e8 67 15 00 00       	call   4391b <memset>
    kernel_pagetables[0].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[1] | PTE_P | PTE_W | PTE_U;
   423b4:	48 8d 05 45 5c 01 00 	lea    0x15c45(%rip),%rax        # 58000 <kernel_pagetables+0x1000>
   423bb:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[0].entry[0] =
   423bf:	48 89 05 3a 4c 01 00 	mov    %rax,0x14c3a(%rip)        # 57000 <kernel_pagetables>
    kernel_pagetables[1].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[2] | PTE_P | PTE_W | PTE_U;
   423c6:	48 8d 05 33 6c 01 00 	lea    0x16c33(%rip),%rax        # 59000 <kernel_pagetables+0x2000>
   423cd:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[1].entry[0] =
   423d1:	48 89 05 28 5c 01 00 	mov    %rax,0x15c28(%rip)        # 58000 <kernel_pagetables+0x1000>
    kernel_pagetables[2].entry[0] =
        (x86_64_pageentry_t) &kernel_pagetables[3] | PTE_P | PTE_W | PTE_U;
   423d8:	48 8d 05 21 7c 01 00 	lea    0x17c21(%rip),%rax        # 5a000 <kernel_pagetables+0x3000>
   423df:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[0] =
   423e3:	48 89 05 16 6c 01 00 	mov    %rax,0x16c16(%rip)        # 59000 <kernel_pagetables+0x2000>
    kernel_pagetables[2].entry[1] =
        (x86_64_pageentry_t) &kernel_pagetables[4] | PTE_P | PTE_W | PTE_U;
   423ea:	48 8d 05 0f 8c 01 00 	lea    0x18c0f(%rip),%rax        # 5b000 <kernel_pagetables+0x4000>
   423f1:	48 83 c8 07          	or     $0x7,%rax
    kernel_pagetables[2].entry[1] =
   423f5:	48 89 05 0c 6c 01 00 	mov    %rax,0x16c0c(%rip)        # 59008 <kernel_pagetables+0x2008>

    virtual_memory_map(kernel_pagetable, (uintptr_t) 0, (uintptr_t) 0,
   423fc:	48 8b 05 fd 2b 01 00 	mov    0x12bfd(%rip),%rax        # 55000 <kernel_pagetable>
   42403:	41 b9 00 00 00 00    	mov    $0x0,%r9d
   42409:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4240f:	b9 00 00 20 00       	mov    $0x200000,%ecx
   42414:	ba 00 00 00 00       	mov    $0x0,%edx
   42419:	be 00 00 00 00       	mov    $0x0,%esi
   4241e:	48 89 c7             	mov    %rax,%rdi
   42421:	e8 16 00 00 00       	call   4243c <virtual_memory_map>
                       MEMSIZE_PHYSICAL, PTE_P | PTE_W | PTE_U, NULL);

    lcr3((uintptr_t) kernel_pagetable);
   42426:	48 8b 05 d3 2b 01 00 	mov    0x12bd3(%rip),%rax        # 55000 <kernel_pagetable>
   4242d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
}

static inline void lcr3(uintptr_t val) {
    asm volatile("" : : : "memory");
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42431:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42435:	0f 22 d8             	mov    %rax,%cr3
}
   42438:	90                   	nop
}
   42439:	90                   	nop
   4243a:	c9                   	leave  
   4243b:	c3                   	ret    

000000000004243c <virtual_memory_map>:
static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable,
                 uintptr_t va, int perm, x86_64_pagetable* (*allocator)(void));

int virtual_memory_map(x86_64_pagetable* pagetable, uintptr_t va,
                       uintptr_t pa, size_t sz, int perm,
                       x86_64_pagetable* (*allocator)(void)) {
   4243c:	f3 0f 1e fa          	endbr64 
   42440:	55                   	push   %rbp
   42441:	48 89 e5             	mov    %rsp,%rbp
   42444:	53                   	push   %rbx
   42445:	48 83 ec 58          	sub    $0x58,%rsp
   42449:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   4244d:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   42451:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   42455:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   42459:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
   4245d:	4c 89 4d a0          	mov    %r9,-0x60(%rbp)
    assert(va % PAGESIZE == 0); // virtual address is page-aligned
   42461:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42465:	25 ff 0f 00 00       	and    $0xfff,%eax
   4246a:	48 85 c0             	test   %rax,%rax
   4246d:	74 1e                	je     4248d <virtual_memory_map+0x51>
   4246f:	48 8d 05 0c 22 00 00 	lea    0x220c(%rip),%rax        # 44682 <memstate_colors+0x142>
   42476:	48 89 c2             	mov    %rax,%rdx
   42479:	be 3b 01 00 00       	mov    $0x13b,%esi
   4247e:	48 8d 05 10 22 00 00 	lea    0x2210(%rip),%rax        # 44695 <memstate_colors+0x155>
   42485:	48 89 c7             	mov    %rax,%rdi
   42488:	e8 6a 10 00 00       	call   434f7 <assert_fail>
    assert(sz % PAGESIZE == 0); // size is a multiple of PAGESIZE
   4248d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   42491:	25 ff 0f 00 00       	and    $0xfff,%eax
   42496:	48 85 c0             	test   %rax,%rax
   42499:	74 1e                	je     424b9 <virtual_memory_map+0x7d>
   4249b:	48 8d 05 00 22 00 00 	lea    0x2200(%rip),%rax        # 446a2 <memstate_colors+0x162>
   424a2:	48 89 c2             	mov    %rax,%rdx
   424a5:	be 3c 01 00 00       	mov    $0x13c,%esi
   424aa:	48 8d 05 e4 21 00 00 	lea    0x21e4(%rip),%rax        # 44695 <memstate_colors+0x155>
   424b1:	48 89 c7             	mov    %rax,%rdi
   424b4:	e8 3e 10 00 00       	call   434f7 <assert_fail>
    assert(va + sz >= va || va + sz == 0); // va range does not wrap
   424b9:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   424bd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   424c1:	48 01 d0             	add    %rdx,%rax
   424c4:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
   424c8:	76 2e                	jbe    424f8 <virtual_memory_map+0xbc>
   424ca:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
   424ce:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   424d2:	48 01 d0             	add    %rdx,%rax
   424d5:	48 85 c0             	test   %rax,%rax
   424d8:	74 1e                	je     424f8 <virtual_memory_map+0xbc>
   424da:	48 8d 05 d4 21 00 00 	lea    0x21d4(%rip),%rax        # 446b5 <memstate_colors+0x175>
   424e1:	48 89 c2             	mov    %rax,%rdx
   424e4:	be 3d 01 00 00       	mov    $0x13d,%esi
   424e9:	48 8d 05 a5 21 00 00 	lea    0x21a5(%rip),%rax        # 44695 <memstate_colors+0x155>
   424f0:	48 89 c7             	mov    %rax,%rdi
   424f3:	e8 ff 0f 00 00       	call   434f7 <assert_fail>
    if (perm & PTE_P) {
   424f8:	8b 45 ac             	mov    -0x54(%rbp),%eax
   424fb:	48 98                	cltq   
   424fd:	83 e0 01             	and    $0x1,%eax
   42500:	48 85 c0             	test   %rax,%rax
   42503:	0f 84 8c 00 00 00    	je     42595 <virtual_memory_map+0x159>
        assert(pa % PAGESIZE == 0); // physical addr is page-aligned
   42509:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4250d:	25 ff 0f 00 00       	and    $0xfff,%eax
   42512:	48 85 c0             	test   %rax,%rax
   42515:	74 1e                	je     42535 <virtual_memory_map+0xf9>
   42517:	48 8d 05 b5 21 00 00 	lea    0x21b5(%rip),%rax        # 446d3 <memstate_colors+0x193>
   4251e:	48 89 c2             	mov    %rax,%rdx
   42521:	be 3f 01 00 00       	mov    $0x13f,%esi
   42526:	48 8d 05 68 21 00 00 	lea    0x2168(%rip),%rax        # 44695 <memstate_colors+0x155>
   4252d:	48 89 c7             	mov    %rax,%rdi
   42530:	e8 c2 0f 00 00       	call   434f7 <assert_fail>
        assert(pa + sz >= pa);      // physical address range does not wrap
   42535:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42539:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4253d:	48 01 d0             	add    %rdx,%rax
   42540:	48 39 45 b8          	cmp    %rax,-0x48(%rbp)
   42544:	76 1e                	jbe    42564 <virtual_memory_map+0x128>
   42546:	48 8d 05 99 21 00 00 	lea    0x2199(%rip),%rax        # 446e6 <memstate_colors+0x1a6>
   4254d:	48 89 c2             	mov    %rax,%rdx
   42550:	be 40 01 00 00       	mov    $0x140,%esi
   42555:	48 8d 05 39 21 00 00 	lea    0x2139(%rip),%rax        # 44695 <memstate_colors+0x155>
   4255c:	48 89 c7             	mov    %rax,%rdi
   4255f:	e8 93 0f 00 00       	call   434f7 <assert_fail>
        assert(pa + sz <= MEMSIZE_PHYSICAL); // physical addresses exist
   42564:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42568:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
   4256c:	48 01 d0             	add    %rdx,%rax
   4256f:	48 3d 00 00 20 00    	cmp    $0x200000,%rax
   42575:	76 1e                	jbe    42595 <virtual_memory_map+0x159>
   42577:	48 8d 05 76 21 00 00 	lea    0x2176(%rip),%rax        # 446f4 <memstate_colors+0x1b4>
   4257e:	48 89 c2             	mov    %rax,%rdx
   42581:	be 41 01 00 00       	mov    $0x141,%esi
   42586:	48 8d 05 08 21 00 00 	lea    0x2108(%rip),%rax        # 44695 <memstate_colors+0x155>
   4258d:	48 89 c7             	mov    %rax,%rdi
   42590:	e8 62 0f 00 00       	call   434f7 <assert_fail>
    }
    assert(perm >= 0 && perm < 0x1000); // `perm` makes sense
   42595:	83 7d ac 00          	cmpl   $0x0,-0x54(%rbp)
   42599:	78 09                	js     425a4 <virtual_memory_map+0x168>
   4259b:	81 7d ac ff 0f 00 00 	cmpl   $0xfff,-0x54(%rbp)
   425a2:	7e 1e                	jle    425c2 <virtual_memory_map+0x186>
   425a4:	48 8d 05 65 21 00 00 	lea    0x2165(%rip),%rax        # 44710 <memstate_colors+0x1d0>
   425ab:	48 89 c2             	mov    %rax,%rdx
   425ae:	be 43 01 00 00       	mov    $0x143,%esi
   425b3:	48 8d 05 db 20 00 00 	lea    0x20db(%rip),%rax        # 44695 <memstate_colors+0x155>
   425ba:	48 89 c7             	mov    %rax,%rdi
   425bd:	e8 35 0f 00 00       	call   434f7 <assert_fail>
    assert((uintptr_t) pagetable % PAGESIZE == 0); // `pagetable` page-aligned
   425c2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   425c6:	25 ff 0f 00 00       	and    $0xfff,%eax
   425cb:	48 85 c0             	test   %rax,%rax
   425ce:	74 1e                	je     425ee <virtual_memory_map+0x1b2>
   425d0:	48 8d 05 59 21 00 00 	lea    0x2159(%rip),%rax        # 44730 <memstate_colors+0x1f0>
   425d7:	48 89 c2             	mov    %rax,%rdx
   425da:	be 44 01 00 00       	mov    $0x144,%esi
   425df:	48 8d 05 af 20 00 00 	lea    0x20af(%rip),%rax        # 44695 <memstate_colors+0x155>
   425e6:	48 89 c7             	mov    %rax,%rdi
   425e9:	e8 09 0f 00 00       	call   434f7 <assert_fail>

    int last_index123 = -1;
   425ee:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%rbp)
    x86_64_pagetable* l4pagetable = NULL;
   425f5:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
   425fc:	00 
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   425fd:	e9 ce 00 00 00       	jmp    426d0 <virtual_memory_map+0x294>
        int cur_index123 = (va >> (PAGEOFFBITS + PAGEINDEXBITS));
   42602:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42606:	48 c1 e8 15          	shr    $0x15,%rax
   4260a:	89 45 dc             	mov    %eax,-0x24(%rbp)
        if (cur_index123 != last_index123) {
   4260d:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42610:	3b 45 ec             	cmp    -0x14(%rbp),%eax
   42613:	74 21                	je     42636 <virtual_memory_map+0x1fa>
            l4pagetable = lookup_l4pagetable(pagetable, va, perm, allocator);
   42615:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
   42619:	8b 55 ac             	mov    -0x54(%rbp),%edx
   4261c:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
   42620:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   42624:	48 89 c7             	mov    %rax,%rdi
   42627:	e8 ba 00 00 00       	call   426e6 <lookup_l4pagetable>
   4262c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            last_index123 = cur_index123;
   42630:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42633:	89 45 ec             	mov    %eax,-0x14(%rbp)
        }
        if ((perm & PTE_P) && l4pagetable) {
   42636:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42639:	48 98                	cltq   
   4263b:	83 e0 01             	and    $0x1,%eax
   4263e:	48 85 c0             	test   %rax,%rax
   42641:	74 34                	je     42677 <virtual_memory_map+0x23b>
   42643:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42648:	74 2d                	je     42677 <virtual_memory_map+0x23b>
            l4pagetable->entry[L4PAGEINDEX(va)] = pa | perm;
   4264a:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4264d:	48 63 d8             	movslq %eax,%rbx
   42650:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42654:	be 03 00 00 00       	mov    $0x3,%esi
   42659:	48 89 c7             	mov    %rax,%rdi
   4265c:	e8 87 f6 ff ff       	call   41ce8 <pageindex>
   42661:	89 c2                	mov    %eax,%edx
   42663:	48 0b 5d b8          	or     -0x48(%rbp),%rbx
   42667:	48 89 d9             	mov    %rbx,%rcx
   4266a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4266e:	48 63 d2             	movslq %edx,%rdx
   42671:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   42675:	eb 41                	jmp    426b8 <virtual_memory_map+0x27c>
        } else if (l4pagetable) {
   42677:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   4267c:	74 26                	je     426a4 <virtual_memory_map+0x268>
            l4pagetable->entry[L4PAGEINDEX(va)] = perm;
   4267e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42682:	be 03 00 00 00       	mov    $0x3,%esi
   42687:	48 89 c7             	mov    %rax,%rdi
   4268a:	e8 59 f6 ff ff       	call   41ce8 <pageindex>
   4268f:	89 c2                	mov    %eax,%edx
   42691:	8b 45 ac             	mov    -0x54(%rbp),%eax
   42694:	48 63 c8             	movslq %eax,%rcx
   42697:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   4269b:	48 63 d2             	movslq %edx,%rdx
   4269e:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
   426a2:	eb 14                	jmp    426b8 <virtual_memory_map+0x27c>
        } else if (perm & PTE_P) {
   426a4:	8b 45 ac             	mov    -0x54(%rbp),%eax
   426a7:	48 98                	cltq   
   426a9:	83 e0 01             	and    $0x1,%eax
   426ac:	48 85 c0             	test   %rax,%rax
   426af:	74 07                	je     426b8 <virtual_memory_map+0x27c>
            return -1;
   426b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   426b6:	eb 28                	jmp    426e0 <virtual_memory_map+0x2a4>
    for (; sz != 0; va += PAGESIZE, pa += PAGESIZE, sz -= PAGESIZE) {
   426b8:	48 81 45 c0 00 10 00 	addq   $0x1000,-0x40(%rbp)
   426bf:	00 
   426c0:	48 81 45 b8 00 10 00 	addq   $0x1000,-0x48(%rbp)
   426c7:	00 
   426c8:	48 81 6d b0 00 10 00 	subq   $0x1000,-0x50(%rbp)
   426cf:	00 
   426d0:	48 83 7d b0 00       	cmpq   $0x0,-0x50(%rbp)
   426d5:	0f 85 27 ff ff ff    	jne    42602 <virtual_memory_map+0x1c6>
        }
    }
    return 0;
   426db:	b8 00 00 00 00       	mov    $0x0,%eax
}
   426e0:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   426e4:	c9                   	leave  
   426e5:	c3                   	ret    

00000000000426e6 <lookup_l4pagetable>:

static x86_64_pagetable* lookup_l4pagetable(x86_64_pagetable* pagetable,
                 uintptr_t va, int perm, x86_64_pagetable* (*allocator)(void)) {
   426e6:	f3 0f 1e fa          	endbr64 
   426ea:	55                   	push   %rbp
   426eb:	48 89 e5             	mov    %rsp,%rbp
   426ee:	48 83 ec 40          	sub    $0x40,%rsp
   426f2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   426f6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   426fa:	89 55 cc             	mov    %edx,-0x34(%rbp)
   426fd:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    x86_64_pagetable* pt = pagetable;
   42701:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   42705:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   42709:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42710:	e9 91 01 00 00       	jmp    428a6 <lookup_l4pagetable+0x1c0>
        x86_64_pageentry_t pe = pt->entry[PAGEINDEX(va, i)];
   42715:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42718:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4271c:	89 d6                	mov    %edx,%esi
   4271e:	48 89 c7             	mov    %rax,%rdi
   42721:	e8 c2 f5 ff ff       	call   41ce8 <pageindex>
   42726:	89 c2                	mov    %eax,%edx
   42728:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   4272c:	48 63 d2             	movslq %edx,%rdx
   4272f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   42733:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        if (!(pe & PTE_P)) {
   42737:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4273b:	83 e0 01             	and    $0x1,%eax
   4273e:	48 85 c0             	test   %rax,%rax
   42741:	0f 85 af 00 00 00    	jne    427f6 <lookup_l4pagetable+0x110>
            // allocate a new page table page if required
            if (!(perm & PTE_P) || !allocator) {
   42747:	8b 45 cc             	mov    -0x34(%rbp),%eax
   4274a:	48 98                	cltq   
   4274c:	83 e0 01             	and    $0x1,%eax
   4274f:	48 85 c0             	test   %rax,%rax
   42752:	74 07                	je     4275b <lookup_l4pagetable+0x75>
   42754:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
   42759:	75 0a                	jne    42765 <lookup_l4pagetable+0x7f>
                return NULL;
   4275b:	b8 00 00 00 00       	mov    $0x0,%eax
   42760:	e9 4f 01 00 00       	jmp    428b4 <lookup_l4pagetable+0x1ce>
            }
            x86_64_pagetable* new_pt = allocator();
   42765:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   42769:	ff d0                	call   *%rax
   4276b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (!new_pt) {
   4276f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
   42774:	75 0a                	jne    42780 <lookup_l4pagetable+0x9a>
                return NULL;
   42776:	b8 00 00 00 00       	mov    $0x0,%eax
   4277b:	e9 34 01 00 00       	jmp    428b4 <lookup_l4pagetable+0x1ce>
            }
            assert((uintptr_t) new_pt % PAGESIZE == 0);
   42780:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   42784:	25 ff 0f 00 00       	and    $0xfff,%eax
   42789:	48 85 c0             	test   %rax,%rax
   4278c:	74 1e                	je     427ac <lookup_l4pagetable+0xc6>
   4278e:	48 8d 05 c3 1f 00 00 	lea    0x1fc3(%rip),%rax        # 44758 <memstate_colors+0x218>
   42795:	48 89 c2             	mov    %rax,%rdx
   42798:	be 67 01 00 00       	mov    $0x167,%esi
   4279d:	48 8d 05 f1 1e 00 00 	lea    0x1ef1(%rip),%rax        # 44695 <memstate_colors+0x155>
   427a4:	48 89 c7             	mov    %rax,%rdi
   427a7:	e8 4b 0d 00 00       	call   434f7 <assert_fail>
            pt->entry[PAGEINDEX(va, i)] = pe =
                PTE_ADDR(new_pt) | PTE_P | PTE_W | PTE_U;
   427ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   427b0:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
            pt->entry[PAGEINDEX(va, i)] = pe =
   427b6:	48 83 c8 07          	or     $0x7,%rax
   427ba:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   427be:	8b 55 f4             	mov    -0xc(%rbp),%edx
   427c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   427c5:	89 d6                	mov    %edx,%esi
   427c7:	48 89 c7             	mov    %rax,%rdi
   427ca:	e8 19 f5 ff ff       	call   41ce8 <pageindex>
   427cf:	89 c2                	mov    %eax,%edx
   427d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   427d5:	48 63 d2             	movslq %edx,%rdx
   427d8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   427dc:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
            memset(new_pt, 0, PAGESIZE);
   427e0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   427e4:	ba 00 10 00 00       	mov    $0x1000,%edx
   427e9:	be 00 00 00 00       	mov    $0x0,%esi
   427ee:	48 89 c7             	mov    %rax,%rdi
   427f1:	e8 25 11 00 00       	call   4391b <memset>
        }

        // sanity-check page entry
        assert(PTE_ADDR(pe) < MEMSIZE_PHYSICAL); // at sensible address
   427f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   427fa:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   42800:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   42806:	76 1e                	jbe    42826 <lookup_l4pagetable+0x140>
   42808:	48 8d 05 71 1f 00 00 	lea    0x1f71(%rip),%rax        # 44780 <memstate_colors+0x240>
   4280f:	48 89 c2             	mov    %rax,%rdx
   42812:	be 6e 01 00 00       	mov    $0x16e,%esi
   42817:	48 8d 05 77 1e 00 00 	lea    0x1e77(%rip),%rax        # 44695 <memstate_colors+0x155>
   4281e:	48 89 c7             	mov    %rax,%rdi
   42821:	e8 d1 0c 00 00       	call   434f7 <assert_fail>
        if (perm & PTE_W) {       // if requester wants PTE_W,
   42826:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42829:	48 98                	cltq   
   4282b:	83 e0 02             	and    $0x2,%eax
   4282e:	48 85 c0             	test   %rax,%rax
   42831:	74 2a                	je     4285d <lookup_l4pagetable+0x177>
            assert(pe & PTE_W);   //   entry must allow PTE_W
   42833:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42837:	83 e0 02             	and    $0x2,%eax
   4283a:	48 85 c0             	test   %rax,%rax
   4283d:	75 1e                	jne    4285d <lookup_l4pagetable+0x177>
   4283f:	48 8d 05 5a 1f 00 00 	lea    0x1f5a(%rip),%rax        # 447a0 <memstate_colors+0x260>
   42846:	48 89 c2             	mov    %rax,%rdx
   42849:	be 70 01 00 00       	mov    $0x170,%esi
   4284e:	48 8d 05 40 1e 00 00 	lea    0x1e40(%rip),%rax        # 44695 <memstate_colors+0x155>
   42855:	48 89 c7             	mov    %rax,%rdi
   42858:	e8 9a 0c 00 00       	call   434f7 <assert_fail>
        }
        if (perm & PTE_U) {       // if requester wants PTE_U,
   4285d:	8b 45 cc             	mov    -0x34(%rbp),%eax
   42860:	48 98                	cltq   
   42862:	83 e0 04             	and    $0x4,%eax
   42865:	48 85 c0             	test   %rax,%rax
   42868:	74 2a                	je     42894 <lookup_l4pagetable+0x1ae>
            assert(pe & PTE_U);   //   entry must allow PTE_U
   4286a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4286e:	83 e0 04             	and    $0x4,%eax
   42871:	48 85 c0             	test   %rax,%rax
   42874:	75 1e                	jne    42894 <lookup_l4pagetable+0x1ae>
   42876:	48 8d 05 2e 1f 00 00 	lea    0x1f2e(%rip),%rax        # 447ab <memstate_colors+0x26b>
   4287d:	48 89 c2             	mov    %rax,%rdx
   42880:	be 73 01 00 00       	mov    $0x173,%esi
   42885:	48 8d 05 09 1e 00 00 	lea    0x1e09(%rip),%rax        # 44695 <memstate_colors+0x155>
   4288c:	48 89 c7             	mov    %rax,%rdi
   4288f:	e8 63 0c 00 00       	call   434f7 <assert_fail>
        }

        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   42894:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42898:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4289e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 2; ++i) {
   428a2:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   428a6:	83 7d f4 02          	cmpl   $0x2,-0xc(%rbp)
   428aa:	0f 8e 65 fe ff ff    	jle    42715 <lookup_l4pagetable+0x2f>
    }
    return pt;
   428b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
   428b4:	c9                   	leave  
   428b5:	c3                   	ret    

00000000000428b6 <virtual_memory_lookup>:

// virtual_memory_lookup(pagetable, va)
//    Returns information about the mapping of the virtual address `va` in
//    `pagetable`. The information is returned as a `vamapping` object.

vamapping virtual_memory_lookup(x86_64_pagetable* pagetable, uintptr_t va) {
   428b6:	f3 0f 1e fa          	endbr64 
   428ba:	55                   	push   %rbp
   428bb:	48 89 e5             	mov    %rsp,%rbp
   428be:	48 83 ec 50          	sub    $0x50,%rsp
   428c2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   428c6:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   428ca:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
    x86_64_pagetable* pt = pagetable;
   428ce:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
   428d2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    x86_64_pageentry_t pe = 0;
   428d6:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
   428dd:	00 
    uint8_t perms = PTE_W | PTE_U | PTE_P;
   428de:	c6 45 ef 07          	movb   $0x7,-0x11(%rbp)

    for (int i = 0; i <= 3 && (perms & PTE_P); ++i) {
   428e2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
   428e9:	eb 3b                	jmp    42926 <virtual_memory_lookup+0x70>
        pe = pt->entry[PAGEINDEX(va,i)];
   428eb:	8b 55 e8             	mov    -0x18(%rbp),%edx
   428ee:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   428f2:	89 d6                	mov    %edx,%esi
   428f4:	48 89 c7             	mov    %rax,%rdi
   428f7:	e8 ec f3 ff ff       	call   41ce8 <pageindex>
   428fc:	89 c2                	mov    %eax,%edx
   428fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42902:	48 63 d2             	movslq %edx,%rdx
   42905:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
   42909:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        perms &= PTE_FLAGS(pe);
   4290d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42911:	20 45 ef             	and    %al,-0x11(%rbp)
        pt = (x86_64_pagetable*) PTE_ADDR(pe);
   42914:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42918:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4291e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for (int i = 0; i <= 3 && (perms & PTE_P); ++i) {
   42922:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
   42926:	83 7d e8 03          	cmpl   $0x3,-0x18(%rbp)
   4292a:	7f 0c                	jg     42938 <virtual_memory_lookup+0x82>
   4292c:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42930:	83 e0 01             	and    $0x1,%eax
   42933:	48 85 c0             	test   %rax,%rax
   42936:	75 b3                	jne    428eb <virtual_memory_lookup+0x35>
    }
    vamapping vam = { -1, (uintptr_t) -1, 0 };
   42938:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%rbp)
   4293f:	48 c7 45 d8 ff ff ff 	movq   $0xffffffffffffffff,-0x28(%rbp)
   42946:	ff 
   42947:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    if (perms & PTE_P) {
   4294e:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42952:	83 e0 01             	and    $0x1,%eax
   42955:	48 85 c0             	test   %rax,%rax
   42958:	74 2f                	je     42989 <virtual_memory_lookup+0xd3>
        vam.pn = PAGENUMBER(pe);
   4295a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4295e:	48 c1 e8 0c          	shr    $0xc,%rax
   42962:	89 45 d0             	mov    %eax,-0x30(%rbp)
        vam.pa = PTE_ADDR(pe) + PAGEOFFSET(va);
   42965:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   42969:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   4296f:	48 89 c2             	mov    %rax,%rdx
   42972:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42976:	25 ff 0f 00 00       	and    $0xfff,%eax
   4297b:	48 09 d0             	or     %rdx,%rax
   4297e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
        vam.perm = perms;
   42982:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   42986:	89 45 e0             	mov    %eax,-0x20(%rbp)
    }
    return vam;
   42989:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4298d:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   42991:	48 89 10             	mov    %rdx,(%rax)
   42994:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
   42998:	48 89 50 08          	mov    %rdx,0x8(%rax)
   4299c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   429a0:	48 89 50 10          	mov    %rdx,0x10(%rax)
}
   429a4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   429a8:	c9                   	leave  
   429a9:	c3                   	ret    

00000000000429aa <set_pagetable>:
// set_pagetable
//    Change page directory. lcr3() is the hardware instruction;
//    set_pagetable() additionally checks that important kernel procedures are
//    mappable in `pagetable`, and calls panic() if they aren't.

void set_pagetable(x86_64_pagetable* pagetable) {
   429aa:	f3 0f 1e fa          	endbr64 
   429ae:	55                   	push   %rbp
   429af:	48 89 e5             	mov    %rsp,%rbp
   429b2:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
   429b6:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    assert(PAGEOFFSET(pagetable) == 0); // must be page aligned
   429ba:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   429be:	25 ff 0f 00 00       	and    $0xfff,%eax
   429c3:	48 85 c0             	test   %rax,%rax
   429c6:	74 1e                	je     429e6 <set_pagetable+0x3c>
   429c8:	48 8d 05 e7 1d 00 00 	lea    0x1de7(%rip),%rax        # 447b6 <memstate_colors+0x276>
   429cf:	48 89 c2             	mov    %rax,%rdx
   429d2:	be 9a 01 00 00       	mov    $0x19a,%esi
   429d7:	48 8d 05 b7 1c 00 00 	lea    0x1cb7(%rip),%rax        # 44695 <memstate_colors+0x155>
   429de:	48 89 c7             	mov    %rax,%rdi
   429e1:	e8 11 0b 00 00       	call   434f7 <assert_fail>
    assert(virtual_memory_lookup(pagetable, (uintptr_t) default_int_handler).pa
   429e6:	48 c7 c0 9c 00 04 00 	mov    $0x4009c,%rax
   429ed:	48 89 c2             	mov    %rax,%rdx
   429f0:	48 8d 45 98          	lea    -0x68(%rbp),%rax
   429f4:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   429f8:	48 89 ce             	mov    %rcx,%rsi
   429fb:	48 89 c7             	mov    %rax,%rdi
   429fe:	e8 b3 fe ff ff       	call   428b6 <virtual_memory_lookup>
   42a03:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   42a07:	48 c7 c2 9c 00 04 00 	mov    $0x4009c,%rdx
   42a0e:	48 39 d0             	cmp    %rdx,%rax
   42a11:	74 1e                	je     42a31 <set_pagetable+0x87>
   42a13:	48 8d 05 be 1d 00 00 	lea    0x1dbe(%rip),%rax        # 447d8 <memstate_colors+0x298>
   42a1a:	48 89 c2             	mov    %rax,%rdx
   42a1d:	be 9b 01 00 00       	mov    $0x19b,%esi
   42a22:	48 8d 05 6c 1c 00 00 	lea    0x1c6c(%rip),%rax        # 44695 <memstate_colors+0x155>
   42a29:	48 89 c7             	mov    %rax,%rdi
   42a2c:	e8 c6 0a 00 00       	call   434f7 <assert_fail>
           == (uintptr_t) default_int_handler);
    assert(virtual_memory_lookup(kernel_pagetable, (uintptr_t) pagetable).pa
   42a31:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
   42a35:	48 8b 0d c4 25 01 00 	mov    0x125c4(%rip),%rcx        # 55000 <kernel_pagetable>
   42a3c:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   42a40:	48 89 ce             	mov    %rcx,%rsi
   42a43:	48 89 c7             	mov    %rax,%rdi
   42a46:	e8 6b fe ff ff       	call   428b6 <virtual_memory_lookup>
   42a4b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   42a4f:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42a53:	48 39 c2             	cmp    %rax,%rdx
   42a56:	74 1e                	je     42a76 <set_pagetable+0xcc>
   42a58:	48 8d 05 e1 1d 00 00 	lea    0x1de1(%rip),%rax        # 44840 <memstate_colors+0x300>
   42a5f:	48 89 c2             	mov    %rax,%rdx
   42a62:	be 9d 01 00 00       	mov    $0x19d,%esi
   42a67:	48 8d 05 27 1c 00 00 	lea    0x1c27(%rip),%rax        # 44695 <memstate_colors+0x155>
   42a6e:	48 89 c7             	mov    %rax,%rdi
   42a71:	e8 81 0a 00 00       	call   434f7 <assert_fail>
           == (uintptr_t) pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) kernel_pagetable).pa
   42a76:	48 8b 05 83 25 01 00 	mov    0x12583(%rip),%rax        # 55000 <kernel_pagetable>
   42a7d:	48 89 c2             	mov    %rax,%rdx
   42a80:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42a84:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42a88:	48 89 ce             	mov    %rcx,%rsi
   42a8b:	48 89 c7             	mov    %rax,%rdi
   42a8e:	e8 23 fe ff ff       	call   428b6 <virtual_memory_lookup>
   42a93:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   42a97:	48 8b 15 62 25 01 00 	mov    0x12562(%rip),%rdx        # 55000 <kernel_pagetable>
   42a9e:	48 39 d0             	cmp    %rdx,%rax
   42aa1:	74 1e                	je     42ac1 <set_pagetable+0x117>
   42aa3:	48 8d 05 f6 1d 00 00 	lea    0x1df6(%rip),%rax        # 448a0 <memstate_colors+0x360>
   42aaa:	48 89 c2             	mov    %rax,%rdx
   42aad:	be 9f 01 00 00       	mov    $0x19f,%esi
   42ab2:	48 8d 05 dc 1b 00 00 	lea    0x1bdc(%rip),%rax        # 44695 <memstate_colors+0x155>
   42ab9:	48 89 c7             	mov    %rax,%rdi
   42abc:	e8 36 0a 00 00       	call   434f7 <assert_fail>
           == (uintptr_t) kernel_pagetable);
    assert(virtual_memory_lookup(pagetable, (uintptr_t) virtual_memory_map).pa
   42ac1:	48 8d 15 74 f9 ff ff 	lea    -0x68c(%rip),%rdx        # 4243c <virtual_memory_map>
   42ac8:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
   42acc:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   42ad0:	48 89 ce             	mov    %rcx,%rsi
   42ad3:	48 89 c7             	mov    %rax,%rdi
   42ad6:	e8 db fd ff ff       	call   428b6 <virtual_memory_lookup>
   42adb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   42adf:	48 8d 15 56 f9 ff ff 	lea    -0x6aa(%rip),%rdx        # 4243c <virtual_memory_map>
   42ae6:	48 39 d0             	cmp    %rdx,%rax
   42ae9:	74 1e                	je     42b09 <set_pagetable+0x15f>
   42aeb:	48 8d 05 16 1e 00 00 	lea    0x1e16(%rip),%rax        # 44908 <memstate_colors+0x3c8>
   42af2:	48 89 c2             	mov    %rax,%rdx
   42af5:	be a1 01 00 00       	mov    $0x1a1,%esi
   42afa:	48 8d 05 94 1b 00 00 	lea    0x1b94(%rip),%rax        # 44695 <memstate_colors+0x155>
   42b01:	48 89 c7             	mov    %rax,%rdi
   42b04:	e8 ee 09 00 00       	call   434f7 <assert_fail>
           == (uintptr_t) virtual_memory_map);
    lcr3((uintptr_t) pagetable);
   42b09:	48 8b 45 88          	mov    -0x78(%rbp),%rax
   42b0d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   42b11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42b15:	0f 22 d8             	mov    %rax,%cr3
}
   42b18:	90                   	nop
}
   42b19:	90                   	nop
   42b1a:	c9                   	leave  
   42b1b:	c3                   	ret    

0000000000042b1c <physical_memory_isreserved>:
//    Returns non-zero iff `pa` is a reserved physical address.

#define IOPHYSMEM       0x000A0000
#define EXTPHYSMEM      0x00100000

int physical_memory_isreserved(uintptr_t pa) {
   42b1c:	f3 0f 1e fa          	endbr64 
   42b20:	55                   	push   %rbp
   42b21:	48 89 e5             	mov    %rsp,%rbp
   42b24:	48 83 ec 08          	sub    $0x8,%rsp
   42b28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return pa == 0 || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   42b2c:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
   42b31:	74 14                	je     42b47 <physical_memory_isreserved+0x2b>
   42b33:	48 81 7d f8 ff ff 09 	cmpq   $0x9ffff,-0x8(%rbp)
   42b3a:	00 
   42b3b:	76 11                	jbe    42b4e <physical_memory_isreserved+0x32>
   42b3d:	48 81 7d f8 ff ff 0f 	cmpq   $0xfffff,-0x8(%rbp)
   42b44:	00 
   42b45:	77 07                	ja     42b4e <physical_memory_isreserved+0x32>
   42b47:	b8 01 00 00 00       	mov    $0x1,%eax
   42b4c:	eb 05                	jmp    42b53 <physical_memory_isreserved+0x37>
   42b4e:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42b53:	c9                   	leave  
   42b54:	c3                   	ret    

0000000000042b55 <pci_make_configaddr>:


// pci_make_configaddr(bus, slot, func)
//    Construct a PCI configuration space address from parts.

static int pci_make_configaddr(int bus, int slot, int func) {
   42b55:	f3 0f 1e fa          	endbr64 
   42b59:	55                   	push   %rbp
   42b5a:	48 89 e5             	mov    %rsp,%rbp
   42b5d:	48 83 ec 10          	sub    $0x10,%rsp
   42b61:	89 7d fc             	mov    %edi,-0x4(%rbp)
   42b64:	89 75 f8             	mov    %esi,-0x8(%rbp)
   42b67:	89 55 f4             	mov    %edx,-0xc(%rbp)
    return (bus << 16) | (slot << 11) | (func << 8);
   42b6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42b6d:	c1 e0 10             	shl    $0x10,%eax
   42b70:	89 c2                	mov    %eax,%edx
   42b72:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42b75:	c1 e0 0b             	shl    $0xb,%eax
   42b78:	09 c2                	or     %eax,%edx
   42b7a:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42b7d:	c1 e0 08             	shl    $0x8,%eax
   42b80:	09 d0                	or     %edx,%eax
}
   42b82:	c9                   	leave  
   42b83:	c3                   	ret    

0000000000042b84 <pci_config_readl>:
//    Read a 32-bit word in PCI configuration space.

#define PCI_HOST_BRIDGE_CONFIG_ADDR 0xCF8
#define PCI_HOST_BRIDGE_CONFIG_DATA 0xCFC

static uint32_t pci_config_readl(int configaddr, int offset) {
   42b84:	f3 0f 1e fa          	endbr64 
   42b88:	55                   	push   %rbp
   42b89:	48 89 e5             	mov    %rsp,%rbp
   42b8c:	48 83 ec 18          	sub    $0x18,%rsp
   42b90:	89 7d ec             	mov    %edi,-0x14(%rbp)
   42b93:	89 75 e8             	mov    %esi,-0x18(%rbp)
    outl(PCI_HOST_BRIDGE_CONFIG_ADDR, 0x80000000 | configaddr | offset);
   42b96:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42b99:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42b9c:	09 d0                	or     %edx,%eax
   42b9e:	0d 00 00 00 80       	or     $0x80000000,%eax
   42ba3:	c7 45 f4 f8 0c 00 00 	movl   $0xcf8,-0xc(%rbp)
   42baa:	89 45 f0             	mov    %eax,-0x10(%rbp)
    asm volatile("outl %0,%w1" : : "a" (data), "d" (port));
   42bad:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42bb0:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42bb3:	ef                   	out    %eax,(%dx)
}
   42bb4:	90                   	nop
   42bb5:	c7 45 fc fc 0c 00 00 	movl   $0xcfc,-0x4(%rbp)
    asm volatile("inl %w1,%0" : "=a" (data) : "d" (port));
   42bbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42bbf:	89 c2                	mov    %eax,%edx
   42bc1:	ed                   	in     (%dx),%eax
   42bc2:	89 45 f8             	mov    %eax,-0x8(%rbp)
    return data;
   42bc5:	8b 45 f8             	mov    -0x8(%rbp),%eax
    return inl(PCI_HOST_BRIDGE_CONFIG_DATA);
}
   42bc8:	c9                   	leave  
   42bc9:	c3                   	ret    

0000000000042bca <pci_find_device>:

// pci_find_device
//    Search for a PCI device matching `vendor` and `device`. Return
//    the config base address or -1 if no device was found.

static int pci_find_device(int vendor, int device) {
   42bca:	f3 0f 1e fa          	endbr64 
   42bce:	55                   	push   %rbp
   42bcf:	48 89 e5             	mov    %rsp,%rbp
   42bd2:	48 83 ec 28          	sub    $0x28,%rsp
   42bd6:	89 7d dc             	mov    %edi,-0x24(%rbp)
   42bd9:	89 75 d8             	mov    %esi,-0x28(%rbp)
    for (int bus = 0; bus != 256; ++bus) {
   42bdc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42be3:	eb 73                	jmp    42c58 <pci_find_device+0x8e>
        for (int slot = 0; slot != 32; ++slot) {
   42be5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
   42bec:	eb 60                	jmp    42c4e <pci_find_device+0x84>
            for (int func = 0; func != 8; ++func) {
   42bee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
   42bf5:	eb 4a                	jmp    42c41 <pci_find_device+0x77>
                int configaddr = pci_make_configaddr(bus, slot, func);
   42bf7:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42bfa:	8b 4d f8             	mov    -0x8(%rbp),%ecx
   42bfd:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42c00:	89 ce                	mov    %ecx,%esi
   42c02:	89 c7                	mov    %eax,%edi
   42c04:	e8 4c ff ff ff       	call   42b55 <pci_make_configaddr>
   42c09:	89 45 f0             	mov    %eax,-0x10(%rbp)
                uint32_t vendor_device = pci_config_readl(configaddr, 0);
   42c0c:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42c0f:	be 00 00 00 00       	mov    $0x0,%esi
   42c14:	89 c7                	mov    %eax,%edi
   42c16:	e8 69 ff ff ff       	call   42b84 <pci_config_readl>
   42c1b:	89 45 ec             	mov    %eax,-0x14(%rbp)
                if (vendor_device == (uint32_t) (vendor | (device << 16))) {
   42c1e:	8b 45 d8             	mov    -0x28(%rbp),%eax
   42c21:	c1 e0 10             	shl    $0x10,%eax
   42c24:	0b 45 dc             	or     -0x24(%rbp),%eax
   42c27:	39 45 ec             	cmp    %eax,-0x14(%rbp)
   42c2a:	75 05                	jne    42c31 <pci_find_device+0x67>
                    return configaddr;
   42c2c:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42c2f:	eb 35                	jmp    42c66 <pci_find_device+0x9c>
                } else if (vendor_device == (uint32_t) -1 && func == 0) {
   42c31:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
   42c35:	75 06                	jne    42c3d <pci_find_device+0x73>
   42c37:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
   42c3b:	74 0c                	je     42c49 <pci_find_device+0x7f>
            for (int func = 0; func != 8; ++func) {
   42c3d:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
   42c41:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
   42c45:	75 b0                	jne    42bf7 <pci_find_device+0x2d>
   42c47:	eb 01                	jmp    42c4a <pci_find_device+0x80>
                    break;
   42c49:	90                   	nop
        for (int slot = 0; slot != 32; ++slot) {
   42c4a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
   42c4e:	83 7d f8 20          	cmpl   $0x20,-0x8(%rbp)
   42c52:	75 9a                	jne    42bee <pci_find_device+0x24>
    for (int bus = 0; bus != 256; ++bus) {
   42c54:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   42c58:	81 7d fc 00 01 00 00 	cmpl   $0x100,-0x4(%rbp)
   42c5f:	75 84                	jne    42be5 <pci_find_device+0x1b>
                }
            }
        }
    }
    return -1;
   42c61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42c66:	c9                   	leave  
   42c67:	c3                   	ret    

0000000000042c68 <poweroff>:
//    that speaks ACPI; QEMU emulates a PIIX4 Power Management Controller.

#define PCI_VENDOR_ID_INTEL     0x8086
#define PCI_DEVICE_ID_PIIX4     0x7113

void poweroff(void) {
   42c68:	f3 0f 1e fa          	endbr64 
   42c6c:	55                   	push   %rbp
   42c6d:	48 89 e5             	mov    %rsp,%rbp
   42c70:	48 83 ec 10          	sub    $0x10,%rsp
    int configaddr = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PIIX4);
   42c74:	be 13 71 00 00       	mov    $0x7113,%esi
   42c79:	bf 86 80 00 00       	mov    $0x8086,%edi
   42c7e:	e8 47 ff ff ff       	call   42bca <pci_find_device>
   42c83:	89 45 fc             	mov    %eax,-0x4(%rbp)
    if (configaddr >= 0) {
   42c86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
   42c8a:	78 30                	js     42cbc <poweroff+0x54>
        // Read I/O base register from controller's PCI configuration space.
        int pm_io_base = pci_config_readl(configaddr, 0x40) & 0xFFC0;
   42c8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42c8f:	be 40 00 00 00       	mov    $0x40,%esi
   42c94:	89 c7                	mov    %eax,%edi
   42c96:	e8 e9 fe ff ff       	call   42b84 <pci_config_readl>
   42c9b:	25 c0 ff 00 00       	and    $0xffc0,%eax
   42ca0:	89 45 f8             	mov    %eax,-0x8(%rbp)
        // Write `suspend enable` to the power management control register.
        outw(pm_io_base + 4, 0x2000);
   42ca3:	8b 45 f8             	mov    -0x8(%rbp),%eax
   42ca6:	83 c0 04             	add    $0x4,%eax
   42ca9:	89 45 f4             	mov    %eax,-0xc(%rbp)
   42cac:	66 c7 45 f2 00 20    	movw   $0x2000,-0xe(%rbp)
    asm volatile("outw %0,%w1" : : "a" (data), "d" (port));
   42cb2:	0f b7 45 f2          	movzwl -0xe(%rbp),%eax
   42cb6:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42cb9:	66 ef                	out    %ax,(%dx)
}
   42cbb:	90                   	nop
    }
    // No PIIX4; spin.
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   42cbc:	48 8d 05 ab 1c 00 00 	lea    0x1cab(%rip),%rax        # 4496e <memstate_colors+0x42e>
   42cc3:	48 89 c2             	mov    %rax,%rdx
   42cc6:	be 00 c0 00 00       	mov    $0xc000,%esi
   42ccb:	bf 80 07 00 00       	mov    $0x780,%edi
   42cd0:	b8 00 00 00 00       	mov    $0x0,%eax
   42cd5:	e8 c2 14 00 00       	call   4419c <console_printf>
 spinloop: goto spinloop;
   42cda:	eb fe                	jmp    42cda <poweroff+0x72>

0000000000042cdc <reboot>:


// reboot
//    Reboot the virtual machine.

void reboot(void) {
   42cdc:	f3 0f 1e fa          	endbr64 
   42ce0:	55                   	push   %rbp
   42ce1:	48 89 e5             	mov    %rsp,%rbp
   42ce4:	48 83 ec 10          	sub    $0x10,%rsp
   42ce8:	c7 45 fc 92 00 00 00 	movl   $0x92,-0x4(%rbp)
   42cef:	c6 45 fb 03          	movb   $0x3,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42cf3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42cf7:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42cfa:	ee                   	out    %al,(%dx)
}
   42cfb:	90                   	nop
    outb(0x92, 3);
 spinloop: goto spinloop;
   42cfc:	eb fe                	jmp    42cfc <reboot+0x20>

0000000000042cfe <process_init>:


// process_init(p, flags)
//    Initialize special-purpose registers for process `p`.

void process_init(proc* p, int flags) {
   42cfe:	f3 0f 1e fa          	endbr64 
   42d02:	55                   	push   %rbp
   42d03:	48 89 e5             	mov    %rsp,%rbp
   42d06:	48 83 ec 10          	sub    $0x10,%rsp
   42d0a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   42d0e:	89 75 f4             	mov    %esi,-0xc(%rbp)
    memset(&p->p_registers, 0, sizeof(p->p_registers));
   42d11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d15:	48 83 c0 08          	add    $0x8,%rax
   42d19:	ba c0 00 00 00       	mov    $0xc0,%edx
   42d1e:	be 00 00 00 00       	mov    $0x0,%esi
   42d23:	48 89 c7             	mov    %rax,%rdi
   42d26:	e8 f0 0b 00 00       	call   4391b <memset>
    p->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
   42d2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d2f:	66 c7 80 a8 00 00 00 	movw   $0x13,0xa8(%rax)
   42d36:	13 00 
    p->p_registers.reg_fs = SEGSEL_APP_DATA | 3;
   42d38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d3c:	48 c7 80 80 00 00 00 	movq   $0x23,0x80(%rax)
   42d43:	23 00 00 00 
    p->p_registers.reg_gs = SEGSEL_APP_DATA | 3;
   42d47:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d4b:	48 c7 80 88 00 00 00 	movq   $0x23,0x88(%rax)
   42d52:	23 00 00 00 
    p->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
   42d56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d5a:	66 c7 80 c0 00 00 00 	movw   $0x23,0xc0(%rax)
   42d61:	23 00 
    p->p_registers.reg_rflags = EFLAGS_IF;
   42d63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d67:	48 c7 80 b0 00 00 00 	movq   $0x200,0xb0(%rax)
   42d6e:	00 02 00 00 

    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   42d72:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42d75:	83 e0 01             	and    $0x1,%eax
   42d78:	85 c0                	test   %eax,%eax
   42d7a:	74 1c                	je     42d98 <process_init+0x9a>
        p->p_registers.reg_rflags |= EFLAGS_IOPL_3;
   42d7c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d80:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42d87:	80 cc 30             	or     $0x30,%ah
   42d8a:	48 89 c2             	mov    %rax,%rdx
   42d8d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42d91:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42d98:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42d9b:	83 e0 02             	and    $0x2,%eax
   42d9e:	85 c0                	test   %eax,%eax
   42da0:	74 1c                	je     42dbe <process_init+0xc0>
        p->p_registers.reg_rflags &= ~EFLAGS_IF;
   42da2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42da6:	48 8b 80 b0 00 00 00 	mov    0xb0(%rax),%rax
   42dad:	80 e4 fd             	and    $0xfd,%ah
   42db0:	48 89 c2             	mov    %rax,%rdx
   42db3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   42db7:	48 89 90 b0 00 00 00 	mov    %rdx,0xb0(%rax)
    }
}
   42dbe:	90                   	nop
   42dbf:	c9                   	leave  
   42dc0:	c3                   	ret    

0000000000042dc1 <console_show_cursor>:

// console_show_cursor(cpos)
//    Move the console cursor to position `cpos`, which should be between 0
//    and 80 * 25.

void console_show_cursor(int cpos) {
   42dc1:	f3 0f 1e fa          	endbr64 
   42dc5:	55                   	push   %rbp
   42dc6:	48 89 e5             	mov    %rsp,%rbp
   42dc9:	48 83 ec 28          	sub    $0x28,%rsp
   42dcd:	89 7d dc             	mov    %edi,-0x24(%rbp)
    if (cpos < 0 || cpos > CONSOLE_ROWS * CONSOLE_COLUMNS) {
   42dd0:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
   42dd4:	78 09                	js     42ddf <console_show_cursor+0x1e>
   42dd6:	81 7d dc d0 07 00 00 	cmpl   $0x7d0,-0x24(%rbp)
   42ddd:	7e 07                	jle    42de6 <console_show_cursor+0x25>
        cpos = 0;
   42ddf:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
   42de6:	c7 45 e4 d4 03 00 00 	movl   $0x3d4,-0x1c(%rbp)
   42ded:	c6 45 e3 0e          	movb   $0xe,-0x1d(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42df1:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
   42df5:	8b 55 e4             	mov    -0x1c(%rbp),%edx
   42df8:	ee                   	out    %al,(%dx)
}
   42df9:	90                   	nop
    }
    outb(0x3D4, 14);
    outb(0x3D5, cpos / 256);
   42dfa:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42dfd:	8d 90 ff 00 00 00    	lea    0xff(%rax),%edx
   42e03:	85 c0                	test   %eax,%eax
   42e05:	0f 48 c2             	cmovs  %edx,%eax
   42e08:	c1 f8 08             	sar    $0x8,%eax
   42e0b:	0f b6 c0             	movzbl %al,%eax
   42e0e:	c7 45 ec d5 03 00 00 	movl   $0x3d5,-0x14(%rbp)
   42e15:	88 45 eb             	mov    %al,-0x15(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e18:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
   42e1c:	8b 55 ec             	mov    -0x14(%rbp),%edx
   42e1f:	ee                   	out    %al,(%dx)
}
   42e20:	90                   	nop
   42e21:	c7 45 f4 d4 03 00 00 	movl   $0x3d4,-0xc(%rbp)
   42e28:	c6 45 f3 0f          	movb   $0xf,-0xd(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e2c:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
   42e30:	8b 55 f4             	mov    -0xc(%rbp),%edx
   42e33:	ee                   	out    %al,(%dx)
}
   42e34:	90                   	nop
    outb(0x3D4, 15);
    outb(0x3D5, cpos % 256);
   42e35:	8b 45 dc             	mov    -0x24(%rbp),%eax
   42e38:	99                   	cltd   
   42e39:	c1 ea 18             	shr    $0x18,%edx
   42e3c:	01 d0                	add    %edx,%eax
   42e3e:	0f b6 c0             	movzbl %al,%eax
   42e41:	29 d0                	sub    %edx,%eax
   42e43:	0f b6 c0             	movzbl %al,%eax
   42e46:	c7 45 fc d5 03 00 00 	movl   $0x3d5,-0x4(%rbp)
   42e4d:	88 45 fb             	mov    %al,-0x5(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   42e50:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42e54:	8b 55 fc             	mov    -0x4(%rbp),%edx
   42e57:	ee                   	out    %al,(%dx)
}
   42e58:	90                   	nop
}
   42e59:	90                   	nop
   42e5a:	c9                   	leave  
   42e5b:	c3                   	ret    

0000000000042e5c <keyboard_readc>:
    /*CKEY(16)*/ {{'\'', '"', 0, 0}},  /*CKEY(17)*/ {{'`', '~', 0, 0}},
    /*CKEY(18)*/ {{'\\', '|', 034, 0}},  /*CKEY(19)*/ {{',', '<', 0, 0}},
    /*CKEY(20)*/ {{'.', '>', 0, 0}},  /*CKEY(21)*/ {{'/', '?', 0, 0}}
};

int keyboard_readc(void) {
   42e5c:	f3 0f 1e fa          	endbr64 
   42e60:	55                   	push   %rbp
   42e61:	48 89 e5             	mov    %rsp,%rbp
   42e64:	48 83 ec 20          	sub    $0x20,%rsp
   42e68:	c7 45 f0 64 00 00 00 	movl   $0x64,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42e6f:	8b 45 f0             	mov    -0x10(%rbp),%eax
   42e72:	89 c2                	mov    %eax,%edx
   42e74:	ec                   	in     (%dx),%al
   42e75:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   42e78:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
    static uint8_t modifiers;
    static uint8_t last_escape;

    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42e7c:	0f b6 c0             	movzbl %al,%eax
   42e7f:	83 e0 01             	and    $0x1,%eax
   42e82:	85 c0                	test   %eax,%eax
   42e84:	75 0a                	jne    42e90 <keyboard_readc+0x34>
        return -1;
   42e86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   42e8b:	e9 fd 01 00 00       	jmp    4308d <keyboard_readc+0x231>
   42e90:	c7 45 e8 60 00 00 00 	movl   $0x60,-0x18(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   42e97:	8b 45 e8             	mov    -0x18(%rbp),%eax
   42e9a:	89 c2                	mov    %eax,%edx
   42e9c:	ec                   	in     (%dx),%al
   42e9d:	88 45 e7             	mov    %al,-0x19(%rbp)
    return data;
   42ea0:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
    }

    uint8_t data = inb(KEYBOARD_DATAREG);
   42ea4:	88 45 fb             	mov    %al,-0x5(%rbp)
    uint8_t escape = last_escape;
   42ea7:	0f b6 05 52 91 01 00 	movzbl 0x19152(%rip),%eax        # 5c000 <last_escape.2>
   42eae:	88 45 fa             	mov    %al,-0x6(%rbp)
    last_escape = 0;
   42eb1:	c6 05 48 91 01 00 00 	movb   $0x0,0x19148(%rip)        # 5c000 <last_escape.2>

    if (data == 0xE0) {         // mode shift
   42eb8:	80 7d fb e0          	cmpb   $0xe0,-0x5(%rbp)
   42ebc:	75 11                	jne    42ecf <keyboard_readc+0x73>
        last_escape = 0x80;
   42ebe:	c6 05 3b 91 01 00 80 	movb   $0x80,0x1913b(%rip)        # 5c000 <last_escape.2>
        return 0;
   42ec5:	b8 00 00 00 00       	mov    $0x0,%eax
   42eca:	e9 be 01 00 00       	jmp    4308d <keyboard_readc+0x231>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   42ecf:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42ed3:	84 c0                	test   %al,%al
   42ed5:	79 64                	jns    42f3b <keyboard_readc+0xdf>
        int ch = keymap[(data & 0x7F) | escape];
   42ed7:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42edb:	83 e0 7f             	and    $0x7f,%eax
   42ede:	89 c2                	mov    %eax,%edx
   42ee0:	0f b6 45 fa          	movzbl -0x6(%rbp),%eax
   42ee4:	09 d0                	or     %edx,%eax
   42ee6:	48 98                	cltq   
   42ee8:	48 8d 15 b1 1a 00 00 	lea    0x1ab1(%rip),%rdx        # 449a0 <keymap>
   42eef:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   42ef3:	0f b6 c0             	movzbl %al,%eax
   42ef6:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42ef9:	81 7d f4 f9 00 00 00 	cmpl   $0xf9,-0xc(%rbp)
   42f00:	7e 2f                	jle    42f31 <keyboard_readc+0xd5>
   42f02:	81 7d f4 fc 00 00 00 	cmpl   $0xfc,-0xc(%rbp)
   42f09:	7f 26                	jg     42f31 <keyboard_readc+0xd5>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   42f0b:	8b 45 f4             	mov    -0xc(%rbp),%eax
   42f0e:	2d fa 00 00 00       	sub    $0xfa,%eax
   42f13:	ba 01 00 00 00       	mov    $0x1,%edx
   42f18:	89 c1                	mov    %eax,%ecx
   42f1a:	d3 e2                	shl    %cl,%edx
   42f1c:	89 d0                	mov    %edx,%eax
   42f1e:	f7 d0                	not    %eax
   42f20:	89 c2                	mov    %eax,%edx
   42f22:	0f b6 05 d8 90 01 00 	movzbl 0x190d8(%rip),%eax        # 5c001 <modifiers.1>
   42f29:	21 d0                	and    %edx,%eax
   42f2b:	88 05 d0 90 01 00    	mov    %al,0x190d0(%rip)        # 5c001 <modifiers.1>
        }
        return 0;
   42f31:	b8 00 00 00 00       	mov    $0x0,%eax
   42f36:	e9 52 01 00 00       	jmp    4308d <keyboard_readc+0x231>
    }

    int ch = (unsigned char) keymap[data | escape];
   42f3b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
   42f3f:	0a 45 fa             	or     -0x6(%rbp),%al
   42f42:	0f b6 c0             	movzbl %al,%eax
   42f45:	48 98                	cltq   
   42f47:	48 8d 15 52 1a 00 00 	lea    0x1a52(%rip),%rdx        # 449a0 <keymap>
   42f4e:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
   42f52:	0f b6 c0             	movzbl %al,%eax
   42f55:	89 45 fc             	mov    %eax,-0x4(%rbp)

    if (ch >= 'a' && ch <= 'z') {
   42f58:	83 7d fc 60          	cmpl   $0x60,-0x4(%rbp)
   42f5c:	7e 57                	jle    42fb5 <keyboard_readc+0x159>
   42f5e:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%rbp)
   42f62:	7f 51                	jg     42fb5 <keyboard_readc+0x159>
        if (modifiers & MOD_CONTROL) {
   42f64:	0f b6 05 96 90 01 00 	movzbl 0x19096(%rip),%eax        # 5c001 <modifiers.1>
   42f6b:	0f b6 c0             	movzbl %al,%eax
   42f6e:	83 e0 02             	and    $0x2,%eax
   42f71:	85 c0                	test   %eax,%eax
   42f73:	74 09                	je     42f7e <keyboard_readc+0x122>
            ch -= 0x60;
   42f75:	83 6d fc 60          	subl   $0x60,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42f79:	e9 0b 01 00 00       	jmp    43089 <keyboard_readc+0x22d>
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42f7e:	0f b6 05 7c 90 01 00 	movzbl 0x1907c(%rip),%eax        # 5c001 <modifiers.1>
   42f85:	0f b6 c0             	movzbl %al,%eax
   42f88:	83 e0 01             	and    $0x1,%eax
   42f8b:	85 c0                	test   %eax,%eax
   42f8d:	0f 94 c2             	sete   %dl
   42f90:	0f b6 05 6a 90 01 00 	movzbl 0x1906a(%rip),%eax        # 5c001 <modifiers.1>
   42f97:	0f b6 c0             	movzbl %al,%eax
   42f9a:	83 e0 08             	and    $0x8,%eax
   42f9d:	85 c0                	test   %eax,%eax
   42f9f:	0f 94 c0             	sete   %al
   42fa2:	31 d0                	xor    %edx,%eax
   42fa4:	84 c0                	test   %al,%al
   42fa6:	0f 84 dd 00 00 00    	je     43089 <keyboard_readc+0x22d>
            ch -= 0x20;
   42fac:	83 6d fc 20          	subl   $0x20,-0x4(%rbp)
        if (modifiers & MOD_CONTROL) {
   42fb0:	e9 d4 00 00 00       	jmp    43089 <keyboard_readc+0x22d>
        }
    } else if (ch >= KEY_CAPSLOCK) {
   42fb5:	81 7d fc fc 00 00 00 	cmpl   $0xfc,-0x4(%rbp)
   42fbc:	7e 30                	jle    42fee <keyboard_readc+0x192>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42fbe:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42fc1:	2d fa 00 00 00       	sub    $0xfa,%eax
   42fc6:	ba 01 00 00 00       	mov    $0x1,%edx
   42fcb:	89 c1                	mov    %eax,%ecx
   42fcd:	d3 e2                	shl    %cl,%edx
   42fcf:	89 d0                	mov    %edx,%eax
   42fd1:	89 c2                	mov    %eax,%edx
   42fd3:	0f b6 05 27 90 01 00 	movzbl 0x19027(%rip),%eax        # 5c001 <modifiers.1>
   42fda:	31 d0                	xor    %edx,%eax
   42fdc:	88 05 1f 90 01 00    	mov    %al,0x1901f(%rip)        # 5c001 <modifiers.1>
        ch = 0;
   42fe2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   42fe9:	e9 9c 00 00 00       	jmp    4308a <keyboard_readc+0x22e>
    } else if (ch >= KEY_SHIFT) {
   42fee:	81 7d fc f9 00 00 00 	cmpl   $0xf9,-0x4(%rbp)
   42ff5:	7e 2d                	jle    43024 <keyboard_readc+0x1c8>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42ff7:	8b 45 fc             	mov    -0x4(%rbp),%eax
   42ffa:	2d fa 00 00 00       	sub    $0xfa,%eax
   42fff:	ba 01 00 00 00       	mov    $0x1,%edx
   43004:	89 c1                	mov    %eax,%ecx
   43006:	d3 e2                	shl    %cl,%edx
   43008:	89 d0                	mov    %edx,%eax
   4300a:	89 c2                	mov    %eax,%edx
   4300c:	0f b6 05 ee 8f 01 00 	movzbl 0x18fee(%rip),%eax        # 5c001 <modifiers.1>
   43013:	09 d0                	or     %edx,%eax
   43015:	88 05 e6 8f 01 00    	mov    %al,0x18fe6(%rip)        # 5c001 <modifiers.1>
        ch = 0;
   4301b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   43022:	eb 66                	jmp    4308a <keyboard_readc+0x22e>
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   43024:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   43028:	7e 3f                	jle    43069 <keyboard_readc+0x20d>
   4302a:	81 7d fc 95 00 00 00 	cmpl   $0x95,-0x4(%rbp)
   43031:	7f 36                	jg     43069 <keyboard_readc+0x20d>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   43033:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43036:	8d 50 80             	lea    -0x80(%rax),%edx
   43039:	0f b6 05 c1 8f 01 00 	movzbl 0x18fc1(%rip),%eax        # 5c001 <modifiers.1>
   43040:	0f b6 c0             	movzbl %al,%eax
   43043:	83 e0 03             	and    $0x3,%eax
   43046:	48 63 c8             	movslq %eax,%rcx
   43049:	48 63 c2             	movslq %edx,%rax
   4304c:	48 c1 e0 02          	shl    $0x2,%rax
   43050:	48 8d 14 08          	lea    (%rax,%rcx,1),%rdx
   43054:	48 8d 05 45 1a 00 00 	lea    0x1a45(%rip),%rax        # 44aa0 <complex_keymap>
   4305b:	48 01 d0             	add    %rdx,%rax
   4305e:	0f b6 00             	movzbl (%rax),%eax
   43061:	0f b6 c0             	movzbl %al,%eax
   43064:	89 45 fc             	mov    %eax,-0x4(%rbp)
   43067:	eb 21                	jmp    4308a <keyboard_readc+0x22e>
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   43069:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%rbp)
   4306d:	7f 1b                	jg     4308a <keyboard_readc+0x22e>
   4306f:	0f b6 05 8b 8f 01 00 	movzbl 0x18f8b(%rip),%eax        # 5c001 <modifiers.1>
   43076:	0f b6 c0             	movzbl %al,%eax
   43079:	83 e0 02             	and    $0x2,%eax
   4307c:	85 c0                	test   %eax,%eax
   4307e:	74 0a                	je     4308a <keyboard_readc+0x22e>
        ch = 0;
   43080:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   43087:	eb 01                	jmp    4308a <keyboard_readc+0x22e>
        if (modifiers & MOD_CONTROL) {
   43089:	90                   	nop
    }

    return ch;
   4308a:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   4308d:	c9                   	leave  
   4308e:	c3                   	ret    

000000000004308f <delay>:
#define IO_PARALLEL1_CONTROL    0x37A
# define IO_PARALLEL_CONTROL_SELECT     0x08
# define IO_PARALLEL_CONTROL_INIT       0x04
# define IO_PARALLEL_CONTROL_STROBE     0x01

static void delay(void) {
   4308f:	f3 0f 1e fa          	endbr64 
   43093:	55                   	push   %rbp
   43094:	48 89 e5             	mov    %rsp,%rbp
   43097:	48 83 ec 20          	sub    $0x20,%rsp
   4309b:	c7 45 e4 84 00 00 00 	movl   $0x84,-0x1c(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   430a2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
   430a5:	89 c2                	mov    %eax,%edx
   430a7:	ec                   	in     (%dx),%al
   430a8:	88 45 e3             	mov    %al,-0x1d(%rbp)
   430ab:	c7 45 ec 84 00 00 00 	movl   $0x84,-0x14(%rbp)
   430b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
   430b5:	89 c2                	mov    %eax,%edx
   430b7:	ec                   	in     (%dx),%al
   430b8:	88 45 eb             	mov    %al,-0x15(%rbp)
   430bb:	c7 45 f4 84 00 00 00 	movl   $0x84,-0xc(%rbp)
   430c2:	8b 45 f4             	mov    -0xc(%rbp),%eax
   430c5:	89 c2                	mov    %eax,%edx
   430c7:	ec                   	in     (%dx),%al
   430c8:	88 45 f3             	mov    %al,-0xd(%rbp)
   430cb:	c7 45 fc 84 00 00 00 	movl   $0x84,-0x4(%rbp)
   430d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
   430d5:	89 c2                	mov    %eax,%edx
   430d7:	ec                   	in     (%dx),%al
   430d8:	88 45 fb             	mov    %al,-0x5(%rbp)
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}
   430db:	90                   	nop
   430dc:	c9                   	leave  
   430dd:	c3                   	ret    

00000000000430de <parallel_port_putc>:

static void parallel_port_putc(printer* p, unsigned char c, int color) {
   430de:	f3 0f 1e fa          	endbr64 
   430e2:	55                   	push   %rbp
   430e3:	48 89 e5             	mov    %rsp,%rbp
   430e6:	48 83 ec 40          	sub    $0x40,%rsp
   430ea:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   430ee:	89 f0                	mov    %esi,%eax
   430f0:	89 55 c0             	mov    %edx,-0x40(%rbp)
   430f3:	88 45 c4             	mov    %al,-0x3c(%rbp)
    static int initialized;
    (void) p, (void) color;
    if (!initialized) {
   430f6:	8b 05 08 8f 01 00    	mov    0x18f08(%rip),%eax        # 5c004 <initialized.0>
   430fc:	85 c0                	test   %eax,%eax
   430fe:	75 1e                	jne    4311e <parallel_port_putc+0x40>
   43100:	c7 45 f8 7a 03 00 00 	movl   $0x37a,-0x8(%rbp)
   43107:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4310b:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
   4310f:	8b 55 f8             	mov    -0x8(%rbp),%edx
   43112:	ee                   	out    %al,(%dx)
}
   43113:	90                   	nop
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   43114:	c7 05 e6 8e 01 00 01 	movl   $0x1,0x18ee6(%rip)        # 5c004 <initialized.0>
   4311b:	00 00 00 
    }

    for (int i = 0;
   4311e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   43125:	eb 09                	jmp    43130 <parallel_port_putc+0x52>
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
         ++i) {
        delay();
   43127:	e8 63 ff ff ff       	call   4308f <delay>
         ++i) {
   4312c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   43130:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%rbp)
   43137:	7f 18                	jg     43151 <parallel_port_putc+0x73>
   43139:	c7 45 f0 79 03 00 00 	movl   $0x379,-0x10(%rbp)
    asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
   43140:	8b 45 f0             	mov    -0x10(%rbp),%eax
   43143:	89 c2                	mov    %eax,%edx
   43145:	ec                   	in     (%dx),%al
   43146:	88 45 ef             	mov    %al,-0x11(%rbp)
    return data;
   43149:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
   4314d:	84 c0                	test   %al,%al
   4314f:	79 d6                	jns    43127 <parallel_port_putc+0x49>
    }
    outb(IO_PARALLEL1_DATA, c);
   43151:	0f b6 45 c4          	movzbl -0x3c(%rbp),%eax
   43155:	c7 45 d8 78 03 00 00 	movl   $0x378,-0x28(%rbp)
   4315c:	88 45 d7             	mov    %al,-0x29(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   4315f:	0f b6 45 d7          	movzbl -0x29(%rbp),%eax
   43163:	8b 55 d8             	mov    -0x28(%rbp),%edx
   43166:	ee                   	out    %al,(%dx)
}
   43167:	90                   	nop
   43168:	c7 45 e0 7a 03 00 00 	movl   $0x37a,-0x20(%rbp)
   4316f:	c6 45 df 0d          	movb   $0xd,-0x21(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   43173:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
   43177:	8b 55 e0             	mov    -0x20(%rbp),%edx
   4317a:	ee                   	out    %al,(%dx)
}
   4317b:	90                   	nop
   4317c:	c7 45 e8 7a 03 00 00 	movl   $0x37a,-0x18(%rbp)
   43183:	c6 45 e7 0c          	movb   $0xc,-0x19(%rbp)
    asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
   43187:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
   4318b:	8b 55 e8             	mov    -0x18(%rbp),%edx
   4318e:	ee                   	out    %al,(%dx)
}
   4318f:	90                   	nop
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   43190:	90                   	nop
   43191:	c9                   	leave  
   43192:	c3                   	ret    

0000000000043193 <log_vprintf>:

void log_vprintf(const char* format, va_list val) {
   43193:	f3 0f 1e fa          	endbr64 
   43197:	55                   	push   %rbp
   43198:	48 89 e5             	mov    %rsp,%rbp
   4319b:	48 83 ec 20          	sub    $0x20,%rsp
   4319f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   431a3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    printer p;
    p.putc = parallel_port_putc;
   431a7:	48 8d 05 30 ff ff ff 	lea    -0xd0(%rip),%rax        # 430de <parallel_port_putc>
   431ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printer_vprintf(&p, 0, format, val);
   431b2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
   431b6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
   431ba:	48 8d 45 f8          	lea    -0x8(%rbp),%rax
   431be:	be 00 00 00 00       	mov    $0x0,%esi
   431c3:	48 89 c7             	mov    %rax,%rdi
   431c6:	e8 81 08 00 00       	call   43a4c <printer_vprintf>
}
   431cb:	90                   	nop
   431cc:	c9                   	leave  
   431cd:	c3                   	ret    

00000000000431ce <log_printf>:

void log_printf(const char* format, ...) {
   431ce:	f3 0f 1e fa          	endbr64 
   431d2:	55                   	push   %rbp
   431d3:	48 89 e5             	mov    %rsp,%rbp
   431d6:	48 83 ec 60          	sub    $0x60,%rsp
   431da:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   431de:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   431e2:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   431e6:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   431ea:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   431ee:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   431f2:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   431f9:	48 8d 45 10          	lea    0x10(%rbp),%rax
   431fd:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   43201:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   43205:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   43209:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   4320d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   43211:	48 89 d6             	mov    %rdx,%rsi
   43214:	48 89 c7             	mov    %rax,%rdi
   43217:	e8 77 ff ff ff       	call   43193 <log_vprintf>
    va_end(val);
}
   4321c:	90                   	nop
   4321d:	c9                   	leave  
   4321e:	c3                   	ret    

000000000004321f <error_vprintf>:

// error_printf, error_vprintf
//    Print debugging messages to the console and to the host's
//    `log.txt` file via `log_printf`.

int error_vprintf(int cpos, int color, const char* format, va_list val) {
   4321f:	f3 0f 1e fa          	endbr64 
   43223:	55                   	push   %rbp
   43224:	48 89 e5             	mov    %rsp,%rbp
   43227:	48 83 ec 40          	sub    $0x40,%rsp
   4322b:	89 7d dc             	mov    %edi,-0x24(%rbp)
   4322e:	89 75 d8             	mov    %esi,-0x28(%rbp)
   43231:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   43235:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    va_list val2;
    __builtin_va_copy(val2, val);
   43239:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
   4323d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   43241:	48 8b 0a             	mov    (%rdx),%rcx
   43244:	48 89 08             	mov    %rcx,(%rax)
   43247:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   4324b:	48 89 48 08          	mov    %rcx,0x8(%rax)
   4324f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   43253:	48 89 50 10          	mov    %rdx,0x10(%rax)
    log_vprintf(format, val2);
   43257:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   4325b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4325f:	48 89 d6             	mov    %rdx,%rsi
   43262:	48 89 c7             	mov    %rax,%rdi
   43265:	e8 29 ff ff ff       	call   43193 <log_vprintf>
    va_end(val2);
    return console_vprintf(cpos, color, format, val);
   4326a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   4326e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
   43272:	8b 75 d8             	mov    -0x28(%rbp),%esi
   43275:	8b 45 dc             	mov    -0x24(%rbp),%eax
   43278:	89 c7                	mov    %eax,%edi
   4327a:	e8 cc 0e 00 00       	call   4414b <console_vprintf>
}
   4327f:	c9                   	leave  
   43280:	c3                   	ret    

0000000000043281 <error_printf>:

int error_printf(int cpos, int color, const char* format, ...) {
   43281:	f3 0f 1e fa          	endbr64 
   43285:	55                   	push   %rbp
   43286:	48 89 e5             	mov    %rsp,%rbp
   43289:	48 83 ec 60          	sub    $0x60,%rsp
   4328d:	89 7d ac             	mov    %edi,-0x54(%rbp)
   43290:	89 75 a8             	mov    %esi,-0x58(%rbp)
   43293:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   43297:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4329b:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4329f:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   432a3:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   432aa:	48 8d 45 10          	lea    0x10(%rbp),%rax
   432ae:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   432b2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   432b6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   432ba:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   432be:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
   432c2:	8b 75 a8             	mov    -0x58(%rbp),%esi
   432c5:	8b 45 ac             	mov    -0x54(%rbp),%eax
   432c8:	89 c7                	mov    %eax,%edi
   432ca:	e8 50 ff ff ff       	call   4321f <error_vprintf>
   432cf:	89 45 ac             	mov    %eax,-0x54(%rbp)
    va_end(val);
    return cpos;
   432d2:	8b 45 ac             	mov    -0x54(%rbp),%eax
}
   432d5:	c9                   	leave  
   432d6:	c3                   	ret    

00000000000432d7 <check_keyboard>:
//    Check for the user typing a control key. 'a', 'f', and 'e' cause a soft
//    reboot where the kernel runs the allocator programs, "fork", or
//    "forkexit", respectively. Control-C or 'q' exit the virtual machine.
//    Returns key typed or -1 for no key.

int check_keyboard(void) {
   432d7:	f3 0f 1e fa          	endbr64 
   432db:	55                   	push   %rbp
   432dc:	48 89 e5             	mov    %rsp,%rbp
   432df:	53                   	push   %rbx
   432e0:	48 83 ec 48          	sub    $0x48,%rsp
    int c = keyboard_readc();
   432e4:	e8 73 fb ff ff       	call   42e5c <keyboard_readc>
   432e9:	89 45 e4             	mov    %eax,-0x1c(%rbp)
    if (c == 'a' || c == 'f' || c == 'e') {
   432ec:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   432f0:	74 10                	je     43302 <check_keyboard+0x2b>
   432f2:	83 7d e4 66          	cmpl   $0x66,-0x1c(%rbp)
   432f6:	74 0a                	je     43302 <check_keyboard+0x2b>
   432f8:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   432fc:	0f 85 dc 00 00 00    	jne    433de <check_keyboard+0x107>
        // Install a temporary page table to carry us through the
        // process of reinitializing memory. This replicates work the
        // bootloader does.
        x86_64_pagetable* pt = (x86_64_pagetable*) 0x8000;
   43302:	48 c7 45 d8 00 80 00 	movq   $0x8000,-0x28(%rbp)
   43309:	00 
        memset(pt, 0, PAGESIZE * 3);
   4330a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4330e:	ba 00 30 00 00       	mov    $0x3000,%edx
   43313:	be 00 00 00 00       	mov    $0x0,%esi
   43318:	48 89 c7             	mov    %rax,%rdi
   4331b:	e8 fb 05 00 00       	call   4391b <memset>
        pt[0].entry[0] = 0x9000 | PTE_P | PTE_W | PTE_U;
   43320:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43324:	48 c7 00 07 90 00 00 	movq   $0x9007,(%rax)
        pt[1].entry[0] = 0xA000 | PTE_P | PTE_W | PTE_U;
   4332b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4332f:	48 05 00 10 00 00    	add    $0x1000,%rax
   43335:	48 c7 00 07 a0 00 00 	movq   $0xa007,(%rax)
        pt[2].entry[0] = PTE_P | PTE_W | PTE_U | PTE_PS;
   4333c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43340:	48 05 00 20 00 00    	add    $0x2000,%rax
   43346:	48 c7 00 87 00 00 00 	movq   $0x87,(%rax)
        lcr3((uintptr_t) pt);
   4334d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43351:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    asm volatile("movq %0,%%cr3" : : "r" (val) : "memory");
   43355:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   43359:	0f 22 d8             	mov    %rax,%cr3
}
   4335c:	90                   	nop
        // The soft reboot process doesn't modify memory, so it's
        // safe to pass `multiboot_info` on the kernel stack, even
        // though it will get overwritten as the kernel runs.
        uint32_t multiboot_info[5];
        multiboot_info[0] = 4;
   4335d:	c7 45 b4 04 00 00 00 	movl   $0x4,-0x4c(%rbp)
        const char* argument = "fork";
   43364:	48 8d 05 8d 17 00 00 	lea    0x178d(%rip),%rax        # 44af8 <complex_keymap+0x58>
   4336b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        if (c == 'a') {
   4336f:	83 7d e4 61          	cmpl   $0x61,-0x1c(%rbp)
   43373:	75 0d                	jne    43382 <check_keyboard+0xab>
            argument = "allocator";
   43375:	48 8d 05 81 17 00 00 	lea    0x1781(%rip),%rax        # 44afd <complex_keymap+0x5d>
   4337c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   43380:	eb 11                	jmp    43393 <check_keyboard+0xbc>
        } else if (c == 'e') {
   43382:	83 7d e4 65          	cmpl   $0x65,-0x1c(%rbp)
   43386:	75 0b                	jne    43393 <check_keyboard+0xbc>
            argument = "forkexit";
   43388:	48 8d 05 78 17 00 00 	lea    0x1778(%rip),%rax        # 44b07 <complex_keymap+0x67>
   4338f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        }
        uintptr_t argument_ptr = (uintptr_t) argument;
   43393:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43397:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
        assert(argument_ptr < 0x100000000L);
   4339b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   433a0:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
   433a4:	76 1e                	jbe    433c4 <check_keyboard+0xed>
   433a6:	48 8d 05 63 17 00 00 	lea    0x1763(%rip),%rax        # 44b10 <complex_keymap+0x70>
   433ad:	48 89 c2             	mov    %rax,%rdx
   433b0:	be f5 02 00 00       	mov    $0x2f5,%esi
   433b5:	48 8d 05 d9 12 00 00 	lea    0x12d9(%rip),%rax        # 44695 <memstate_colors+0x155>
   433bc:	48 89 c7             	mov    %rax,%rdi
   433bf:	e8 33 01 00 00       	call   434f7 <assert_fail>
        multiboot_info[4] = (uint32_t) argument_ptr;
   433c4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   433c8:	89 45 c4             	mov    %eax,-0x3c(%rbp)
        asm volatile("movl $0x2BADB002, %%eax; jmp entry_from_boot"
   433cb:	48 8d 45 b4          	lea    -0x4c(%rbp),%rax
   433cf:	48 89 c3             	mov    %rax,%rbx
   433d2:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   433d7:	e9 24 cc ff ff       	jmp    40000 <entry_from_boot>
    if (c == 'a' || c == 'f' || c == 'e') {
   433dc:	eb 11                	jmp    433ef <check_keyboard+0x118>
                     : : "b" (multiboot_info) : "memory");
    } else if (c == 0x03 || c == 'q') {
   433de:	83 7d e4 03          	cmpl   $0x3,-0x1c(%rbp)
   433e2:	74 06                	je     433ea <check_keyboard+0x113>
   433e4:	83 7d e4 71          	cmpl   $0x71,-0x1c(%rbp)
   433e8:	75 05                	jne    433ef <check_keyboard+0x118>
        poweroff();
   433ea:	e8 79 f8 ff ff       	call   42c68 <poweroff>
    }
    return c;
   433ef:	8b 45 e4             	mov    -0x1c(%rbp),%eax
}
   433f2:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   433f6:	c9                   	leave  
   433f7:	c3                   	ret    

00000000000433f8 <fail>:

// fail
//    Loop until user presses Control-C, then poweroff.

static void fail(void) __attribute__((noreturn));
static void fail(void) {
   433f8:	f3 0f 1e fa          	endbr64 
   433fc:	55                   	push   %rbp
   433fd:	48 89 e5             	mov    %rsp,%rbp
    // unamanged and don't want to just hang.
    poweroff();
#endif
  
    while (1) {
        check_keyboard();
   43400:	e8 d2 fe ff ff       	call   432d7 <check_keyboard>
   43405:	eb f9                	jmp    43400 <fail+0x8>

0000000000043407 <panic>:

// panic, assert_fail
//    Use console_printf() to print a failure message and then wait for
//    control-C. Also write the failure message to the log.

void panic(const char* format, ...) {
   43407:	f3 0f 1e fa          	endbr64 
   4340b:	55                   	push   %rbp
   4340c:	48 89 e5             	mov    %rsp,%rbp
   4340f:	48 83 ec 60          	sub    $0x60,%rsp
   43413:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
   43417:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   4341b:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   4341f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   43423:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   43427:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4342b:	c7 45 b0 08 00 00 00 	movl   $0x8,-0x50(%rbp)
   43432:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43436:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   4343a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4343e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)

    if (format) {
   43442:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
   43447:	0f 84 87 00 00 00    	je     434d4 <panic+0xcd>
        // Print panic message to both the screen and the log
        int cpos = error_printf(CPOS(23, 0), 0xC000, "PANIC: ");
   4344d:	48 8d 05 d8 16 00 00 	lea    0x16d8(%rip),%rax        # 44b2c <complex_keymap+0x8c>
   43454:	48 89 c2             	mov    %rax,%rdx
   43457:	be 00 c0 00 00       	mov    $0xc000,%esi
   4345c:	bf 30 07 00 00       	mov    $0x730,%edi
   43461:	b8 00 00 00 00       	mov    $0x0,%eax
   43466:	e8 16 fe ff ff       	call   43281 <error_printf>
   4346b:	89 45 cc             	mov    %eax,-0x34(%rbp)
        cpos = error_vprintf(cpos, 0xC000, format, val);
   4346e:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
   43472:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
   43476:	8b 45 cc             	mov    -0x34(%rbp),%eax
   43479:	be 00 c0 00 00       	mov    $0xc000,%esi
   4347e:	89 c7                	mov    %eax,%edi
   43480:	e8 9a fd ff ff       	call   4321f <error_vprintf>
   43485:	89 45 cc             	mov    %eax,-0x34(%rbp)
        if (CCOL(cpos)) {
   43488:	8b 4d cc             	mov    -0x34(%rbp),%ecx
   4348b:	48 63 c1             	movslq %ecx,%rax
   4348e:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   43495:	48 c1 e8 20          	shr    $0x20,%rax
   43499:	c1 f8 05             	sar    $0x5,%eax
   4349c:	89 ce                	mov    %ecx,%esi
   4349e:	c1 fe 1f             	sar    $0x1f,%esi
   434a1:	29 f0                	sub    %esi,%eax
   434a3:	89 c2                	mov    %eax,%edx
   434a5:	89 d0                	mov    %edx,%eax
   434a7:	c1 e0 02             	shl    $0x2,%eax
   434aa:	01 d0                	add    %edx,%eax
   434ac:	c1 e0 04             	shl    $0x4,%eax
   434af:	29 c1                	sub    %eax,%ecx
   434b1:	89 ca                	mov    %ecx,%edx
   434b3:	85 d2                	test   %edx,%edx
   434b5:	74 3b                	je     434f2 <panic+0xeb>
            error_printf(cpos, 0xC000, "\n");
   434b7:	8b 45 cc             	mov    -0x34(%rbp),%eax
   434ba:	48 8d 15 73 16 00 00 	lea    0x1673(%rip),%rdx        # 44b34 <complex_keymap+0x94>
   434c1:	be 00 c0 00 00       	mov    $0xc000,%esi
   434c6:	89 c7                	mov    %eax,%edi
   434c8:	b8 00 00 00 00       	mov    $0x0,%eax
   434cd:	e8 af fd ff ff       	call   43281 <error_printf>
   434d2:	eb 1e                	jmp    434f2 <panic+0xeb>
        }
    } else {
        error_printf(CPOS(23, 0), 0xC000, "PANIC");
   434d4:	48 8d 05 5b 16 00 00 	lea    0x165b(%rip),%rax        # 44b36 <complex_keymap+0x96>
   434db:	48 89 c2             	mov    %rax,%rdx
   434de:	be 00 c0 00 00       	mov    $0xc000,%esi
   434e3:	bf 30 07 00 00       	mov    $0x730,%edi
   434e8:	b8 00 00 00 00       	mov    $0x0,%eax
   434ed:	e8 8f fd ff ff       	call   43281 <error_printf>
    }

    va_end(val);
    fail();
   434f2:	e8 01 ff ff ff       	call   433f8 <fail>

00000000000434f7 <assert_fail>:
}

void assert_fail(const char* file, int line, const char* msg) {
   434f7:	f3 0f 1e fa          	endbr64 
   434fb:	55                   	push   %rbp
   434fc:	48 89 e5             	mov    %rsp,%rbp
   434ff:	48 83 ec 20          	sub    $0x20,%rsp
   43503:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   43507:	89 75 f4             	mov    %esi,-0xc(%rbp)
   4350a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    panic("%s:%d: assertion '%s' failed\n", file, line, msg);
   4350e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   43512:	8b 55 f4             	mov    -0xc(%rbp),%edx
   43515:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43519:	48 89 c6             	mov    %rax,%rsi
   4351c:	48 8d 05 19 16 00 00 	lea    0x1619(%rip),%rax        # 44b3c <complex_keymap+0x9c>
   43523:	48 89 c7             	mov    %rax,%rdi
   43526:	b8 00 00 00 00       	mov    $0x0,%eax
   4352b:	e8 d7 fe ff ff       	call   43407 <panic>

0000000000043530 <program_load>:
//    `assign_physical_page` to as required. Returns 0 on success and
//    -1 on failure (e.g. out-of-memory). `allocator` is passed to
//    `virtual_memory_map`.

int program_load(proc* p, int programnumber,
                 x86_64_pagetable* (*allocator)(void)) {
   43530:	f3 0f 1e fa          	endbr64 
   43534:	55                   	push   %rbp
   43535:	48 89 e5             	mov    %rsp,%rbp
   43538:	48 83 ec 40          	sub    $0x40,%rsp
   4353c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43540:	89 75 d4             	mov    %esi,-0x2c(%rbp)
   43543:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    // is this a valid program?
    int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);
   43547:	c7 45 f8 06 00 00 00 	movl   $0x6,-0x8(%rbp)
    assert(programnumber >= 0 && programnumber < nprograms);
   4354e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
   43552:	78 08                	js     4355c <program_load+0x2c>
   43554:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   43557:	3b 45 f8             	cmp    -0x8(%rbp),%eax
   4355a:	7c 1e                	jl     4357a <program_load+0x4a>
   4355c:	48 8d 05 fd 15 00 00 	lea    0x15fd(%rip),%rax        # 44b60 <complex_keymap+0xc0>
   43563:	48 89 c2             	mov    %rax,%rdx
   43566:	be 34 00 00 00       	mov    $0x34,%esi
   4356b:	48 8d 05 1e 16 00 00 	lea    0x161e(%rip),%rax        # 44b90 <complex_keymap+0xf0>
   43572:	48 89 c7             	mov    %rax,%rdi
   43575:	e8 7d ff ff ff       	call   434f7 <assert_fail>
    elf_header* eh = (elf_header*) ramimages[programnumber].begin;
   4357a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
   4357d:	48 98                	cltq   
   4357f:	48 c1 e0 04          	shl    $0x4,%rax
   43583:	48 89 c2             	mov    %rax,%rdx
   43586:	48 8d 05 93 1a 00 00 	lea    0x1a93(%rip),%rax        # 45020 <ramimages>
   4358d:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
   43591:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    assert(eh->e_magic == ELF_MAGIC);
   43595:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43599:	8b 00                	mov    (%rax),%eax
   4359b:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
   435a0:	74 1e                	je     435c0 <program_load+0x90>
   435a2:	48 8d 05 f2 15 00 00 	lea    0x15f2(%rip),%rax        # 44b9b <complex_keymap+0xfb>
   435a9:	48 89 c2             	mov    %rax,%rdx
   435ac:	be 36 00 00 00       	mov    $0x36,%esi
   435b1:	48 8d 05 d8 15 00 00 	lea    0x15d8(%rip),%rax        # 44b90 <complex_keymap+0xf0>
   435b8:	48 89 c7             	mov    %rax,%rdi
   435bb:	e8 37 ff ff ff       	call   434f7 <assert_fail>

    // load each loadable program segment into memory
    elf_program* ph = (elf_program*) ((const uint8_t*) eh + eh->e_phoff);
   435c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   435c4:	48 8b 50 20          	mov    0x20(%rax),%rdx
   435c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   435cc:	48 01 d0             	add    %rdx,%rax
   435cf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    for (int i = 0; i < eh->e_phnum; ++i) {
   435d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   435da:	e9 94 00 00 00       	jmp    43673 <program_load+0x143>
        if (ph[i].p_type == ELF_PTYPE_LOAD) {
   435df:	8b 45 fc             	mov    -0x4(%rbp),%eax
   435e2:	48 63 d0             	movslq %eax,%rdx
   435e5:	48 89 d0             	mov    %rdx,%rax
   435e8:	48 c1 e0 03          	shl    $0x3,%rax
   435ec:	48 29 d0             	sub    %rdx,%rax
   435ef:	48 c1 e0 03          	shl    $0x3,%rax
   435f3:	48 89 c2             	mov    %rax,%rdx
   435f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   435fa:	48 01 d0             	add    %rdx,%rax
   435fd:	8b 00                	mov    (%rax),%eax
   435ff:	83 f8 01             	cmp    $0x1,%eax
   43602:	75 6b                	jne    4366f <program_load+0x13f>
            const uint8_t* pdata = (const uint8_t*) eh + ph[i].p_offset;
   43604:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43607:	48 63 d0             	movslq %eax,%rdx
   4360a:	48 89 d0             	mov    %rdx,%rax
   4360d:	48 c1 e0 03          	shl    $0x3,%rax
   43611:	48 29 d0             	sub    %rdx,%rax
   43614:	48 c1 e0 03          	shl    $0x3,%rax
   43618:	48 89 c2             	mov    %rax,%rdx
   4361b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4361f:	48 01 d0             	add    %rdx,%rax
   43622:	48 8b 50 08          	mov    0x8(%rax),%rdx
   43626:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4362a:	48 01 d0             	add    %rdx,%rax
   4362d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
            if (program_load_segment(p, &ph[i], pdata, allocator) < 0) {
   43631:	8b 45 fc             	mov    -0x4(%rbp),%eax
   43634:	48 63 d0             	movslq %eax,%rdx
   43637:	48 89 d0             	mov    %rdx,%rax
   4363a:	48 c1 e0 03          	shl    $0x3,%rax
   4363e:	48 29 d0             	sub    %rdx,%rax
   43641:	48 c1 e0 03          	shl    $0x3,%rax
   43645:	48 89 c2             	mov    %rax,%rdx
   43648:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   4364c:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   43650:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   43654:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
   43658:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4365c:	48 89 c7             	mov    %rax,%rdi
   4365f:	e8 3d 00 00 00       	call   436a1 <program_load_segment>
   43664:	85 c0                	test   %eax,%eax
   43666:	79 07                	jns    4366f <program_load+0x13f>
                return -1;
   43668:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4366d:	eb 30                	jmp    4369f <program_load+0x16f>
    for (int i = 0; i < eh->e_phnum; ++i) {
   4366f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
   43673:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43677:	0f b7 40 38          	movzwl 0x38(%rax),%eax
   4367b:	0f b7 c0             	movzwl %ax,%eax
   4367e:	39 45 fc             	cmp    %eax,-0x4(%rbp)
   43681:	0f 8c 58 ff ff ff    	jl     435df <program_load+0xaf>
            }
        }
    }

    // set the entry point from the ELF header
    p->p_registers.reg_rip = eh->e_entry;
   43687:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   4368b:	48 8b 50 18          	mov    0x18(%rax),%rdx
   4368f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43693:	48 89 90 a0 00 00 00 	mov    %rdx,0xa0(%rax)
    return 0;
   4369a:	b8 00 00 00 00       	mov    $0x0,%eax
}
   4369f:	c9                   	leave  
   436a0:	c3                   	ret    

00000000000436a1 <program_load_segment>:
//    Calls `assign_physical_page` to allocate pages and `virtual_memory_map`
//    to map them in `p->p_pagetable`. Returns 0 on success and -1 on failure.

static int program_load_segment(proc* p, const elf_program* ph,
                                const uint8_t* src,
                                x86_64_pagetable* (*allocator)(void)) {
   436a1:	f3 0f 1e fa          	endbr64 
   436a5:	55                   	push   %rbp
   436a6:	48 89 e5             	mov    %rsp,%rbp
   436a9:	48 83 ec 40          	sub    $0x40,%rsp
   436ad:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   436b1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   436b5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   436b9:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    uintptr_t va = (uintptr_t) ph->p_va;
   436bd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   436c1:	48 8b 40 10          	mov    0x10(%rax),%rax
   436c5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    uintptr_t end_file = va + ph->p_filesz, end_mem = va + ph->p_memsz;
   436c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   436cd:	48 8b 50 20          	mov    0x20(%rax),%rdx
   436d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436d5:	48 01 d0             	add    %rdx,%rax
   436d8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   436dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   436e0:	48 8b 50 28          	mov    0x28(%rax),%rdx
   436e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436e8:	48 01 d0             	add    %rdx,%rax
   436eb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    va &= ~(PAGESIZE - 1);                // round to page boundary
   436ef:	48 81 65 f0 00 f0 ff 	andq   $0xfffffffffffff000,-0x10(%rbp)
   436f6:	ff 

    // allocate memory
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   436f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   436fb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   436ff:	e9 88 00 00 00       	jmp    4378c <program_load_segment+0xeb>
        if (assign_physical_page(addr, p->p_pid) < 0
   43704:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43708:	8b 00                	mov    (%rax),%eax
   4370a:	0f be d0             	movsbl %al,%edx
   4370d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43711:	89 d6                	mov    %edx,%esi
   43713:	48 89 c7             	mov    %rax,%rdi
   43716:	e8 0c d0 ff ff       	call   40727 <assign_physical_page>
   4371b:	85 c0                	test   %eax,%eax
   4371d:	78 31                	js     43750 <program_load_segment+0xaf>
            || virtual_memory_map(p->p_pagetable, addr, addr, PAGESIZE,
   4371f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43723:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   4372a:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   4372e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43732:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   43736:	49 89 c9             	mov    %rcx,%r9
   43739:	41 b8 07 00 00 00    	mov    $0x7,%r8d
   4373f:	b9 00 10 00 00       	mov    $0x1000,%ecx
   43744:	48 89 c7             	mov    %rax,%rdi
   43747:	e8 f0 ec ff ff       	call   4243c <virtual_memory_map>
   4374c:	85 c0                	test   %eax,%eax
   4374e:	79 34                	jns    43784 <program_load_segment+0xe3>
                                  PTE_P | PTE_W | PTE_U, allocator) < 0) {
            console_printf(CPOS(22, 0), 0xC000, "program_load_segment(pid %d): can't assign address %p\n", p->p_pid, addr);
   43750:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43754:	8b 00                	mov    (%rax),%eax
   43756:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   4375a:	49 89 d0             	mov    %rdx,%r8
   4375d:	89 c1                	mov    %eax,%ecx
   4375f:	48 8d 05 52 14 00 00 	lea    0x1452(%rip),%rax        # 44bb8 <complex_keymap+0x118>
   43766:	48 89 c2             	mov    %rax,%rdx
   43769:	be 00 c0 00 00       	mov    $0xc000,%esi
   4376e:	bf e0 06 00 00       	mov    $0x6e0,%edi
   43773:	b8 00 00 00 00       	mov    $0x0,%eax
   43778:	e8 1f 0a 00 00       	call   4419c <console_printf>
            return -1;
   4377d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43782:	eb 77                	jmp    437fb <program_load_segment+0x15a>
    for (uintptr_t addr = va; addr < end_mem; addr += PAGESIZE) {
   43784:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
   4378b:	00 
   4378c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   43790:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
   43794:	0f 82 6a ff ff ff    	jb     43704 <program_load_segment+0x63>
        }
    }

    // ensure new memory mappings are active
    set_pagetable(p->p_pagetable);
   4379a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4379e:	48 8b 80 d0 00 00 00 	mov    0xd0(%rax),%rax
   437a5:	48 89 c7             	mov    %rax,%rdi
   437a8:	e8 fd f1 ff ff       	call   429aa <set_pagetable>

    // copy data from executable image into process memory
    memcpy((uint8_t*) va, src, end_file - va);
   437ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   437b1:	48 2b 45 f0          	sub    -0x10(%rbp),%rax
   437b5:	48 89 c2             	mov    %rax,%rdx
   437b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   437bc:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   437c0:	48 89 ce             	mov    %rcx,%rsi
   437c3:	48 89 c7             	mov    %rax,%rdi
   437c6:	e8 df 00 00 00       	call   438aa <memcpy>
    memset((uint8_t*) end_file, 0, end_mem - end_file);
   437cb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   437cf:	48 2b 45 e8          	sub    -0x18(%rbp),%rax
   437d3:	48 89 c2             	mov    %rax,%rdx
   437d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   437da:	be 00 00 00 00       	mov    $0x0,%esi
   437df:	48 89 c7             	mov    %rax,%rdi
   437e2:	e8 34 01 00 00       	call   4391b <memset>

    // restore kernel pagetable
    set_pagetable(kernel_pagetable);
   437e7:	48 8b 05 12 18 01 00 	mov    0x11812(%rip),%rax        # 55000 <kernel_pagetable>
   437ee:	48 89 c7             	mov    %rax,%rdi
   437f1:	e8 b4 f1 ff ff       	call   429aa <set_pagetable>
    return 0;
   437f6:	b8 00 00 00 00       	mov    $0x0,%eax
}
   437fb:	c9                   	leave  
   437fc:	c3                   	ret    

00000000000437fd <console_putc>:
typedef struct console_printer {
    printer p;
    uint16_t* cursor;
} console_printer;

static void console_putc(printer* p, unsigned char c, int color) {
   437fd:	f3 0f 1e fa          	endbr64 
   43801:	48 89 f9             	mov    %rdi,%rcx
   43804:	89 d7                	mov    %edx,%edi
    console_printer* cp = (console_printer*) p;
    if (cp->cursor >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   43806:	48 8d 05 93 57 07 00 	lea    0x75793(%rip),%rax        # b8fa0 <console+0xfa0>
   4380d:	48 39 41 08          	cmp    %rax,0x8(%rcx)
   43811:	72 0b                	jb     4381e <console_putc+0x21>
        cp->cursor = console;
   43813:	48 8d 80 60 f0 ff ff 	lea    -0xfa0(%rax),%rax
   4381a:	48 89 41 08          	mov    %rax,0x8(%rcx)
    }
    if (c == '\n') {
   4381e:	40 80 fe 0a          	cmp    $0xa,%sil
   43822:	74 16                	je     4383a <console_putc+0x3d>
        int pos = (cp->cursor - console) % 80;
        for (; pos != 80; pos++) {
            *cp->cursor++ = ' ' | color;
        }
    } else {
        *cp->cursor++ = c | color;
   43824:	48 8b 41 08          	mov    0x8(%rcx),%rax
   43828:	48 8d 50 02          	lea    0x2(%rax),%rdx
   4382c:	48 89 51 08          	mov    %rdx,0x8(%rcx)
   43830:	40 0f b6 f6          	movzbl %sil,%esi
   43834:	09 fe                	or     %edi,%esi
   43836:	66 89 30             	mov    %si,(%rax)
    }
}
   43839:	c3                   	ret    
        int pos = (cp->cursor - console) % 80;
   4383a:	48 8d 05 bf 47 07 00 	lea    0x747bf(%rip),%rax        # b8000 <console>
   43841:	4c 8b 41 08          	mov    0x8(%rcx),%r8
   43845:	49 29 c0             	sub    %rax,%r8
   43848:	4c 89 c6             	mov    %r8,%rsi
   4384b:	48 d1 fe             	sar    %rsi
   4384e:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   43855:	66 66 66 
   43858:	48 89 f0             	mov    %rsi,%rax
   4385b:	48 f7 ea             	imul   %rdx
   4385e:	48 c1 fa 05          	sar    $0x5,%rdx
   43862:	49 c1 f8 3f          	sar    $0x3f,%r8
   43866:	4c 29 c2             	sub    %r8,%rdx
   43869:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   4386d:	48 c1 e2 04          	shl    $0x4,%rdx
   43871:	89 f0                	mov    %esi,%eax
   43873:	29 d0                	sub    %edx,%eax
            *cp->cursor++ = ' ' | color;
   43875:	83 cf 20             	or     $0x20,%edi
   43878:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   4387c:	48 8d 72 02          	lea    0x2(%rdx),%rsi
   43880:	48 89 71 08          	mov    %rsi,0x8(%rcx)
   43884:	66 89 3a             	mov    %di,(%rdx)
        for (; pos != 80; pos++) {
   43887:	83 c0 01             	add    $0x1,%eax
   4388a:	83 f8 50             	cmp    $0x50,%eax
   4388d:	75 e9                	jne    43878 <console_putc+0x7b>
   4388f:	c3                   	ret    

0000000000043890 <string_putc>:
    printer p;
    char* s;
    char* end;
} string_printer;

static void string_putc(printer* p, unsigned char c, int color) {
   43890:	f3 0f 1e fa          	endbr64 
    string_printer* sp = (string_printer*) p;
    if (sp->s < sp->end) {
   43894:	48 8b 47 08          	mov    0x8(%rdi),%rax
   43898:	48 3b 47 10          	cmp    0x10(%rdi),%rax
   4389c:	73 0b                	jae    438a9 <string_putc+0x19>
        *sp->s++ = c;
   4389e:	48 8d 50 01          	lea    0x1(%rax),%rdx
   438a2:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   438a6:	40 88 30             	mov    %sil,(%rax)
    }
    (void) color;
}
   438a9:	c3                   	ret    

00000000000438aa <memcpy>:
void* memcpy(void* dst, const void* src, size_t n) {
   438aa:	f3 0f 1e fa          	endbr64 
   438ae:	48 89 f8             	mov    %rdi,%rax
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   438b1:	48 85 d2             	test   %rdx,%rdx
   438b4:	74 17                	je     438cd <memcpy+0x23>
   438b6:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   438bb:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   438c0:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   438c4:	48 83 c1 01          	add    $0x1,%rcx
   438c8:	48 39 d1             	cmp    %rdx,%rcx
   438cb:	75 ee                	jne    438bb <memcpy+0x11>
}
   438cd:	c3                   	ret    

00000000000438ce <memmove>:
void* memmove(void* dst, const void* src, size_t n) {
   438ce:	f3 0f 1e fa          	endbr64 
   438d2:	48 89 f8             	mov    %rdi,%rax
    if (s < d && s + n > d) {
   438d5:	48 39 fe             	cmp    %rdi,%rsi
   438d8:	72 1d                	jb     438f7 <memmove+0x29>
        while (n-- > 0) {
   438da:	b9 00 00 00 00       	mov    $0x0,%ecx
   438df:	48 85 d2             	test   %rdx,%rdx
   438e2:	74 12                	je     438f6 <memmove+0x28>
            *d++ = *s++;
   438e4:	0f b6 3c 0e          	movzbl (%rsi,%rcx,1),%edi
   438e8:	40 88 3c 08          	mov    %dil,(%rax,%rcx,1)
        while (n-- > 0) {
   438ec:	48 83 c1 01          	add    $0x1,%rcx
   438f0:	48 39 ca             	cmp    %rcx,%rdx
   438f3:	75 ef                	jne    438e4 <memmove+0x16>
}
   438f5:	c3                   	ret    
   438f6:	c3                   	ret    
    if (s < d && s + n > d) {
   438f7:	48 8d 0c 16          	lea    (%rsi,%rdx,1),%rcx
   438fb:	48 39 cf             	cmp    %rcx,%rdi
   438fe:	73 da                	jae    438da <memmove+0xc>
        while (n-- > 0) {
   43900:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
   43904:	48 85 d2             	test   %rdx,%rdx
   43907:	74 ec                	je     438f5 <memmove+0x27>
            *--d = *--s;
   43909:	0f b6 14 0e          	movzbl (%rsi,%rcx,1),%edx
   4390d:	88 14 08             	mov    %dl,(%rax,%rcx,1)
        while (n-- > 0) {
   43910:	48 83 e9 01          	sub    $0x1,%rcx
   43914:	48 83 f9 ff          	cmp    $0xffffffffffffffff,%rcx
   43918:	75 ef                	jne    43909 <memmove+0x3b>
   4391a:	c3                   	ret    

000000000004391b <memset>:
void* memset(void* v, int c, size_t n) {
   4391b:	f3 0f 1e fa          	endbr64 
   4391f:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43922:	48 85 d2             	test   %rdx,%rdx
   43925:	74 12                	je     43939 <memset+0x1e>
   43927:	48 01 fa             	add    %rdi,%rdx
   4392a:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   4392d:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   43930:	48 83 c1 01          	add    $0x1,%rcx
   43934:	48 39 ca             	cmp    %rcx,%rdx
   43937:	75 f4                	jne    4392d <memset+0x12>
}
   43939:	c3                   	ret    

000000000004393a <strlen>:
size_t strlen(const char* s) {
   4393a:	f3 0f 1e fa          	endbr64 
    for (n = 0; *s != '\0'; ++s) {
   4393e:	80 3f 00             	cmpb   $0x0,(%rdi)
   43941:	74 10                	je     43953 <strlen+0x19>
   43943:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   43948:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   4394c:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   43950:	75 f6                	jne    43948 <strlen+0xe>
   43952:	c3                   	ret    
   43953:	b8 00 00 00 00       	mov    $0x0,%eax
}
   43958:	c3                   	ret    

0000000000043959 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
   43959:	f3 0f 1e fa          	endbr64 
   4395d:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43960:	ba 00 00 00 00       	mov    $0x0,%edx
   43965:	48 85 f6             	test   %rsi,%rsi
   43968:	74 11                	je     4397b <strnlen+0x22>
   4396a:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   4396e:	74 0c                	je     4397c <strnlen+0x23>
        ++n;
   43970:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   43974:	48 39 d0             	cmp    %rdx,%rax
   43977:	75 f1                	jne    4396a <strnlen+0x11>
   43979:	eb 04                	jmp    4397f <strnlen+0x26>
   4397b:	c3                   	ret    
   4397c:	48 89 d0             	mov    %rdx,%rax
}
   4397f:	c3                   	ret    

0000000000043980 <strcpy>:
char* strcpy(char* dst, const char* src) {
   43980:	f3 0f 1e fa          	endbr64 
   43984:	48 89 f8             	mov    %rdi,%rax
   43987:	ba 00 00 00 00       	mov    $0x0,%edx
        *d++ = *src++;
   4398c:	0f b6 0c 16          	movzbl (%rsi,%rdx,1),%ecx
   43990:	88 0c 10             	mov    %cl,(%rax,%rdx,1)
    } while (d[-1]);
   43993:	48 83 c2 01          	add    $0x1,%rdx
   43997:	84 c9                	test   %cl,%cl
   43999:	75 f1                	jne    4398c <strcpy+0xc>
}
   4399b:	c3                   	ret    

000000000004399c <strcmp>:
int strcmp(const char* a, const char* b) {
   4399c:	f3 0f 1e fa          	endbr64 
    while (*a && *b && *a == *b) {
   439a0:	0f b6 07             	movzbl (%rdi),%eax
   439a3:	84 c0                	test   %al,%al
   439a5:	74 1a                	je     439c1 <strcmp+0x25>
   439a7:	0f b6 16             	movzbl (%rsi),%edx
   439aa:	38 c2                	cmp    %al,%dl
   439ac:	75 13                	jne    439c1 <strcmp+0x25>
   439ae:	84 d2                	test   %dl,%dl
   439b0:	74 0f                	je     439c1 <strcmp+0x25>
        ++a, ++b;
   439b2:	48 83 c7 01          	add    $0x1,%rdi
   439b6:	48 83 c6 01          	add    $0x1,%rsi
    while (*a && *b && *a == *b) {
   439ba:	0f b6 07             	movzbl (%rdi),%eax
   439bd:	84 c0                	test   %al,%al
   439bf:	75 e6                	jne    439a7 <strcmp+0xb>
    return ((unsigned char) *a > (unsigned char) *b)
   439c1:	3a 06                	cmp    (%rsi),%al
   439c3:	0f 97 c0             	seta   %al
   439c6:	0f b6 c0             	movzbl %al,%eax
        - ((unsigned char) *a < (unsigned char) *b);
   439c9:	83 d8 00             	sbb    $0x0,%eax
}
   439cc:	c3                   	ret    

00000000000439cd <strchr>:
char* strchr(const char* s, int c) {
   439cd:	f3 0f 1e fa          	endbr64 
    while (*s && *s != (char) c) {
   439d1:	0f b6 07             	movzbl (%rdi),%eax
   439d4:	84 c0                	test   %al,%al
   439d6:	74 10                	je     439e8 <strchr+0x1b>
   439d8:	40 38 f0             	cmp    %sil,%al
   439db:	74 18                	je     439f5 <strchr+0x28>
        ++s;
   439dd:	48 83 c7 01          	add    $0x1,%rdi
    while (*s && *s != (char) c) {
   439e1:	0f b6 07             	movzbl (%rdi),%eax
   439e4:	84 c0                	test   %al,%al
   439e6:	75 f0                	jne    439d8 <strchr+0xb>
        return NULL;
   439e8:	40 84 f6             	test   %sil,%sil
   439eb:	b8 00 00 00 00       	mov    $0x0,%eax
   439f0:	48 0f 44 c7          	cmove  %rdi,%rax
}
   439f4:	c3                   	ret    
   439f5:	48 89 f8             	mov    %rdi,%rax
   439f8:	c3                   	ret    

00000000000439f9 <rand>:
int rand(void) {
   439f9:	f3 0f 1e fa          	endbr64 
    if (!rand_seed_set) {
   439fd:	83 3d 08 86 01 00 00 	cmpl   $0x0,0x18608(%rip)        # 5c00c <rand_seed_set>
   43a04:	74 1b                	je     43a21 <rand+0x28>
    rand_seed = rand_seed * 1664525U + 1013904223U;
   43a06:	69 05 f8 85 01 00 0d 	imul   $0x19660d,0x185f8(%rip),%eax        # 5c008 <rand_seed>
   43a0d:	66 19 00 
   43a10:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
   43a15:	89 05 ed 85 01 00    	mov    %eax,0x185ed(%rip)        # 5c008 <rand_seed>
    return rand_seed & RAND_MAX;
   43a1b:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
   43a20:	c3                   	ret    
    rand_seed = seed;
   43a21:	c7 05 dd 85 01 00 9e 	movl   $0x30d4879e,0x185dd(%rip)        # 5c008 <rand_seed>
   43a28:	87 d4 30 
    rand_seed_set = 1;
   43a2b:	c7 05 d7 85 01 00 01 	movl   $0x1,0x185d7(%rip)        # 5c00c <rand_seed_set>
   43a32:	00 00 00 
}
   43a35:	eb cf                	jmp    43a06 <rand+0xd>

0000000000043a37 <srand>:
void srand(unsigned seed) {
   43a37:	f3 0f 1e fa          	endbr64 
    rand_seed = seed;
   43a3b:	89 3d c7 85 01 00    	mov    %edi,0x185c7(%rip)        # 5c008 <rand_seed>
    rand_seed_set = 1;
   43a41:	c7 05 c1 85 01 00 01 	movl   $0x1,0x185c1(%rip)        # 5c00c <rand_seed_set>
   43a48:	00 00 00 
}
   43a4b:	c3                   	ret    

0000000000043a4c <printer_vprintf>:
void printer_vprintf(printer* p, int color, const char* format, va_list val) {
   43a4c:	f3 0f 1e fa          	endbr64 
   43a50:	55                   	push   %rbp
   43a51:	48 89 e5             	mov    %rsp,%rbp
   43a54:	41 57                	push   %r15
   43a56:	41 56                	push   %r14
   43a58:	41 55                	push   %r13
   43a5a:	41 54                	push   %r12
   43a5c:	53                   	push   %rbx
   43a5d:	48 83 ec 58          	sub    $0x58,%rsp
   43a61:	49 89 fe             	mov    %rdi,%r14
   43a64:	89 75 ac             	mov    %esi,-0x54(%rbp)
   43a67:	49 89 d4             	mov    %rdx,%r12
   43a6a:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
   43a6e:	0f b6 02             	movzbl (%rdx),%eax
   43a71:	84 c0                	test   %al,%al
   43a73:	0f 85 cd 04 00 00    	jne    43f46 <printer_vprintf+0x4fa>
}
   43a79:	48 83 c4 58          	add    $0x58,%rsp
   43a7d:	5b                   	pop    %rbx
   43a7e:	41 5c                	pop    %r12
   43a80:	41 5d                	pop    %r13
   43a82:	41 5e                	pop    %r14
   43a84:	41 5f                	pop    %r15
   43a86:	5d                   	pop    %rbp
   43a87:	c3                   	ret    
        for (++format; *format; ++format) {
   43a88:	4d 8d 7c 24 01       	lea    0x1(%r12),%r15
   43a8d:	41 0f b6 5c 24 01    	movzbl 0x1(%r12),%ebx
   43a93:	84 db                	test   %bl,%bl
   43a95:	0f 84 a4 06 00 00    	je     4413f <printer_vprintf+0x6f3>
        int flags = 0;
   43a9b:	41 bd 00 00 00 00    	mov    $0x0,%r13d
            const char* flagc = strchr(flag_chars, *format);
   43aa1:	4c 8d 25 69 12 00 00 	lea    0x1269(%rip),%r12        # 44d11 <flag_chars>
   43aa8:	0f be f3             	movsbl %bl,%esi
   43aab:	4c 89 e7             	mov    %r12,%rdi
   43aae:	e8 1a ff ff ff       	call   439cd <strchr>
   43ab3:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   43ab6:	48 85 c0             	test   %rax,%rax
   43ab9:	74 5c                	je     43b17 <printer_vprintf+0xcb>
                flags |= 1 << (flagc - flag_chars);
   43abb:	4c 29 e1             	sub    %r12,%rcx
   43abe:	b8 01 00 00 00       	mov    $0x1,%eax
   43ac3:	d3 e0                	shl    %cl,%eax
   43ac5:	41 09 c5             	or     %eax,%r13d
        for (++format; *format; ++format) {
   43ac8:	49 83 c7 01          	add    $0x1,%r15
   43acc:	41 0f b6 1f          	movzbl (%r15),%ebx
   43ad0:	84 db                	test   %bl,%bl
   43ad2:	75 d4                	jne    43aa8 <printer_vprintf+0x5c>
   43ad4:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
        int width = -1;
   43ad8:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   43ade:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
        if (*format == '.') {
   43ae5:	41 80 3f 2e          	cmpb   $0x2e,(%r15)
   43ae9:	0f 84 b3 00 00 00    	je     43ba2 <printer_vprintf+0x156>
        int length = 0;
   43aef:	b9 00 00 00 00       	mov    $0x0,%ecx
        switch (*format) {
   43af4:	41 0f b6 17          	movzbl (%r15),%edx
   43af8:	8d 42 bd             	lea    -0x43(%rdx),%eax
   43afb:	3c 37                	cmp    $0x37,%al
   43afd:	0f 87 e0 04 00 00    	ja     43fe3 <printer_vprintf+0x597>
   43b03:	0f b6 c0             	movzbl %al,%eax
   43b06:	48 8d 3d f3 10 00 00 	lea    0x10f3(%rip),%rdi        # 44c00 <complex_keymap+0x160>
   43b0d:	48 63 04 87          	movslq (%rdi,%rax,4),%rax
   43b11:	48 01 f8             	add    %rdi,%rax
   43b14:	3e ff e0             	notrack jmp *%rax
        if (*format >= '1' && *format <= '9') {
   43b17:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
   43b1b:	8d 43 cf             	lea    -0x31(%rbx),%eax
   43b1e:	3c 08                	cmp    $0x8,%al
   43b20:	77 31                	ja     43b53 <printer_vprintf+0x107>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43b22:	41 0f b6 07          	movzbl (%r15),%eax
   43b26:	8d 50 d0             	lea    -0x30(%rax),%edx
   43b29:	80 fa 09             	cmp    $0x9,%dl
   43b2c:	77 5e                	ja     43b8c <printer_vprintf+0x140>
   43b2e:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   43b34:	49 83 c7 01          	add    $0x1,%r15
   43b38:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   43b3d:	0f be c0             	movsbl %al,%eax
   43b40:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43b45:	41 0f b6 07          	movzbl (%r15),%eax
   43b49:	8d 50 d0             	lea    -0x30(%rax),%edx
   43b4c:	80 fa 09             	cmp    $0x9,%dl
   43b4f:	76 e3                	jbe    43b34 <printer_vprintf+0xe8>
   43b51:	eb 8b                	jmp    43ade <printer_vprintf+0x92>
        } else if (*format == '*') {
   43b53:	80 fb 2a             	cmp    $0x2a,%bl
   43b56:	75 3f                	jne    43b97 <printer_vprintf+0x14b>
            width = va_arg(val, int);
   43b58:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43b5c:	8b 07                	mov    (%rdi),%eax
   43b5e:	83 f8 2f             	cmp    $0x2f,%eax
   43b61:	77 17                	ja     43b7a <printer_vprintf+0x12e>
   43b63:	89 c2                	mov    %eax,%edx
   43b65:	48 03 57 10          	add    0x10(%rdi),%rdx
   43b69:	83 c0 08             	add    $0x8,%eax
   43b6c:	89 07                	mov    %eax,(%rdi)
   43b6e:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   43b71:	49 83 c7 01          	add    $0x1,%r15
   43b75:	e9 64 ff ff ff       	jmp    43ade <printer_vprintf+0x92>
            width = va_arg(val, int);
   43b7a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43b7e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43b82:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43b86:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43b8a:	eb e2                	jmp    43b6e <printer_vprintf+0x122>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   43b8c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   43b92:	e9 47 ff ff ff       	jmp    43ade <printer_vprintf+0x92>
        int width = -1;
   43b97:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   43b9d:	e9 3c ff ff ff       	jmp    43ade <printer_vprintf+0x92>
            ++format;
   43ba2:	49 8d 57 01          	lea    0x1(%r15),%rdx
            if (*format >= '0' && *format <= '9') {
   43ba6:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   43bab:	8d 48 d0             	lea    -0x30(%rax),%ecx
   43bae:	80 f9 09             	cmp    $0x9,%cl
   43bb1:	76 13                	jbe    43bc6 <printer_vprintf+0x17a>
            } else if (*format == '*') {
   43bb3:	3c 2a                	cmp    $0x2a,%al
   43bb5:	74 33                	je     43bea <printer_vprintf+0x19e>
            ++format;
   43bb7:	49 89 d7             	mov    %rdx,%r15
                precision = 0;
   43bba:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
   43bc1:	e9 29 ff ff ff       	jmp    43aef <printer_vprintf+0xa3>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43bc6:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   43bcb:	48 83 c2 01          	add    $0x1,%rdx
   43bcf:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   43bd2:	0f be c0             	movsbl %al,%eax
   43bd5:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   43bd9:	0f b6 02             	movzbl (%rdx),%eax
   43bdc:	8d 70 d0             	lea    -0x30(%rax),%esi
   43bdf:	40 80 fe 09          	cmp    $0x9,%sil
   43be3:	76 e6                	jbe    43bcb <printer_vprintf+0x17f>
                    precision = 10 * precision + *format++ - '0';
   43be5:	49 89 d7             	mov    %rdx,%r15
   43be8:	eb 1c                	jmp    43c06 <printer_vprintf+0x1ba>
                precision = va_arg(val, int);
   43bea:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43bee:	8b 01                	mov    (%rcx),%eax
   43bf0:	83 f8 2f             	cmp    $0x2f,%eax
   43bf3:	77 23                	ja     43c18 <printer_vprintf+0x1cc>
   43bf5:	89 c2                	mov    %eax,%edx
   43bf7:	48 03 51 10          	add    0x10(%rcx),%rdx
   43bfb:	83 c0 08             	add    $0x8,%eax
   43bfe:	89 01                	mov    %eax,(%rcx)
   43c00:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   43c02:	49 83 c7 02          	add    $0x2,%r15
            if (precision < 0) {
   43c06:	85 c9                	test   %ecx,%ecx
   43c08:	b8 00 00 00 00       	mov    $0x0,%eax
   43c0d:	0f 49 c1             	cmovns %ecx,%eax
   43c10:	89 45 a8             	mov    %eax,-0x58(%rbp)
   43c13:	e9 d7 fe ff ff       	jmp    43aef <printer_vprintf+0xa3>
                precision = va_arg(val, int);
   43c18:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43c1c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43c20:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43c24:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43c28:	eb d6                	jmp    43c00 <printer_vprintf+0x1b4>
        switch (*format) {
   43c2a:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43c2f:	e9 f6 00 00 00       	jmp    43d2a <printer_vprintf+0x2de>
            ++format;
   43c34:	49 83 c7 01          	add    $0x1,%r15
            length = 1;
   43c38:	b9 01 00 00 00       	mov    $0x1,%ecx
            goto again;
   43c3d:	e9 b2 fe ff ff       	jmp    43af4 <printer_vprintf+0xa8>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43c42:	85 c9                	test   %ecx,%ecx
   43c44:	74 56                	je     43c9c <printer_vprintf+0x250>
   43c46:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43c4a:	8b 07                	mov    (%rdi),%eax
   43c4c:	83 f8 2f             	cmp    $0x2f,%eax
   43c4f:	77 39                	ja     43c8a <printer_vprintf+0x23e>
   43c51:	89 c2                	mov    %eax,%edx
   43c53:	48 03 57 10          	add    0x10(%rdi),%rdx
   43c57:	83 c0 08             	add    $0x8,%eax
   43c5a:	89 07                	mov    %eax,(%rdi)
   43c5c:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   43c5f:	48 89 d0             	mov    %rdx,%rax
   43c62:	48 c1 f8 38          	sar    $0x38,%rax
            num = negative ? -x : x;
   43c66:	49 89 d0             	mov    %rdx,%r8
   43c69:	49 f7 d8             	neg    %r8
   43c6c:	25 80 00 00 00       	and    $0x80,%eax
   43c71:	4c 0f 44 c2          	cmove  %rdx,%r8
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   43c75:	0b 45 a0             	or     -0x60(%rbp),%eax
   43c78:	83 c8 60             	or     $0x60,%eax
   43c7b:	89 45 a0             	mov    %eax,-0x60(%rbp)
        char* data = "";
   43c7e:	4c 8d 25 72 0f 00 00 	lea    0xf72(%rip),%r12        # 44bf7 <complex_keymap+0x157>
            break;
   43c85:	e9 39 01 00 00       	jmp    43dc3 <printer_vprintf+0x377>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   43c8a:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43c8e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43c92:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43c96:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43c9a:	eb c0                	jmp    43c5c <printer_vprintf+0x210>
   43c9c:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43ca0:	8b 01                	mov    (%rcx),%eax
   43ca2:	83 f8 2f             	cmp    $0x2f,%eax
   43ca5:	77 10                	ja     43cb7 <printer_vprintf+0x26b>
   43ca7:	89 c2                	mov    %eax,%edx
   43ca9:	48 03 51 10          	add    0x10(%rcx),%rdx
   43cad:	83 c0 08             	add    $0x8,%eax
   43cb0:	89 01                	mov    %eax,(%rcx)
   43cb2:	48 63 12             	movslq (%rdx),%rdx
   43cb5:	eb a8                	jmp    43c5f <printer_vprintf+0x213>
   43cb7:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43cbb:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43cbf:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43cc3:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43cc7:	eb e9                	jmp    43cb2 <printer_vprintf+0x266>
        int base = 10;
   43cc9:	be 0a 00 00 00       	mov    $0xa,%esi
   43cce:	eb 5a                	jmp    43d2a <printer_vprintf+0x2de>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43cd0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43cd4:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43cd8:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43cdc:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43ce0:	eb 62                	jmp    43d44 <printer_vprintf+0x2f8>
   43ce2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43ce6:	8b 07                	mov    (%rdi),%eax
   43ce8:	83 f8 2f             	cmp    $0x2f,%eax
   43ceb:	77 10                	ja     43cfd <printer_vprintf+0x2b1>
   43ced:	89 c2                	mov    %eax,%edx
   43cef:	48 03 57 10          	add    0x10(%rdi),%rdx
   43cf3:	83 c0 08             	add    $0x8,%eax
   43cf6:	89 07                	mov    %eax,(%rdi)
   43cf8:	44 8b 02             	mov    (%rdx),%r8d
   43cfb:	eb 4a                	jmp    43d47 <printer_vprintf+0x2fb>
   43cfd:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43d01:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43d05:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43d09:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43d0d:	eb e9                	jmp    43cf8 <printer_vprintf+0x2ac>
   43d0f:	41 89 f1             	mov    %esi,%r9d
        if (flags & FLAG_NUMERIC) {
   43d12:	c7 45 98 20 00 00 00 	movl   $0x20,-0x68(%rbp)
    const char* digits = upper_digits;
   43d19:	48 8d 3d e0 0f 00 00 	lea    0xfe0(%rip),%rdi        # 44d00 <upper_digits.1>
   43d20:	e9 f3 02 00 00       	jmp    44018 <printer_vprintf+0x5cc>
            base = 16;
   43d25:	be 10 00 00 00       	mov    $0x10,%esi
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   43d2a:	85 c9                	test   %ecx,%ecx
   43d2c:	74 b4                	je     43ce2 <printer_vprintf+0x296>
   43d2e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43d32:	8b 01                	mov    (%rcx),%eax
   43d34:	83 f8 2f             	cmp    $0x2f,%eax
   43d37:	77 97                	ja     43cd0 <printer_vprintf+0x284>
   43d39:	89 c2                	mov    %eax,%edx
   43d3b:	48 03 51 10          	add    0x10(%rcx),%rdx
   43d3f:	83 c0 08             	add    $0x8,%eax
   43d42:	89 01                	mov    %eax,(%rcx)
   43d44:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_NUMERIC;
   43d47:	83 4d a0 20          	orl    $0x20,-0x60(%rbp)
    if (base < 0) {
   43d4b:	85 f6                	test   %esi,%esi
   43d4d:	79 c0                	jns    43d0f <printer_vprintf+0x2c3>
        base = -base;
   43d4f:	41 89 f1             	mov    %esi,%r9d
   43d52:	f7 de                	neg    %esi
   43d54:	c7 45 98 20 00 00 00 	movl   $0x20,-0x68(%rbp)
        digits = lower_digits;
   43d5b:	48 8d 3d 7e 0f 00 00 	lea    0xf7e(%rip),%rdi        # 44ce0 <lower_digits.0>
   43d62:	e9 b1 02 00 00       	jmp    44018 <printer_vprintf+0x5cc>
            num = (uintptr_t) va_arg(val, void*);
   43d67:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43d6b:	8b 01                	mov    (%rcx),%eax
   43d6d:	83 f8 2f             	cmp    $0x2f,%eax
   43d70:	77 1c                	ja     43d8e <printer_vprintf+0x342>
   43d72:	89 c2                	mov    %eax,%edx
   43d74:	48 03 51 10          	add    0x10(%rcx),%rdx
   43d78:	83 c0 08             	add    $0x8,%eax
   43d7b:	89 01                	mov    %eax,(%rcx)
   43d7d:	4c 8b 02             	mov    (%rdx),%r8
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   43d80:	81 4d a0 21 01 00 00 	orl    $0x121,-0x60(%rbp)
            base = -16;
   43d87:	be f0 ff ff ff       	mov    $0xfffffff0,%esi
   43d8c:	eb c1                	jmp    43d4f <printer_vprintf+0x303>
            num = (uintptr_t) va_arg(val, void*);
   43d8e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43d92:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43d96:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43d9a:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43d9e:	eb dd                	jmp    43d7d <printer_vprintf+0x331>
            data = va_arg(val, char*);
   43da0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43da4:	8b 07                	mov    (%rdi),%eax
   43da6:	83 f8 2f             	cmp    $0x2f,%eax
   43da9:	0f 87 b0 01 00 00    	ja     43f5f <printer_vprintf+0x513>
   43daf:	89 c2                	mov    %eax,%edx
   43db1:	48 03 57 10          	add    0x10(%rdi),%rdx
   43db5:	83 c0 08             	add    $0x8,%eax
   43db8:	89 07                	mov    %eax,(%rdi)
   43dba:	4c 8b 22             	mov    (%rdx),%r12
        unsigned long num = 0;
   43dbd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
        if (flags & FLAG_NUMERIC) {
   43dc3:	8b 45 a0             	mov    -0x60(%rbp),%eax
   43dc6:	83 e0 20             	and    $0x20,%eax
   43dc9:	89 45 98             	mov    %eax,-0x68(%rbp)
   43dcc:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   43dd2:	0f 85 2e 02 00 00    	jne    44006 <printer_vprintf+0x5ba>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   43dd8:	8b 45 a0             	mov    -0x60(%rbp),%eax
   43ddb:	89 45 8c             	mov    %eax,-0x74(%rbp)
   43dde:	83 e0 60             	and    $0x60,%eax
   43de1:	83 f8 60             	cmp    $0x60,%eax
   43de4:	0f 84 63 02 00 00    	je     4404d <printer_vprintf+0x601>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43dea:	8b 45 a0             	mov    -0x60(%rbp),%eax
   43ded:	83 e0 21             	and    $0x21,%eax
        const char* prefix = "";
   43df0:	48 8d 1d 00 0e 00 00 	lea    0xe00(%rip),%rbx        # 44bf7 <complex_keymap+0x157>
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   43df7:	83 f8 21             	cmp    $0x21,%eax
   43dfa:	0f 84 8a 02 00 00    	je     4408a <printer_vprintf+0x63e>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   43e00:	8b 7d a8             	mov    -0x58(%rbp),%edi
   43e03:	89 f8                	mov    %edi,%eax
   43e05:	f7 d0                	not    %eax
   43e07:	c1 e8 1f             	shr    $0x1f,%eax
   43e0a:	89 45 88             	mov    %eax,-0x78(%rbp)
   43e0d:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
   43e11:	0f 85 b2 02 00 00    	jne    440c9 <printer_vprintf+0x67d>
   43e17:	84 c0                	test   %al,%al
   43e19:	0f 84 aa 02 00 00    	je     440c9 <printer_vprintf+0x67d>
            len = strnlen(data, precision);
   43e1f:	48 63 f7             	movslq %edi,%rsi
   43e22:	4c 89 e7             	mov    %r12,%rdi
   43e25:	e8 2f fb ff ff       	call   43959 <strnlen>
   43e2a:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && !(flags & FLAG_LEFTJUSTIFY)
   43e2d:	8b 45 8c             	mov    -0x74(%rbp),%eax
   43e30:	83 e0 26             	and    $0x26,%eax
            zeros = 0;
   43e33:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%rbp)
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ZERO)
   43e3a:	83 f8 22             	cmp    $0x22,%eax
   43e3d:	0f 84 be 02 00 00    	je     44101 <printer_vprintf+0x6b5>
        width -= len + zeros + strlen(prefix);
   43e43:	48 89 df             	mov    %rbx,%rdi
   43e46:	e8 ef fa ff ff       	call   4393a <strlen>
   43e4b:	8b 55 a8             	mov    -0x58(%rbp),%edx
   43e4e:	03 55 9c             	add    -0x64(%rbp),%edx
   43e51:	44 89 e9             	mov    %r13d,%ecx
   43e54:	29 d1                	sub    %edx,%ecx
   43e56:	29 c1                	sub    %eax,%ecx
   43e58:	89 4d 98             	mov    %ecx,-0x68(%rbp)
   43e5b:	41 89 cd             	mov    %ecx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43e5e:	f6 45 a0 04          	testb  $0x4,-0x60(%rbp)
   43e62:	75 37                	jne    43e9b <printer_vprintf+0x44f>
   43e64:	85 c9                	test   %ecx,%ecx
   43e66:	7e 33                	jle    43e9b <printer_vprintf+0x44f>
        width -= len + zeros + strlen(prefix);
   43e68:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
   43e6c:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            p->putc(p, ' ', color);
   43e6f:	89 da                	mov    %ebx,%edx
   43e71:	be 20 00 00 00       	mov    $0x20,%esi
   43e76:	4c 89 f7             	mov    %r14,%rdi
   43e79:	41 ff 16             	call   *(%r14)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   43e7c:	41 83 ed 01          	sub    $0x1,%r13d
   43e80:	45 85 ed             	test   %r13d,%r13d
   43e83:	7f ea                	jg     43e6f <printer_vprintf+0x423>
   43e85:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
   43e89:	8b 7d 98             	mov    -0x68(%rbp),%edi
   43e8c:	85 ff                	test   %edi,%edi
   43e8e:	b8 01 00 00 00       	mov    $0x1,%eax
   43e93:	0f 4f c7             	cmovg  %edi,%eax
   43e96:	29 c7                	sub    %eax,%edi
   43e98:	41 89 fd             	mov    %edi,%r13d
        for (; *prefix; ++prefix) {
   43e9b:	0f b6 03             	movzbl (%rbx),%eax
   43e9e:	84 c0                	test   %al,%al
   43ea0:	74 23                	je     43ec5 <printer_vprintf+0x479>
   43ea2:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
   43ea6:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            p->putc(p, *prefix, color);
   43eaa:	0f b6 f0             	movzbl %al,%esi
   43ead:	44 89 e2             	mov    %r12d,%edx
   43eb0:	4c 89 f7             	mov    %r14,%rdi
   43eb3:	41 ff 16             	call   *(%r14)
        for (; *prefix; ++prefix) {
   43eb6:	48 83 c3 01          	add    $0x1,%rbx
   43eba:	0f b6 03             	movzbl (%rbx),%eax
   43ebd:	84 c0                	test   %al,%al
   43ebf:	75 e9                	jne    43eaa <printer_vprintf+0x45e>
   43ec1:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; zeros > 0; --zeros) {
   43ec5:	8b 5d a8             	mov    -0x58(%rbp),%ebx
   43ec8:	85 db                	test   %ebx,%ebx
   43eca:	7e 1f                	jle    43eeb <printer_vprintf+0x49f>
   43ecc:	4c 89 65 a0          	mov    %r12,-0x60(%rbp)
   43ed0:	44 8b 65 ac          	mov    -0x54(%rbp),%r12d
            p->putc(p, '0', color);
   43ed4:	44 89 e2             	mov    %r12d,%edx
   43ed7:	be 30 00 00 00       	mov    $0x30,%esi
   43edc:	4c 89 f7             	mov    %r14,%rdi
   43edf:	41 ff 16             	call   *(%r14)
        for (; zeros > 0; --zeros) {
   43ee2:	83 eb 01             	sub    $0x1,%ebx
   43ee5:	75 ed                	jne    43ed4 <printer_vprintf+0x488>
   43ee7:	4c 8b 65 a0          	mov    -0x60(%rbp),%r12
        for (; len > 0; ++data, --len) {
   43eeb:	8b 45 9c             	mov    -0x64(%rbp),%eax
   43eee:	85 c0                	test   %eax,%eax
   43ef0:	7e 28                	jle    43f1a <printer_vprintf+0x4ce>
   43ef2:	89 c3                	mov    %eax,%ebx
   43ef4:	4c 01 e3             	add    %r12,%rbx
   43ef7:	44 89 6d a0          	mov    %r13d,-0x60(%rbp)
   43efb:	44 8b 6d ac          	mov    -0x54(%rbp),%r13d
            p->putc(p, *data, color);
   43eff:	41 0f b6 34 24       	movzbl (%r12),%esi
   43f04:	44 89 ea             	mov    %r13d,%edx
   43f07:	4c 89 f7             	mov    %r14,%rdi
   43f0a:	41 ff 16             	call   *(%r14)
        for (; len > 0; ++data, --len) {
   43f0d:	49 83 c4 01          	add    $0x1,%r12
   43f11:	49 39 dc             	cmp    %rbx,%r12
   43f14:	75 e9                	jne    43eff <printer_vprintf+0x4b3>
   43f16:	44 8b 6d a0          	mov    -0x60(%rbp),%r13d
        for (; width > 0; --width) {
   43f1a:	45 85 ed             	test   %r13d,%r13d
   43f1d:	7e 16                	jle    43f35 <printer_vprintf+0x4e9>
   43f1f:	8b 5d ac             	mov    -0x54(%rbp),%ebx
            p->putc(p, ' ', color);
   43f22:	89 da                	mov    %ebx,%edx
   43f24:	be 20 00 00 00       	mov    $0x20,%esi
   43f29:	4c 89 f7             	mov    %r14,%rdi
   43f2c:	41 ff 16             	call   *(%r14)
        for (; width > 0; --width) {
   43f2f:	41 83 ed 01          	sub    $0x1,%r13d
   43f33:	75 ed                	jne    43f22 <printer_vprintf+0x4d6>
    for (; *format; ++format) {
   43f35:	4d 8d 67 01          	lea    0x1(%r15),%r12
   43f39:	41 0f b6 47 01       	movzbl 0x1(%r15),%eax
   43f3e:	84 c0                	test   %al,%al
   43f40:	0f 84 33 fb ff ff    	je     43a79 <printer_vprintf+0x2d>
        if (*format != '%') {
   43f46:	3c 25                	cmp    $0x25,%al
   43f48:	0f 84 3a fb ff ff    	je     43a88 <printer_vprintf+0x3c>
            p->putc(p, *format, color);
   43f4e:	0f b6 f0             	movzbl %al,%esi
   43f51:	8b 55 ac             	mov    -0x54(%rbp),%edx
   43f54:	4c 89 f7             	mov    %r14,%rdi
   43f57:	41 ff 16             	call   *(%r14)
            continue;
   43f5a:	4d 89 e7             	mov    %r12,%r15
   43f5d:	eb d6                	jmp    43f35 <printer_vprintf+0x4e9>
            data = va_arg(val, char*);
   43f5f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f63:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43f67:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f6b:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43f6f:	e9 46 fe ff ff       	jmp    43dba <printer_vprintf+0x36e>
            color = va_arg(val, int);
   43f74:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43f78:	8b 01                	mov    (%rcx),%eax
   43f7a:	83 f8 2f             	cmp    $0x2f,%eax
   43f7d:	77 12                	ja     43f91 <printer_vprintf+0x545>
   43f7f:	89 c2                	mov    %eax,%edx
   43f81:	48 03 51 10          	add    0x10(%rcx),%rdx
   43f85:	83 c0 08             	add    $0x8,%eax
   43f88:	89 01                	mov    %eax,(%rcx)
   43f8a:	8b 02                	mov    (%rdx),%eax
   43f8c:	89 45 ac             	mov    %eax,-0x54(%rbp)
            goto done;
   43f8f:	eb a4                	jmp    43f35 <printer_vprintf+0x4e9>
            color = va_arg(val, int);
   43f91:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43f95:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   43f99:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43f9d:	48 89 47 08          	mov    %rax,0x8(%rdi)
   43fa1:	eb e7                	jmp    43f8a <printer_vprintf+0x53e>
            numbuf[0] = va_arg(val, int);
   43fa3:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   43fa7:	8b 07                	mov    (%rdi),%eax
   43fa9:	83 f8 2f             	cmp    $0x2f,%eax
   43fac:	77 23                	ja     43fd1 <printer_vprintf+0x585>
   43fae:	89 c2                	mov    %eax,%edx
   43fb0:	48 03 57 10          	add    0x10(%rdi),%rdx
   43fb4:	83 c0 08             	add    $0x8,%eax
   43fb7:	89 07                	mov    %eax,(%rdi)
   43fb9:	8b 02                	mov    (%rdx),%eax
   43fbb:	88 45 b8             	mov    %al,-0x48(%rbp)
            numbuf[1] = '\0';
   43fbe:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   43fc2:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43fc6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
            break;
   43fcc:	e9 f2 fd ff ff       	jmp    43dc3 <printer_vprintf+0x377>
            numbuf[0] = va_arg(val, int);
   43fd1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   43fd5:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   43fd9:	48 8d 42 08          	lea    0x8(%rdx),%rax
   43fdd:	48 89 41 08          	mov    %rax,0x8(%rcx)
   43fe1:	eb d6                	jmp    43fb9 <printer_vprintf+0x56d>
            numbuf[0] = (*format ? *format : '%');
   43fe3:	84 d2                	test   %dl,%dl
   43fe5:	0f 85 3e 01 00 00    	jne    44129 <printer_vprintf+0x6dd>
   43feb:	c6 45 b8 25          	movb   $0x25,-0x48(%rbp)
            numbuf[1] = '\0';
   43fef:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
                format--;
   43ff3:	49 83 ef 01          	sub    $0x1,%r15
            data = numbuf;
   43ff7:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   43ffb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   44001:	e9 bd fd ff ff       	jmp    43dc3 <printer_vprintf+0x377>
        if (flags & FLAG_NUMERIC) {
   44006:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
    const char* digits = upper_digits;
   4400c:	48 8d 3d ed 0c 00 00 	lea    0xced(%rip),%rdi        # 44d00 <upper_digits.1>
        if (flags & FLAG_NUMERIC) {
   44013:	be 0a 00 00 00       	mov    $0xa,%esi
    *--numbuf_end = '\0';
   44018:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
   4401c:	4c 89 c1             	mov    %r8,%rcx
   4401f:	4c 8d 65 cf          	lea    -0x31(%rbp),%r12
        *--numbuf_end = digits[val % base];
   44023:	48 63 f6             	movslq %esi,%rsi
   44026:	49 83 ec 01          	sub    $0x1,%r12
   4402a:	48 89 c8             	mov    %rcx,%rax
   4402d:	ba 00 00 00 00       	mov    $0x0,%edx
   44032:	48 f7 f6             	div    %rsi
   44035:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
   44039:	41 88 14 24          	mov    %dl,(%r12)
        val /= base;
   4403d:	48 89 ca             	mov    %rcx,%rdx
   44040:	48 89 c1             	mov    %rax,%rcx
    } while (val != 0);
   44043:	48 39 d6             	cmp    %rdx,%rsi
   44046:	76 de                	jbe    44026 <printer_vprintf+0x5da>
   44048:	e9 8b fd ff ff       	jmp    43dd8 <printer_vprintf+0x38c>
                prefix = "-";
   4404d:	48 8d 1d a0 0b 00 00 	lea    0xba0(%rip),%rbx        # 44bf4 <complex_keymap+0x154>
            if (flags & FLAG_NEGATIVE) {
   44054:	8b 45 a0             	mov    -0x60(%rbp),%eax
   44057:	a8 80                	test   $0x80,%al
   44059:	0f 85 a1 fd ff ff    	jne    43e00 <printer_vprintf+0x3b4>
                prefix = "+";
   4405f:	48 8d 1d 89 0b 00 00 	lea    0xb89(%rip),%rbx        # 44bef <complex_keymap+0x14f>
            } else if (flags & FLAG_PLUSPOSITIVE) {
   44066:	a8 10                	test   $0x10,%al
   44068:	0f 85 92 fd ff ff    	jne    43e00 <printer_vprintf+0x3b4>
                prefix = " ";
   4406e:	a8 08                	test   $0x8,%al
   44070:	48 8d 15 80 0b 00 00 	lea    0xb80(%rip),%rdx        # 44bf7 <complex_keymap+0x157>
   44077:	48 8d 05 78 0b 00 00 	lea    0xb78(%rip),%rax        # 44bf6 <complex_keymap+0x156>
   4407e:	48 0f 44 c2          	cmove  %rdx,%rax
   44082:	48 89 c3             	mov    %rax,%rbx
   44085:	e9 76 fd ff ff       	jmp    43e00 <printer_vprintf+0x3b4>
                   && (base == 16 || base == -16)
   4408a:	41 8d 41 10          	lea    0x10(%r9),%eax
   4408e:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   44093:	0f 85 67 fd ff ff    	jne    43e00 <printer_vprintf+0x3b4>
                   && (num || (flags & FLAG_ALT2))) {
   44099:	4d 85 c0             	test   %r8,%r8
   4409c:	75 0d                	jne    440ab <printer_vprintf+0x65f>
   4409e:	f7 45 a0 00 01 00 00 	testl  $0x100,-0x60(%rbp)
   440a5:	0f 84 55 fd ff ff    	je     43e00 <printer_vprintf+0x3b4>
            prefix = (base == -16 ? "0x" : "0X");
   440ab:	41 83 f9 f0          	cmp    $0xfffffff0,%r9d
   440af:	48 8d 15 42 0b 00 00 	lea    0xb42(%rip),%rdx        # 44bf8 <complex_keymap+0x158>
   440b6:	48 8d 05 34 0b 00 00 	lea    0xb34(%rip),%rax        # 44bf1 <complex_keymap+0x151>
   440bd:	48 0f 44 c2          	cmove  %rdx,%rax
   440c1:	48 89 c3             	mov    %rax,%rbx
   440c4:	e9 37 fd ff ff       	jmp    43e00 <printer_vprintf+0x3b4>
            len = strlen(data);
   440c9:	4c 89 e7             	mov    %r12,%rdi
   440cc:	e8 69 f8 ff ff       	call   4393a <strlen>
   440d1:	89 45 9c             	mov    %eax,-0x64(%rbp)
        if ((flags & FLAG_NUMERIC) && precision >= 0) {
   440d4:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
   440d8:	0f 84 4f fd ff ff    	je     43e2d <printer_vprintf+0x3e1>
   440de:	80 7d 88 00          	cmpb   $0x0,-0x78(%rbp)
   440e2:	0f 84 45 fd ff ff    	je     43e2d <printer_vprintf+0x3e1>
            zeros = precision > len ? precision - len : 0;
   440e8:	8b 4d a8             	mov    -0x58(%rbp),%ecx
   440eb:	89 ca                	mov    %ecx,%edx
   440ed:	29 c2                	sub    %eax,%edx
   440ef:	39 c1                	cmp    %eax,%ecx
   440f1:	b8 00 00 00 00       	mov    $0x0,%eax
   440f6:	0f 4f c2             	cmovg  %edx,%eax
   440f9:	89 45 a8             	mov    %eax,-0x58(%rbp)
   440fc:	e9 42 fd ff ff       	jmp    43e43 <printer_vprintf+0x3f7>
                   && len + (int) strlen(prefix) < width) {
   44101:	48 89 df             	mov    %rbx,%rdi
   44104:	e8 31 f8 ff ff       	call   4393a <strlen>
   44109:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   4410c:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - len - strlen(prefix);
   4410f:	44 89 e9             	mov    %r13d,%ecx
   44112:	29 f9                	sub    %edi,%ecx
   44114:	29 c1                	sub    %eax,%ecx
   44116:	44 39 ea             	cmp    %r13d,%edx
   44119:	b8 00 00 00 00       	mov    $0x0,%eax
   4411e:	0f 4c c1             	cmovl  %ecx,%eax
   44121:	89 45 a8             	mov    %eax,-0x58(%rbp)
   44124:	e9 1a fd ff ff       	jmp    43e43 <printer_vprintf+0x3f7>
            numbuf[0] = (*format ? *format : '%');
   44129:	88 55 b8             	mov    %dl,-0x48(%rbp)
            numbuf[1] = '\0';
   4412c:	c6 45 b9 00          	movb   $0x0,-0x47(%rbp)
            data = numbuf;
   44130:	4c 8d 65 b8          	lea    -0x48(%rbp),%r12
        unsigned long num = 0;
   44134:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   4413a:	e9 84 fc ff ff       	jmp    43dc3 <printer_vprintf+0x377>
        int flags = 0;
   4413f:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
   44146:	e9 8d f9 ff ff       	jmp    43ad8 <printer_vprintf+0x8c>

000000000004414b <console_vprintf>:
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   4414b:	f3 0f 1e fa          	endbr64 
   4414f:	55                   	push   %rbp
   44150:	48 89 e5             	mov    %rsp,%rbp
   44153:	53                   	push   %rbx
   44154:	48 83 ec 18          	sub    $0x18,%rsp
    cp.p.putc = console_putc;
   44158:	48 8d 05 9e f6 ff ff 	lea    -0x962(%rip),%rax        # 437fd <console_putc>
   4415f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        cpos = 0;
   44163:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
   44169:	b8 00 00 00 00       	mov    $0x0,%eax
   4416e:	0f 43 f8             	cmovae %eax,%edi
    cp.cursor = console + cpos;
   44171:	48 63 ff             	movslq %edi,%rdi
   44174:	48 8d 1d 85 3e 07 00 	lea    0x73e85(%rip),%rbx        # b8000 <console>
   4417b:	48 8d 04 7b          	lea    (%rbx,%rdi,2),%rax
   4417f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    printer_vprintf(&cp.p, color, format, val);
   44183:	48 8d 7d e0          	lea    -0x20(%rbp),%rdi
   44187:	e8 c0 f8 ff ff       	call   43a4c <printer_vprintf>
    return cp.cursor - console;
   4418c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   44190:	48 29 d8             	sub    %rbx,%rax
   44193:	48 d1 f8             	sar    %rax
}
   44196:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4419a:	c9                   	leave  
   4419b:	c3                   	ret    

000000000004419c <console_printf>:
int console_printf(int cpos, int color, const char* format, ...) {
   4419c:	f3 0f 1e fa          	endbr64 
   441a0:	55                   	push   %rbp
   441a1:	48 89 e5             	mov    %rsp,%rbp
   441a4:	48 83 ec 50          	sub    $0x50,%rsp
   441a8:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   441ac:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   441b0:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   441b4:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   441bb:	48 8d 45 10          	lea    0x10(%rbp),%rax
   441bf:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   441c3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   441c7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   441cb:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   441cf:	e8 77 ff ff ff       	call   4414b <console_vprintf>
}
   441d4:	c9                   	leave  
   441d5:	c3                   	ret    

00000000000441d6 <vsnprintf>:

int vsnprintf(char* s, size_t size, const char* format, va_list val) {
   441d6:	f3 0f 1e fa          	endbr64 
   441da:	55                   	push   %rbp
   441db:	48 89 e5             	mov    %rsp,%rbp
   441de:	53                   	push   %rbx
   441df:	48 83 ec 28          	sub    $0x28,%rsp
   441e3:	48 89 fb             	mov    %rdi,%rbx
    string_printer sp;
    sp.p.putc = string_putc;
   441e6:	48 8d 05 a3 f6 ff ff 	lea    -0x95d(%rip),%rax        # 43890 <string_putc>
   441ed:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    sp.s = s;
   441f1:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
    if (size) {
   441f5:	48 85 f6             	test   %rsi,%rsi
   441f8:	75 0b                	jne    44205 <vsnprintf+0x2f>
        sp.end = s + size - 1;
        printer_vprintf(&sp.p, 0, format, val);
        *sp.s = 0;
    }
    return sp.s - s;
   441fa:	8b 45 e0             	mov    -0x20(%rbp),%eax
   441fd:	29 d8                	sub    %ebx,%eax
}
   441ff:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   44203:	c9                   	leave  
   44204:	c3                   	ret    
        sp.end = s + size - 1;
   44205:	48 8d 44 37 ff       	lea    -0x1(%rdi,%rsi,1),%rax
   4420a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        printer_vprintf(&sp.p, 0, format, val);
   4420e:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   44212:	be 00 00 00 00       	mov    $0x0,%esi
   44217:	e8 30 f8 ff ff       	call   43a4c <printer_vprintf>
        *sp.s = 0;
   4421c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
   44220:	c6 00 00             	movb   $0x0,(%rax)
   44223:	eb d5                	jmp    441fa <vsnprintf+0x24>

0000000000044225 <snprintf>:

int snprintf(char* s, size_t size, const char* format, ...) {
   44225:	f3 0f 1e fa          	endbr64 
   44229:	55                   	push   %rbp
   4422a:	48 89 e5             	mov    %rsp,%rbp
   4422d:	48 83 ec 50          	sub    $0x50,%rsp
   44231:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   44235:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44239:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   4423d:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   44244:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44248:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4424c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   44250:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
   44254:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   44258:	e8 79 ff ff ff       	call   441d6 <vsnprintf>
    va_end(val);
    return n;
}
   4425d:	c9                   	leave  
   4425e:	c3                   	ret    

000000000004425f <console_clear>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear(void) {
   4425f:	f3 0f 1e fa          	endbr64 
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   44263:	48 8d 05 96 3d 07 00 	lea    0x73d96(%rip),%rax        # b8000 <console>
   4426a:	48 8d 90 a0 0f 00 00 	lea    0xfa0(%rax),%rdx
        console[i] = ' ' | 0x0700;
   44271:	66 c7 00 20 07       	movw   $0x720,(%rax)
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   44276:	48 83 c0 02          	add    $0x2,%rax
   4427a:	48 39 d0             	cmp    %rdx,%rax
   4427d:	75 f2                	jne    44271 <console_clear+0x12>
    }
    cursorpos = 0;
   4427f:	c7 05 73 4d 07 00 00 	movl   $0x0,0x74d73(%rip)        # b8ffc <cursorpos>
   44286:	00 00 00 
}
   44289:	c3                   	ret    
