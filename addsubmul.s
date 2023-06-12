.global _start
.align 2

_start:
    MOV X0, #3
    MOV X1, #7

    ADD X2, X0, X1
    SUB X2, X0, X1
    MUL X2, X0, X1

    MOV X16, #1  // 1	AUE_EXIT	ALL	{ void exit(int rval); } 

    SVC 0