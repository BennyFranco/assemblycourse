.model	flat,c
.code

CountChar	proc
			push	ebp
			mov		ebp,esp
			push	esi

			mov		esi,[ebp+8]			; esi = 's'
			mov		cx,[ebp+12]			; cx = 'c'

			xor		edx,edx

@@:			lodsw						; load next char into ax, use loadsb for normal char	
			or		ax,ax				; test for end of string
			jz		@F					; jump foward to next @@ label if end of estring found
			cmp		ax,cx				; test current char
			jne		@B					; jump backward to the next @@ lable if not match
			inc		edx					; update match count
			jmp		@B

@@:			mov		eax,edx				; eax = character count

			pop		esi
			pop		ebp
			ret
CountChar	endp
end