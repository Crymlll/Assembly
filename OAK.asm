
;====================================================================
; DEFINITIONS
;====================================================================

.include "m8515def.inc"
.def temp = r16 ; temporary register
.def EW = r23 ; for PORTA
.def PB = r24 ; for PORTB
.def A = r25

;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

.org $00

;====================================================================
; CODE SEGMENT
;====================================================================

MAIN:


INIT_STACK:
	ldi temp, low(RAMEND)
	ldi temp, high(RAMEND)
	out SPH, temp

INIT_LCD_MAIN:
	rcall INIT_LCD

	ser temp;ldi temp, 0xFF
	out DDRA,temp ; Set port A as output
	out DDRB,temp ; Set port B as output

	;input text
	rjmp INPUT_TEXT


INIT_LCD:
	cbi PORTA,1 ; CLR RS
	ldi PB,0x38 ; MOV DATA,0x38 --> 8bit, 2line, 5x7
	out PORTB,PB
	sbi PORTA,0 ; SETB EN
	cbi PORTA,0 ; CLR EN

	cbi PORTA,1 ; CLR RS
	ldi PB,$0E ; MOV DATA,0x0E --> disp ON, cursor ON, blink OFF
	out PORTB,PB
	sbi PORTA,0 ; SETB EN
	cbi PORTA,0 ; CLR EN

	rcall CLEAR_LCD ; CLEAR LCD
	cbi PORTA,1 ; CLR RS
	ldi PB,$06 ; MOV DATA,0x06 --> increase cursor, display sroll OFF
	out PORTB,PB
	sbi PORTA,0 ; SETB EN
	cbi PORTA,0 ; CLR EN

	ret

CLEAR_LCD:
	cbi PORTA,1 ; CLR RS
	ldi PB,$01 ; MOV DATA,0x01
	out PORTB,PB
	sbi PORTA,0 ; SETB EN
	cbi PORTA,0 ; CLR EN
	ret

INPUT_TEXT:
	ldi A, 0x48; SET character to write
	sbi PORTA,1 ; SETB RS
	out PORTB, A
	sbi PORTA,0 ; SETB EN
	cbi PORTA,0 ; CLR EN

	ldi A, 0x65; SET character to write
	sbi PORTA,0 ; SETB RS
	out PORTB, A
	sbi PORTA,1 ; SETB EN
	cbi PORTA,0 ; CLR EN
EXIT:
	rjmp EXIT