.include "m8515def.inc"
.org 0x0004
rjmp main
main: ldi r16,low(RAMEND)
out SPL,r16
ldi r16,high(RAMEND)
out SPH,r16

ldi r16,0xff
out ddra,r16
out PortA,r16
cbi PortA,0
cbi PortA,1
stop: rjmp stop