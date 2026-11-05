        .syntax     unified
        .cpu        cortex-m4
        .text

// void Hanoi(int num, int fm, int to, int aux) ;

        .global     Hanoi
        .thumb_func
        .align

Hanoi:  
	PUSH	{R4-R8,LR}
	MOV	R4,R0
	MOV	R5,R1
	MOV	R6,R2
	MOV	R7,R3
	CMP	R0,#1
        BLE         Hanoi1
 	SUB	R0,#1
	MOV	R2,R7
	MOV	R3,R6
        BL          Hanoi        // Yes --> Hanoi(num - 1, fm, aux, to)

Hanoi1:
	MOV	R0,R5
	MOV	R1,R6
        BL          Move1Disk    // Move1Disk(fm, to)
	CMP	R4,#1
	BLE         Hanoi2
 	SUB	R4,#1
	MOV	R0,R4
	MOV	R1,R7
	MOV	R2,R6
	MOV	R3,R5
        BL          Hanoi        // Yes --> Hanoi(num - 1, aux, to, fm)

Hanoi2: 
	POP	{R4-R8,PC}
        .end


