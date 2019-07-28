; F to C: Deduct 32, then multiply by 5, then divide by 9
; C to F: Multiply by 9, then divide by 5 and then add 32

.model flat,c
.const

r8_SfFtoC	real8	0.5555555556		; 5/9
r8_SfCtoF	real8	1.8					; 9/5
i4_32		dword	32

.code

FtoC	proc
		push	ebp
		mov		ebp,esp
		
		fld		[r8_SfFtoC]					; push the constant on the FPU stack
		fld		real8 ptr[ebp+8]			; load 'f'
		fild	[i4_32]						; load 32
		fsubp								; ST(0) = f-32 - https://c9x.me/x86/html/file_module_x86_id_121.html
		fmulp								; https://www.felixcloutier.com/x86/fmul:fmulp:fimul

		pop		ebp
		ret
FtoC	endp

CtoF	proc
		push	ebp
		mov		ebp,esp

		fld		real8 ptr[ebp+8]			; load 'c'
		fmul	[r8_SfCtoF]					; ST(0) = c * 9/5
		fiadd	[i4_32]						; ST(0) = c * 9/5 + 32	

		pop		ebp
		ret
CtoF	endp
end