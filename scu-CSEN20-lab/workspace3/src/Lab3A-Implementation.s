        .syntax         unified
        .cpu            cortex-m4
        .text

// int32_t Add(int32_t a, int32_t b) ;

        .global         Add
        .thumb_func
        .align
Add:
        ADD				R0,R0,R1
        BX              LR

// int32_t Less1(int32_t a) ;

        .global         Less1
        .thumb_func
        .align
Less1:
        SUBS 			R0,R0,#1
        BX              LR

// int32_t Square2x(int32_t x) ;

        .global         Square2x
        .thumb_func
        .align
Square2x:
        PUSH 			{LR,R4}
		ADD 			R0,R0,R0
		BL 				Square
		POP 			{R4,PC}

// int32_t Last(int32_t x) ;

        .global         Last
        .thumb_func
        .align
Last:
		PUSH 			{LR,R4}
		MOV 			R4,R0
		BL 				SquareRoot
		ADD 			R0,R4,R0
		POP 			{R4,PC}

        .end


