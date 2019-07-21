.386
.model flat,c
.code
AdderASM proc
    push    ebp             ; push the ebp register
    mov     ebp, esp        ; copy the content of the stack to ebp to have access to the functions argument

    mov     eax, [ebp+8]    ; eax = 'a'
    mov     ecx, [ebp+12]   ; ecx = 'a'
    mov     edx, [ebp+16]   ; edx = 'c'

    add     eax, ecx        ; eax = 'a' + 'b'
    add     eax, edx        ; eax = 'a' + 'b' + 'c'

    pop ebp
    
    ret

AdderASM    endp
            end