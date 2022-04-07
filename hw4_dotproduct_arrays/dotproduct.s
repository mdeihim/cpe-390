  .global _Z10dotproductPdS_
_Z10dotproductPdS_:

  VPUSH {d1, d2, d3}
  
  VLDR d2, [r0]
  VLDR d3, [r1]
  VMUL.f64 d0, d2, d3
  
  VLDR d2, [r0, #8]
  VLDR d3, [r1, #8]
  VMUL.f64 d1, d2, d3
  VADD.f64 d0, d0, d1
  
  VLDR d2, [r0, #16]
  VLDR d3, [r1, #16]
  VMUL.f64 d1, d2, d3
  VADD.f64 d0, d0, d1
  
  VPOP {d1, d2, d3}
  BX LR
