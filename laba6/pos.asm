place_on_screen Macro _BUFFER,_S,_COLOR_SHEME
                Local d,ignore,done
    ;-- loop what get data from buffer and places it on screen
    Push Cx Dx Di
     
    mov si,0
d:  cmp si,6 ;size of _BUFFER
    je done
    mov ax,_BUFFER[si]
    ;if # means no symbols in buffer ignore what
    cmp ax,'#'
    je ignore
    mov	word ptr es:[di+BX],ax
    mov	word ptr es:[di+BX+1], _COLOR_SHEME 
ignore:
    add si,_S   ;step+=2
    add Bx,_S ;step+=size of element*2 
    jmp d
done:
    
    Pop  Di Dx Cx
EndM