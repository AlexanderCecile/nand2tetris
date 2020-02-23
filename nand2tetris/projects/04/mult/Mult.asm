// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Set product to 0
@R2
M=0

@R0
D=M
@R1
D=D-M

// Go to loop 1 if R0 - R1 <= 0
@LOOP1
D;JLE

// Go to loop 2 if R0 - R1 >= 0
@LOOP2
0;JMP


// START OF LOOP 1
// Used if R0 < R1
(LOOP1)

// If first factor is 0, then end
@R0
D=M
@END
D;JEQ

// If second factor is 0, then end
@R1
D=M
@END
D;JEQ

// Add second factor to result
@R2
M=M+D

// Subtract 1 from first factor
@R0
M=M-1

// Loop unconditonally
@LOOP1
0;JMP

// START LOOP 2
// Used if R0 > R1
(LOOP2)

// If second factor is 0, then end
@R1
D=M
@END
D;JEQ

// If first factor is 0, then end
@R0
D=M
@END
D;JEQ

// Add first factor to result
@R2
M=M+D

// Subtract 1 from first factor
@R1
M=M-1

@LOOP2
0;JMP

// Infinite end loop
// Apparently the way to stop program execution
(END)
@END
0;JMP