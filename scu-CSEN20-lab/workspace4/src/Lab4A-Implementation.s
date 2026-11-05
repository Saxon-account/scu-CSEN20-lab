			.syntax     unified
			.cpu        cortex-m4
			.text
// void UseLDRB(void *dst, void *src) ;
			.global     UseLDRB
			.thumb_func
			.align
UseLDRB:	.REPT 512
			LDRB 	  R2, [R1], #1
			STRB	  R2, [R0], #1
			.ENDR
			BX          LR

// void UseLDRH(void *dst, void *src) ;
			.global     UseLDRH
			.thumb_func
			.align
UseLDRH:	.REPT 256
			LDRH 	  R2, [R1], #2
			STRH	  R2, [R0], #2
			.ENDR
			BX          LR

// void UseLDR(void *dst, void *src) ;
			.global     UseLDR
			.thumb_func
			.align
UseLDR:		.REPT 128
			LDR 	  R2, [R1], #4
			STR		  R2, [R0], #4
			.ENDR
			BX          LR

// void UseLDRD(void *dst, void *src) ;
			.global     UseLDRD
			.thumb_func
			.align
UseLDRD:	.REPT 64
			LDRD 	  R2,R3, [R1], #8
			STRD	  R2,R3, [R0], #8
			.ENDR
			BX          LR

// void UseLDMIA(void *dst, void *src) ;
			.global     UseLDM
			.thumb_func
			.align
UseLDM:		PUSH 		{R4-R11}
			.REPT 16
			LDMIA		R1!, {R2-R9} 
			STMIA		R0!, {R2-R9}
			.ENDR
			POP 		{R4-R11}
			BX          LR
			.end
