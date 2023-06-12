
// Gives 
//zsh: bus error  ./accessstack
// see goodmorning.s for a better way
.global _start
.align 2

_start:
	LDR X0, =list // Load Data into Register - get address of list
	LDR X1, [X0]   // Load Data into Register - getvalue stored in address stored in R0
    SVC 0
    
    MOV X0, #0      // return 0
    MOV X16, #1     // 1	AUE_EXIT	ALL	{ void exit(int rval); }
    SVC 0           // sys call to number in X16 - Exit
.data
list:
	.word -5, -2 , 0, 3, 7