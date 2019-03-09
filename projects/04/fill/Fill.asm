// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


// SCREEN
// Mapped to RAM starting at address 16384(3) (0x4000), 
// which is refered to using the label SCREEN
// 256 rows, 512 pixels per row
// Each row is represented by 32 consecutive 16-bit words
// End address: 16384 + 256 * 32 = 16384 + 8192 = 24576 (5?)

// KEYBOARD
// The ASCII code of the key which has been pressed appears at address 24576

// START LOOP 1
(LOOP1)

// Store current address for screen
@SCREEN
D=A
@CURR
M=D

// Store last address for screen + 1
@24576
D=A
@END
M=D

@KBD
D=M

// If no key is pressed, don't fill
@SETNOFILL
D; JEQ

// If a key is pressed, fill
@SETFILL
0; JMP

// Set colour to 0 (no fill)
(SETNOFILL)
@COLOUR
M=0
// Start writing to addresses
@LOOP2
0;JMP

// Set colour to -1 (fill)
(SETFILL)
@COLOUR
M=-1
// Start writing to addresses
@LOOP2
0;JMP


// START LOOP 2
(LOOP2)

// Fill with appropriate color
@COLOUR
D=M

// These 3 lines are to use an address saved in memory
@CURR
A=M
M=D

@CURR
MD=M+1

// last value - current value
@END
D=M-D

// END LOOP 2
@LOOP2
D;JGT

// END LOOP 1
@LOOP1
0;JMP
