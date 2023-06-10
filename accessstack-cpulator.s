.global _start
_start:
	LDR  R0, =list // Load Data into Register - get address of list
	LDR R1, [R0]   // Load Data into Register - getvalue stored in address stored in R0

.data
list:
	.word -5, -2 , 0, 3, 7