.386
.model flat

.data 
intArray SWORD 0,0,0,0,1,3,0,-34,-56,7,8
;intArray SWORD 0,0,0,0,0,0,0,0,0,0

.code
main proc
    mov ebx, OFFSET intArray
    mov ecx, LENGTHOF intArray

L1:
    cmp WORD PTR[ebx], 0 ; cmp equals to compare
    jnz found ; jnz = jump if not zero
    add ebx,2
    loop L1
    jmp notFound ; jump

found:
    movsx eax,WORD PTR[ebx]
    jmp quit

notFound:
    mov eax, 999999

quit:
    ret

main endp
end main