.model flat,c
.const
r4_MinFloat		dword 0ff7fffffh
r4_MaxFloat		dword 7f7fffffh

.code
CalcMinMax		proc
		push	ebp
		mov		ebp,esp

		xor		eax,eax
		mov		edx,[ebp+8]			; edx = 'a'
		mov		ecx,[ebp+12]		; ecx = 'n'
		test	ecx,ecx
		jle		Done

		fld		[r4_MinFloat]		; Init min value
		fld		[r4_MaxFloat]		; Init max value

@@:		fld		real4 ptr[edx]		; load a*
		fld		st(0)				; duplicate *a on stack
		
		fcomi	st(0),st(2)			; compare *a with min
		fcmovnb	st(0),st(2)			; ST(0) = smallest value

		fstp	st(2)				; save new minimum val

		fcomi	st(0),st(2)			; compare *a with max
		fcmovb	st(0),st(2)			; ST(0) = larger value
		
		fstp	st(2)				; save new max val

		add		edx,4				; point to next element in the array
		dec		ecx
		jnz		@B

		mov		eax,[ebp+16]
		fstp	real4 ptr [eax]		; save final min
		mov		eax,[ebp+20]
		fstp	real4 ptr[eax]		; save final max
		mov		eax,1

Done:	pop		ebp
		ret

CalcMinMax	endp
end