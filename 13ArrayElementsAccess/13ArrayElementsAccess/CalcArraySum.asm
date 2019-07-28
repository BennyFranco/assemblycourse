.model flat,c
.code

CalcArraySum proc
	push	ebp
	mov		ebp,esp

	mov		edx,[ebp+8]		;edx = 'x'
	mov		ecx,[ebp+12]	;edx = 'n'
	xor		eax,eax			;eax = 'sum'

	cmp		ecx,0
	jle		InvalidCount
@@:	add		eax,[edx]		;add next element to sum
	add		edx,4			;set pointer to next element
	dec		ecx				;adjust counter
	jnz		@B				;jump backward to the next @@ label if not equal to zero
	
InvalidCount:
	pop		ebp
	ret

CalcArraySum	endp
end