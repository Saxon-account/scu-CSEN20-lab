        .syntax     unified
        .cpu        cortex-m4
        .text

// uint64_t TireDiam(uint32_t W, uint32_t A, uint32_t R) ;

        .global     TireDiam
        .thumb_func

        .align
TireDiam:       // R0 = W, R1 = A, R2 = R
	PUSH	{R4}
	LDR	R3,=1270 //divisor
	MUL	R0,R1,R0
	MOV	R4,R0
	UDIV	R0,R0,R3
	ADD	R1,R2,R0
	MLS	R0,R0,R3,R4 //rem = dividend - (quotient*divisor)
	POP	{R4}
        BX          LR

// uint64_t TireCirc(uint32_t W, uint32_t A, uint32_t R) ;

        .global     TireCirc
        .thumb_func

        .align
TireCirc:       // R0 = W, R1 = A, R2 = R
	PUSH	{LR,R4}
	BL TireDiam //R1 = hi, R0 = lo
	LDR	R3,=1587500 //divisor
	LDR	R2,=4987290
	MUL	R1,R1,R2
	LDR	R2,= 3927
	MUL	R0,R0,R2
	ADD	R4,R1,R0 //stores dividend
	UDIV	R1,R4,R3
	MLS	R0,R1,R3,R4 //rem = dividend - (quotient*divisor)
	POP	{PC,R4}
        .end

