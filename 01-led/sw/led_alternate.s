;------------------------------------------------------------------------------------------------------
; A Simple SoC  Application
; Toggle LEDs at a given frequency. 
;------------------------------------------------------------------------------------------------------



; Vector Table Mapped to Address 0 at Reset

						PRESERVE8
                		THUMB

        				AREA	RESET, DATA, READONLY	  			; First 32 WORDS is VECTOR TABLE
        				EXPORT 	__Vectors
					
__Vectors		    	DCD		0x20000200							; 16K Internal Memory
        				DCD		Reset_Handler
        				DCD		0  			
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD 	0
        				DCD		0
        				DCD		0
        				DCD 	0
        				DCD		0
        				
        				; External Interrupts
						        				
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
        				DCD		0
              
                AREA |.text|, CODE, READONLY
;Reset Handler
Reset_Handler   PROC
                GLOBAL Reset_Handler
                ENTRY

AGAIN		   	LDR 	R1, =0x50000000				;Write to LED with value 0x55
				LDR		R0, =0x55					;32'b0000_0000_0000_0000_0101_0101
				STR		R0, [R1]



				LDR		R0, =0x10				;Delay
Loop			SUBS	R0,R0,#1
				BNE Loop

				LDR 	R1, =0x50000000				;Write to LED with value 0xAA
				LDR		R0, =0xAA					;32'b0000_0000_0000_0000_1010_1010
				STR		R0, [R1]
;0x2FFFFF
				LDR		R0, =0x10				;Delay
Loop1			SUBS	R0,R0,#1
				BNE Loop1

				B AGAIN
				ENDP


				ALIGN 		4						; Align to a word boundary

		END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
   