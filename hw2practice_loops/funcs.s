	.global _Z5counti
_Z5counti:
	mov r2, #0
.loop:
	add r2, r2, #1
	cmp r2, r0
	bne .loop
	bx lr

	.globl _Z9countDowni
_Z9countDowni:
	mov r2, r0
.loop1:
	sub r2, r2, #1
	cmp r2, #0
	bne .loop1
	bx lr

	.globl _Z3sumii
_Z3sumii:
	mov r2, #0
.loop2:
	add r2, r2, r0
	add r0, r0, #1
	cmp r0, r1
	ble .loop2
	mov r0, r2
	bx lr

	.globl _Z4facti
_Z4facti:
	mov r2, #1
.loop3:
	mul r2, r2, r0
	sub r0, r0, #1
	cmp r0, #0
	bgt .loop3
	mov r0, r2
	bx lr
