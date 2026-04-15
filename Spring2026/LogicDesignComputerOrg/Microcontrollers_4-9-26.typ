#import "@local/xnotes:1.0.2": *
#show: doc => xnote(doc)

#title[Microcontrollers]

= What are Microcontrollers?

#definition[A *microcontroller* is a one chip computer designed to control
  other equipment.] e.g. Appliances, Clocks, Cars, etc.

#definition[An *Assembly Language* specifies the exact instructions that
  the CPU will follow.]

The Assembly Language can be different for each kind of microcontroller,
you must consult the manual on the microcontroller. Like the _PIC16F84A_

== Additional Notes about Microcontrollers
- Config matters, it is used to embed data within the `.asm` file
  - Watchdog Timer should be off
- RESET_VECTOR is the entry point of the program; CODE 0x0000
  - In our case it will just have `goto start`
- MAIN_PROGRAM is where we write our code
  - Starts with `start` label

= _PIC16F84A_

For _PIC16F84A_, each instruction will take 4 clock periods (The oscillation
frequency is different than every clock tick). e.g. if $f=4"MHz" => T =
1/f, T = 1/(4 dot 10^6) "sec"$

One instruction cycle: $4T = 1/10^6 = 10^-6 "sec"$. One instruction cycle
for a frequency of 4 MHz is 1 $mu$sec.

One instruction frequency = $1/(4T)=f/4$

So if clock frequency is 100 kHz, then the instruction cycle is 25 kHz

#example[Turn on an LED connected to RB0 (Pin 0 of PORTB): \_\_\_\_\_\_\_0]

```asm
; Main Program
; Step 1, Configure the Port
  ; We need to configure RB0 (pin 0 of PORTB) as an output pin.

  ; TRISB is the direction register of PORTB, specifying input vs. output
  ; This means that TRISB = x x x x x x x 0
  ; For TRIS direction bits, 0 means output, 1 means input

  ; We need to write 0xFE to TRISB (keep all other bits as input)
  ; We need to set the bank to 1 because TRISB is on bank 1

  ; Remember: Instructions lowercase, registers uppercase

  bsf     STATUS, RP0; RP0 is bank select bit, (bsf sets to 1, bcf clrs to 0)
  movlw   0xFE; Set
  movwf   TRISB;

; Step 2, write a logic 1 to bit 0 of PORTB

  bcf     STATUS, RP0; now we clear RP0 to go to bank 0
  bsf     PORTB, RB0;

finish: ; This is a label for `goto` purposes. It makes an infinite loop
  goto finish
end
```

#example[Chaser light sequence. We have 8 LEDs conected to PORTB. We will
  light one of them at a time.]

```asm
  bsf     STATUS, RP0;
  movlw   0x00;
  movwf   TRISB;

  bcf     STATUS, RP0;
  movlw   0x01;
  movwf   PORTB;

loop:
  rlf     PORTB;
  goto    loop;
end
```
