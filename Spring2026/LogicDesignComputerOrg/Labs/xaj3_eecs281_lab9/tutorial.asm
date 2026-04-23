; tutorial.asm - PIC16F84A LED Counter
; Name: Xander Jhaveri

	list      p=16F84A            ; list directive to define processor
	#include <p16F84A.inc>        ; processor specific variable definitions

	__CONFIG   _CP_OFF & _WDT_OFF & _PWRTE_ON & _RC_OSC

; '__CONFIG' directive is used to embed configuration data within .asm file.
; The lables following the directive are located in the respective .inc file.
; See respective data sheet for additional information on configuration word.

;***** VARIABLE DEFINITIONS
w_temp        EQU     0x0C        ; variable used for context saving
status_temp   EQU     0x0D        ; variable used for context saving
COUNT         EQU     0x0E
DVAR          EQU     0x0F
DVAR2         EQU     0x10

;**********************************************************************
		ORG     0x000             ; processor reset vector
  		goto    Main              ; go to beginning of program


		ORG     0x004             ; interrupt vector location
		movwf   w_temp            ; save off current W register contents
		movf	STATUS,w          ; move status register into W register
		movwf	status_temp       ; save off contents of STATUS register


; isr code can go here or be located as a call subroutine elsewhere


		movf    status_temp,w     ; retrieve copy of STATUS register
		movwf	STATUS            ; restore pre-isr STATUS register contents
		swapf   w_temp,f
		swapf   w_temp,w          ; restore pre-isr W register contents
		retfie                    ; return from interrupt


; program code goes here
Main
    clrw
    movwf PORTB     ; clear PORTB
    bsf STATUS, RP0 ; switch to register bank 1
    movwf TRISB     ; configure PORTB as all outputs
    bcf STATUS, RP0 ; switch to register bank 0

Init
    clrf COUNT
IncCount
    incf COUNT
    movf COUNT,W
    movwf PORTB; display COUNT on PORTB

    call Delay
    goto IncCount; infinite loop

Delay
    movlw 0x40; set outer delay loop
    movwf DVAR2
Delay0
    movlw 0xFF
    movwf DVAR; set inner delay loop
Delay1
    decfsz DVAR
    goto Delay1

    decfsz DVAR2
    goto Delay0
    return

END ; directive 'end of program'
