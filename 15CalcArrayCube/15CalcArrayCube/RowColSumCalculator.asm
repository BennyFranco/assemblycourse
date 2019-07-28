.model flat,c
.code

CalcArrayRowColSum		proc
		push	ebp
		mov		ebp,esp
		push	ecx
		push	esi
		push	edi

		xor		eax,eax		
		cmp		dword ptr[ebp+12],0			; ebp+12  = 'nrows'
		jle		InvalidArgument
		mov		ecx,[ebp+16]
		cmp		ecx,0
		jle		InvalidArgument

		mov		edi,[ebp+24]				; edi = 'colSum'
		xor		eax,eax
		rep		stosd						; fill array with zeros

		mov		ebx,[ebp+8]					; ebp = 'x'
		xor		esi,esi						; i = 0
		
		; Outer loop
Lp1:	mov		edi,[ebp+20]
		mov		dword ptr[edi+esi*4],0		; rowSum[i] = 0

		xor		edi,edi						; j = 0
		mov		edx,esi						; edx = 'i'
		imul	edx,[ebp+16]				; edx = i * ncols

		; Inner Loop
Lp2:	mov		ecx,edx						; ecx = i * ncols
		add		ecx,edi						; ecx  = i* ncols*j
		mov		eax,[ebx+ecx*4]				; eax = x[i*ncols*j]
		mov		ecx,[ebp+20]				; ecx = 'rowSum'
		add		[ecx+esi*4],eax				; rowSum[i] += eax
		mov		ecx,[ebp+24]				
		add		[ecx+edi*4],eax				; colSum[i] += eax
		
		inc		edi							; j++
		cmp		edi,[ebp+16]				
		jl		Lp2							; jump if j < ncols 
		inc		esi
		cmp		esi,[ebp+12]
		jl		Lp1							; jump if i < nrows
		mov		eax,1

InvalidArgument:
		pop		edi
		pop		esi
		pop		ecx
		pop		ebp
		ret

CalcArrayRowColSum	endp
end