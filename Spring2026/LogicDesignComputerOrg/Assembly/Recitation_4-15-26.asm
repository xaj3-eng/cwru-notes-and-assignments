; PIC16F84A LED Blinking Example
; Frequency: 4MHz (XT Oscillator)

LIST P=16F84A
#include <p16f84a.inc>

    ; Configuration: XT Oscillator, Watchdog Timer OFF, Power-up Timer ON
    __CONFIG _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF

; --- Variable Definitions ---
COUNT1 EQU 0x0C       ; Memory address for delay counter 1
COUNT2 EQU 0x0D       ; Memory address for delay counter 2

; --- Reset Vector ---
    ORG 0x00          ; Start of code
    GOTO START

START:
    BSF STATUS, RP0   ; Switch to Bank 1
    MOVLW B'00000000' ; Set all Port B pins as outputs
    MOVWF TRISB       ; Load value into TRISB register
    BCF STATUS, RP0   ; Switch back to Bank 0

LOOP:
    BSF PORTB, 0      ; Turn ON LED at RB0
    CALL DELAY        ; Wait
    BCF PORTB, 0      ; Turn OFF LED at RB0
    CALL DELAY        ; Wait
    GOTO LOOP         ; Repeat forever

; --- Delay Subroutine (approx. 0.5s at 4MHz) ---
DELAY:
    MOVLW D'255'
    MOVWF COUNT1
OUTER:
    MOVLW D'255'
    MOVWF COUNT2
INNER:
    DECFSZ COUNT2, F  ; Decrement COUNT2, skip next if zero
    GOTO INNER
    DECFSZ COUNT1, F  ; Decrement COUNT1
    GOTO OUTER
    RETURN

    END               ; Required at the end of every .asm file
