.global _start
.align 2

_start:
    MOV X0, #30

    MOV X16, #1  // 1	AUE_EXIT	ALL	{ void exit(int rval); } 

    SVC 0