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

@COLOR
M=-1

// Store current value
@16384
D=A
@CURR
M=D

// Store last value
@24576
D=A
@END
M=D

// Start loop
(LOOP)

// Fill with appropriate color
@COLOR
D=M
@CURR // These 3 lines are to use an address saved in memory
A=M
M=D

@CURR
MD=M+1

// last value - current value
@END
D=M-D

// Return to start of loop
@LOOP
D;JGT

// Infinite end loop
(END)
@END
0;JEQ
