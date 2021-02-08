
; places on screen data from buffer
;inputs Buffer what contains asci digits
;       _S typ of matryx
;       _Color_sheme  digits color will be displayed 
;outputs bx changed its values after displaying digit it increases by _S at every digit placed from buff
place_on_screen Macro _BUFFER,_S,_COLOR_SHEME
                Local d,ignore,done
    Push Cx Dx Di Si

    mov si,0

;-- loop what get data from buffer and places it on screen
d:  cmp si,6 ;size of _BUFFER is 6 if above jump
    jg done
    mov ax,_BUFFER[si]
    mov _BUFFER[SI], '#' ;cleans after self buffer[i] ;KASTIL need to make macro for cleaning buff not like this!

    ;if # means no symbols in buffer pos ignore what
    cmp ax,'#'
    je ignore
    mov	word ptr es:[di+BX],ax
    mov	word ptr es:[di+BX+1], _COLOR_SHEME 

    add Bx,_S ;step+=size of element*2 
ignore:
    add si,_S   ;step+=2
    jmp d

done:


    Pop Si Di Dx Cx
EndM