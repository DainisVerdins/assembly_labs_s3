;splits value into digits, puts them into buffer and 
;draws them into video memory field
split_num_put_graphicaly_in_console Macro _Color_scheme,_BUFFER
    ;DI must be constant
    Push  Cx Dx 
    xor cx,Cx
    xor dx,Dx
    
;--loop what splits value into digits and places it into _buffer

;-- loop what get data from buffer and places it on screen
    mov	word ptr es:[di+BX],ax
    mov	word ptr es:[di+BX+1], _Color_scheme ; white background, yellow symbol
;--loop what restores buffer by placing in it zeros
    Pop   Dx Cx 
EndM