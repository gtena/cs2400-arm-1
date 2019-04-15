		;		ARM Programming Assignment #1: Capitalizer
		;
		;		Write a program that goes through the characters in chars,
		;		and Capitalizes every lower-case letter that it finds..
		;		Write the number of capitalizations the program performed
		;		In the caps "fill" memory provided.
		
		;		Your code here
		
chars		DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
size		DCD		44
caps		FILL		4
		
main
		ADR		r0, chars	   ; get the address of chars and load into r0
loop
		LDR		r2, [r0]		   ; load contents of r0 into r2
		MOV		r3, #123	        ;moving ascii into register
		CMP		r2, r3			   ;compare r2 value to r3 value
		BLT		capital		   ;branch if less than
back
		MOV		r3, #4		    ;load byte size into r3
		ADD		r0, r0, r3        ;increment 4 bytes to next character
		ADD		r1, r1, r3	    ;add 4 to loop counter
		ADR		r7, size		    ;address of size into r7
		LDR		r8, [r7]		    ;load contents of r7 into r8
		CMP		r1, r8			    ;compare r8 to r0
		BLT		loop
		END
		
capital
		MOV		r3, #97		  ;check to see if in ascii range
		CMP		r2, r3			  ;compare r2 to ascii value
		BLT		back		       ;branch if less than
		MOV		r4, #32		  ;if in range move 32 into register for capital
		SUB		r2, r2, r4		  ;subtract r4 from r2, load back into r2
		STR		r2, [r0]            ;store caps into r0
		MOV		r3, #1		  ;move 1 into r3
		ADR		r5, caps		  ;address of caps into r5
		LDR		r6, [r5]	       ;load value of r5 into r6
		ADD		r3, r3, r6	       ;add r3 and r6, back into r3
		STR		r3, [r5]		  ;store updated value of r3 into r5
		B		back				  ;branch to back to increment to 
next character
