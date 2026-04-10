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

= Additional Notes for _PIC16F84A_

- Config matters, it is used to embed data within the `.asm` file
  - Watchdog Timer should be off
- RESET_VECTOR is the entry point of the program; CODE 0x0000
  - In our case it will just have `goto start`
- MAIN_PROGRAM is where we write our code
  - Starts with `start` label

