.model tiny
.data 
W_BG_R_SYM Equ 01110100b
W_BG_G_SYM Equ 01110010b
.code
.startup
	mov	ax, 13	; row
	mov	bx, 39	; col

	; calculate offset of the position in the video memory 
	dec	ax	; row-1
	mov	dl, 80	; 
	imul	dl	; (row-1)*80
	dec	bx	; col-1
	add	ax, bx	; (row-1)*80 + (col-1)
	add	ax, ax	; *2

	; set address 
	mov	bx, 0B800h
	mov	es, bx	; segment value for text mode video memory
	mov	di, ax	; calculated offset
 
	; write symbols and attributes
    mov bx,0
    mov ax,0
    mov cx,6
    ;BE AWARE DI+BX CAN ONLY BE TO INCRASE INDEX REGISTER OTHERWISER ERROR!
loopec:
    mov	byte ptr es:[di+bx], 'O'
    test ax,1
    jnz oddec
	;mov	byte ptr es:[di+bx], 'O'
	mov	byte ptr es:[di+bx+1], W_BG_R_SYM ; white background, red symbol
    jmp here
oddec:
    ;mov	byte ptr es:[di+bx+1], 'K'
	mov	byte ptr es:[di+bx+1], W_BG_G_SYM ; white background, red symbol
 here:
	add bx,2
    inc ax
   loop loopec
    ;mov	byte ptr es:[di+2], 'K'	
	;mov	byte ptr es:[di+3], W_BG_R_SYM ; white background, red symbol

.exit
end