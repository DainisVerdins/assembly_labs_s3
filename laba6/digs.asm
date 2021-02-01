;splits value into digits, puts them into buffer and 
;draws them into video memory field
split_num_put_in_buf Macro _BUFFER
                                        Local d,done
    ;DI must be constant
    Push Ax Bx Cx Dx Di

    xor cx,Cx
    xor dx,Dx
    mov Bx,10
    mov DI ,6 ;size of buffer
;--loop what splits value into digits and places it into _buffer
d:  cwd
    idiv bx
    add dl,30h
    mov _BUFFER[di],dx
    cmp ax,0
    je done
    dec di
    jmp d
done:
Pop  Di Dx Cx Bx Ax
EndM

place_on_screen Macro _Color_scheme,_BUFFER
    ;-- loop what get data from buffer and places it on screen
    mov	word ptr es:[di+BX],ax
    mov	word ptr es:[di+BX+1], _Color_scheme ; white background, yellow symbol
EndM

clear_buffer Macro _buffer
;--loop what restores buffer by placing in it zeros
EndM