;----------------------
;"prints" out data from Vector in graphic mode
;, input N- length of vector, _Vector Vector what contains data
;-
;white bg and yellow symbol if for odd numbers
;white bg and green symbol is for even numbers
;black bg and red symbol is for zero

include digs.asm
include pos.asm

GPrint Macro _N, _Vector,_buffer,_S
    Local loopec, check_on_even,number_is_odd, next

	Push Ax Bx Cx Dx Di

    W_BG_Y_SYM Equ 01111110b ; white background, yellow symbol	; odd
	W_BG_G_SYM Equ 01110010b ; white background, green symbol ;even
	BLACK_BG_R_SYM Equ 0000100b; bkack bg and red foreground	;zero
	BLACK_BG_W_SYM	Equ 0000111b;for splitter sign
	
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
    mov cx,_N
    ;BE AWARE DI+BX CAN ONLY BE TO INCRASE INDEX REGISTER OTHERWISER ERROR!
	;BX,DI,AX,CX,
	XOR SI,SI
loopec:
	mov ax,_Vector[SI]	

;--if value is zero
	cmp ax,0
	jne check_on_even
	add Ax,48 ;convert into char
	mov	word ptr es:[di+BX],ax
	mov	word ptr es:[di+BX+1], BLACK_BG_R_SYM 
	add bx,_S
	jmp next

;--if value is even
check_on_even:
	test ax,1
	jnz number_is_odd
	add ax,48 ;convert into char W_BG_G_SYM
	mov	word ptr es:[di+BX], ax
	mov	word ptr es:[di+BX+1], W_BG_G_SYM ; white background, yellow symbol
	add bx,_S
	jmp next

;-- if val is odd
number_is_odd:
	;split_num_put_in_buf ax,_buffer,_S       ;;it working in passes the param
	;place_on_screen _buffer,_S,W_BG_Y_SYM    ;couses jump out of range 016h
	;clear_buffer _buffer                      ;emty define
	
	
	;this way works but i want to put it all into defines
	add ax,48 ;convert into char W_BG_G_SYM
	mov	word ptr es:[di+BX], ax
	mov	word ptr es:[di+BX+1], W_BG_Y_SYM ; white background, yellow symbol
	add bx,_S
next:

;incrase index
	add si,2 ;increase index of iterator of vector
	loop loopec
	xor dx,dx
	Pop  Di Dx Cx Bx Ax

EndM


