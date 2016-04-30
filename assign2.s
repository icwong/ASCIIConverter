			.data 
OUTPUT:		.quad 
INPUT:		.quad 0
POS_2:		.quad 2147483648	#2^31 - 1	+1 To get rid of the equal cases
NEG_2:		.quad 2147483649	#2^31		+1 To get rid of the equal cases

			.text
			.globl main

main:		mov		$INPUT, %r15		#R[r15] holds address of INPUT
			mov		0(%r15), %rax		#R[rsi] <- M[INPUT]
			mov 	$OUTPUT, %rcx		#R[rcx] holds address of OUTPUT			
			cmp 	$0,%rax				#M[INPUT] < Negative sign
			jl 		NEG_CMPR			#CONDITION TRUE: JMP to NEG_CMPR
			je		ZERO_CASE
			#CONDITION FALSE: INPUT IS POSITIVE INTEGER
			mov 	$POS_2, %r11
			mov		0(%r11), %r11
			cmp 	$POS_2,%rax			#M[INPUT] < 2^31 - 1
			#CONDITION FALSE: INPUT OUT OF RANGE
			jnl		END_IF			    #End execution
			mov 	$32, %rdi			#R[rdi] denotes space character
			mov		%rdi, 0(%rcx)		#M[0 + OUTPUT] = 32 or SPACE
			jmp     LOOP_CONVERT		

NEG_CMPR:	neg 	%rax				#CONVERT NEG INPUT INTO ABSOLUTE VALUE
			mov 	$NEG_2, %r11
			mov		0(%r11), %r11
			cmp     $NEG_2, %rax		#M[INPUT] < 2^31
			#CONDITION FALSE: INPUT OUT OF RANGE
			jnl 	END_IF
			mov		$45, %rsp			#R[rsp] denotes " - "
			mov     %rsp, 0(%rcx)		#M[0+OUTPUT] = 45 / Negative Sign
			jmp 	LOOP_CONVERT

ZERO_CASE:		mov 	$48,%rdx
				mov 	%rdx, 1(%rcx)
				jmp 	END_IF

LOOP_CONVERT: 	cmp    	$0, %rax			#QUOTIENT = 0 
				je 		END_IF			    #End execution
				mov 	$0, %rdx			#Reset the remainder to 0
				mov 	$10, %rbx			#R[rbx] = R[rbx] + 10
				div 	%rbx				#Divide INPUT by 10
				add 	$48, %rdx			#Convert base-2 into ASCII codeword
				add    	$1, %rcx			#Increment the next base register for OUTPUT
				mov		%rdx, 0(%rcx)		#Store ascii codeword into OUTPUT
				jmp    	LOOP_CONVERT
			
END_IF:	ret

