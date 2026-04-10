# Sequential Logic Circuits

Sequential logic circuits have **STATE** and **MEMORY**

The output of a sequential logic circuit depends on the current input and all of
the past inputs.

## State

- **State**: A collection of state variables whose values at any one time point
contain all of the information about the past that is necessary to determine the
future behavior.

In digital logic circuits, state variables are binary values corresponding to
certain logic signals.

## Signal Based Circuits

We will be using the CLOCK signals in this class. We will change some state
whenever the clock ticks up or ticks down.j

Clock terms:

- $T_h$: the time interval that the clock signal is HIGH
- $T_l$: the time interval that the clock signal is LOW
- Period $T_per$: the total cycle time of a clock.
- Clock activity level:
  - An active high clock triggers when it changes from LOW to HIGH
  - An active low clock triggers when it changes from HIGH to LOW

## Bistable Elements

If you have two NOT gates, and you feed the output of one into the input of the
other for both gates, creating a loop, then you create a stable state.

## Latches

- **Latch**: (Level-triggered circuits) watches its inputs and can change its
output at any time.
- **Flip-Flop**: Changes the output at the clock tick


