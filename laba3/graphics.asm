;prints data from vector into console using graphics
;white bg and yellow symbol if for odd numbers
;white bg and green symbol is for even numbers
;black bg and red symbol is for zero

.model tiny
.data 
W_BG_Y_SYM Equ 01111110b ; white background, yellow symbol
W_BG_G_SYM Equ 01110010b ; white background, green symbol
BLACK_BG_R_SYM Equ 0000100n; bkack bg and red foreground

M    Equ    3 ;colons
Vector    DW    2 ,3, 0
Number DW 69
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
    ;mov ax,Vector[bx]
	;inc ax
	mov ax,Vector[bx]
	add ax,48
	;dec ax
	;mov ax,Number
    mov cx,M
	;mov bl, 69
    ;BE AWARE DI+BX CAN ONLY BE TO INCRASE INDEX REGISTER OTHERWISER ERROR!
loopec:
    mov	word ptr es:[di+BX], ax
	mov	word ptr es:[di+BX+1], W_BG_Y_SYM ; white background, yellow symbol
	add bx,2
   loop loopec

.exit
end