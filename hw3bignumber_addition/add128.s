  .global _Z6add128R6BigNumRKS_S2_
_Z6add128R6BigNumRKS_S2_:
PUSH {r3, r4, r5}

ldr r0, [r0]
ldr r1, [r1]
ldr r2, [r2]

ldr r3, [r1, #12]
ldr r4, [r2, #12]
adds r5, r3, r4
str r5, [r0, #12]

ldr r3, [r1, 0]
ldr r4, [r2, #0]
adcs r5, r3, r4
str r5, [r0, #0]

ldr r3, [r1, #4]
ldr r4, [r2, #4]
adcs r5, r3, r4
str r5, [r0, #4]

ldr r3, [r1, #0]
ldr r4, [r2, #0]
adcs r5, r3, r4
str r5, [r0, #0]

POP {r3, r4, r5}
bx lr
