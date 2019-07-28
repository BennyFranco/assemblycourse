; Surface area of sphere: 4pi*r^2
; Volume of a sphere: 4pi*r^3/3 = (4pi*r^2)r/3
.model flat,c
.const
r8_4p0		real8	4.0
r8_3p0		real8	3.0

.code
CalcSphereAreaAndVolume	proc
		push	ebp
		mov		ebp,esp

		xor		eax,eax
		fld		real8 ptr[ebp+8]		; ST(0) = 'r'
		fldz							; ST(0) = 0.0, ST(1) = 'r'
		fcomip	st(0),st(1)				; compares 0.0 to 'r'
		fstp	st(0)					

		jp		Done					; jump if unordered operands
		ja		Done					; jump if r < 0.0;

		; Calculate surface area
		fld		real8 ptr[ebp+8]		; ST(0) = 'r'
		fld		st(0)					; ST(0) = 'r', ST(1) = 'r'
		fmul	st(0),st(0)				; ST(0) = r*r, ST(1) = 'r'
		fldpi							; ST(0) = pi

		fmul	[r8_4p0]				; ST(0) = 4 * pi
		fmulp							; ST(0) = 4 * pi * r*r

		mov		edx,[ebp+16]			; edx = 'sa'
		fst		real8 ptr[edx]			; FST reference: https://c9x.me/x86/html/file_module_x86_id_117.html

		; Calculate volume
		fmulp							; ST(0) = 4*pi*r*r*r
		fdiv	[r8_3p0]				; ST(0) = (4*pi*r*r*r)/ 3
		
		mov		edx,[ebp+20]
		fstp		real8 ptr[edx]

		mov		eax,1					; return true

Done:	pop		ebp
		ret
CalcSphereAreaAndVolume	endp
end