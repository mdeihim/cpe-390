   .global _Z5powerjj
  
_Z5powerjj:
  push {R2, R3}
  mov R2, #1
  b .cmp
.loop:
  and R3, R1, #1
  cmp R3, #1
  bne .next
  mul R2, R2, R0
.next:
  mul R0, R0, R0
  lsr R1, R1, #1
.cmp:
  cmp R1, #0
  bgt .loop
  
  mov R0, R2
  pop {R2, R3}
  bx lr
        
