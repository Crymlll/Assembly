.include "m8515def.inc"
.org 0x00
MAIN:
ldi r16,0x05
ldi r17,0x03
add r16,r17
selesai : rjmp selesai