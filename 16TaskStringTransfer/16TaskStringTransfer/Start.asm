.386
.model flat,c

.data
quote	byte "Machines do feel",0
message	byte sizeof quote DUP(0),0

.code
GetString	proc
			push	ebp
			mov		ebp,esp
			push	esi

			xor		eax,eax
			mov		esi,0
			mov		ecx,sizeof quote

LP:		
			mov		al,quote[esi]			; get a character from quote
			mov		message[esi],al			; store in the message
			inc		esi
			loop	LP
			
			mov eax, offset message
			mov si, word ptr [eax]

			pop		esi
			pop		ebp
			ret

GetString	endp
end