.global _main
.align 2

_main:
    // b _reboot       // Reboot machine : runa as sudo ./hello 
    b _printf
    b _terminate    //branch to terminate label

_printf:
    mov X0, #1              // stdout
    adr X1, helloworld      // address of hello world string
    mov X2, 12              // Number of bytes in hello world
    mov X16, #4             // write to stdout  4	AUE_NULL	ALL	{ user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte); } 
    svc 0                   // sys call

_reboot:
    mov X0, #1      // Instant reboot
    mov X16, #55    // reboot
    svc 0

_terminate:
    mov X0, #0      // return 0
    mov X16, #1     // 1	AUE_EXIT	ALL	{ void exit(int rval); }
    svc 0           // sys call to number in X16

helloworld: .ascii "hello world\n"