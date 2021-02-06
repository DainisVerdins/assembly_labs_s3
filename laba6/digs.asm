
split_num_put_in_buf Macro _NUM,_BUFFER,_S
                        Local d,done,fin
;splits NUM into ASCI digits, puts them into buffer and 
;also places sign symbol if it is negative
    Push Ax Bx Cx Dx Di Si

    mov di,6
    mov	bx, 10	; divisor - base of the decimal system
    mov	AX, _NUM	; save the original value of ax
    cmp ax,0;ax<0?
    jge d;
    neg ax

d:	cwd			; extends ax to dx:ax
	idiv	bx		; dx:ax/bx = dx-remainder,ax-quotient
	add	DX, 30h		; convert binary value of decimal digit to ASCII
	mov	_BUFFER[di], dx	; copy symbol of the digit into output buffer
	cmp	ax, 0		; quotient = 0 ?
	je	done
	sub di ,_S		; next index value for the output buffer
	jmp	d
done:
;add last sign symbol if exist
    mov ax,_NUM
    cmp ax,0
    jge fin ;no
    sub di,_S
    mov _BUFFER[di], '-'
fin:

Pop  Si Di Dx Cx Bx Ax
EndM



clear_buffer Macro _buffer
;--loop what restores buffer by placing in it #
EndM