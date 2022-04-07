	.global _Z12eratosthenesPjjj
_Z12eratosthenesPjjj:

	push {r4-r11}
	mov r10, #0

	@ sieve = r0
	@ max number = r1
	@ r0 = sieve array
	@ r1 = n
	@ r2 = sqrt(n)
	@ r3 = bytes offset
	@ r4 = (n+31)/(32/2) * 4 bytes
	@ r5 = 0xFFFFFFFF

	@ Set all of A to true
	mov r3, #0
	mov r4, r1
	add r4, #31
	lsr r4, #4
	lsl r4, #2
	ldr r5, =#0xFFFFFFFF
	b _setall_check
_setall:
	str r5, [r0, r3]
	add r3, #4
_setall_check:
	cmp r3, r4
	blt _setall



	@ r0 = sieve array
	@ r1 = n
	@ r2 = sqrt(n)
	@ r3 = UNUSED
	@ r4 = i
	@ r5 = j
	@ r6 = i/2 / 32 ( or j/2 / 32 )
	@ r7 = i/2 & 0x1F ( or j/2 & 0x1F )
	@ r8 = r0[i/2/32]
	@ r9 = 1 << r7, then r9 = bit
	@ r10 = count
	@ r11 = 1
	@ Note: j = i/2^2 + 2x*i

	mov r4, #3
	b _outer_check
_outer:
	@ arr[i/2/32] &3(1 << i/2 % 32)
	mov r6, r4, LSR #1
	lsr r6, #5			@ i/2 / 32
	lsl r6, #2
	mov r7, r4, LSR #1
	and r7, r7, #0x1F	@ i/2 % 32
	ldr r8, [r0, r6]	@ r8 = r0[i/2/32]
	lsr r8, r7
	and r8, #1
	mov r9, r8

	cmp r9, #1
	addne r4, #2		@ i += 2 
	bne _outer_check

	mul r5, r4, r4	@ j=i*i
	b _inner_check
_inner:
	@ arr[i/32] &= ~(1<<i%32)
	mov r6, r5, LSR #1
	lsr r6, r6, #5		@ j/2/32
	lsl r6, #2
	mov r7, r5, LSR #1
	and r7, r7, #0x1F	@ j/2%32
	ldr r8, [r0, r6]	@ r8=r0[j/2/32]
	mov r11, #1			@r6=1
	lsl r9, r11, r7		@r9=1<<(j/2&0x1F)
	mvn r9, r9			@r9=~r9
	and r9, r8, r9		@ r9=r8&~(1<<j/2&0x1F)
	str r9, [r0, r6]	@ [r0+j/2/32]=r9
	
	mov r6, r4, LSL #1
	add r5, r6
_inner_check:
	cmp r5, r1
	ble _inner
	add r4, #2
_outer_check:
	cmp r4, r2
	ble _outer

	@ Same logic as outer loop for
	@ accessing array elements and bits
	mov r3, #0			@ i
_countprimes:
	@ arr[i/32] & (1 << i % 32)
	mov r4, r3, LSR #1
	lsr r4, r4, #5
	lsl r4, #2
	mov r5, r3, LSR #1
	and r5, r5, #0x1F
	ldr r6, [r0, r4]
	lsr r6, r5
	and r6, #1
	cmp r6, #1
	addeq r10, #1
	add r3, #2
	cmp r3, r1
	blt _countprimes

	mov r0, r10
	pop {r4-r11}
	bx lr
