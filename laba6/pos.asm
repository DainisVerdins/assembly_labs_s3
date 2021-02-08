
; places on screen data from buffer
;inputs Buffer what contains asci digits
;       _S typ of matryx
;       _Color_sheme  digits color will be displayed 
;outputs bx changed its values after displaying digit it increases by _S at every digit placed from buff
place_on_screen Macro _BUFFER,_BUFFER_SIZE,_BUFF_EMTY_SIGN,_S,_COLOR_SHEME
                Local d,ignore,done
    Push Ax Cx Dx Di Si
;--calc last index of _BUFFER
    mov Ax,_BUFFER_SIZE
    mov DX,_S
    mul DX
    SUB ax,_S
    mov dx,ax
    xor ax,ax;clear afrter self ax
    

;-- loop what get data from buffer and places it on screen
    mov si,0
d:  cmp si,DX 
    jg done

    mov ax,_BUFFER[si]
    mov _BUFFER[SI], _BUFF_EMTY_SIGN ;cleans after self buffer[i] ;KASTIL need to make macro for cleaning buff not like this!
    
    cmp ax,_BUFF_EMTY_SIGN
    je ignore
    
    mov	word ptr es:[di+BX],ax
    mov	word ptr es:[di+BX+1], _COLOR_SHEME 

    add Bx,_S ;step+=size of element*2 
ignore:
    add si,_S   ;step+=2
    jmp d

done:

    Pop Si Di Dx Cx AX
EndM