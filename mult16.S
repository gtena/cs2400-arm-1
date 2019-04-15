		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
number1	DCD		0b1100101010010001
number2	DCD		0b1111010101000011
result	FILL		4
carry	FILL		4
		
		
main
		ADR		r0, result				;get address of result
		MOV		r0, #0					;to store product
		ADR		r1, number1			;get address of number1
		LDR		r2, [r1]					;move multiplier into r2
		ADR		r3, number2			;get address of number2
		LDR		r4, [r3]					;move multiplicand into r4
		LSRS		r4, r4, #1				;shift  bits left by 1
loop
		ADDCS	r0, r0, r3				;add r0 and r3 if carry set
		LSL		r4, r4, #1				;shift multiplicand left by 1 bit
		LSRS		r2, r2, #1				;shift multiplier right by 1 bit
		BNE		loop
		END
		
		
