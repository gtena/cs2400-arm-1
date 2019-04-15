		;		ARM Programming Assignment #1: 32 bit multiplier
		;
		;		Write a 32-bit multiplier.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
number1	DCD		0xA0BCFF0D
number2	DCD		0xFFF0ADEA
result	FILL		8
carry	FILL		4
		
main
		ADR		r0, result				;get address of result
		MOV		r0, #0					;r0 is the product result
		ADR		r2, number1			;get address of number 1
		MOV		r2, #0xA0BCFF0D	;r2 is multiplier...need to rotate bits
		ADR		r3, number2			;get address of number 2
		MOV		r3, #0xFFF0ADEA	;r3 is multiplicand...need to rotate bits
		LSRS		r2, r2, #1				;shift bits left by 1
		
loop
		ADDCS	r0, r0, r3				;add r0 & r3 if carry is set
		LSL		r3, r3,#1				;shift multiplicand by 1
		LSRS		r2, r2, #1				;shift multiplier by 1 into carry
		BNE		loop						;if zero, done
		END
		
		
		
		
		;TST		R0, #(1<<7)            ; is b7 set?
