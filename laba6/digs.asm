
split_num_put_in_buf Macro _NUM,_BUFFER,_BUFFER_SIZE,_S
                        Local d,done,fin,overflow
;splits NUM into ASCI digits, puts them into buffer and 
;also places sign symbol if it is negative
    Push Ax Bx Cx Dx Di Si
;-- TODO FIX THIS BECAUSE BUFFER SIZZE COULD BEDIFERENT THEN 6

    mov	AX, _NUM	; save the original value of ax
    mov Cx,Ax       ;save data ax value in CX
;--caunt last index in _BUFFER
    mov Ax,_BUFFER_SIZE
    mov di,_S ;last pos buffer
    mul DI
    sub AX,_S
    mov DI,AX

    mov AX,CX;restore val in ax

    mov	bx, 10	; divisor - base of the decimal system
    mov	AX, _NUM	; put the original value into ax
    mov Cx,Ax ;save data to later detect if number was negative
    
    cmp ax,0;ax<0?
    jge d;
    neg ax  

d:	cwd			; extends ax to dx:ax
	idiv	bx		; dx:ax/bx = dx-remainder,ax-quotient
	add	DX, 30h		; convert binary value of decimal digit to ASCII
	mov	_BUFFER[di], dx	; copy symbol of the digit into output buffer

;this is to avoid buffer overflow 
;if  digits in number are more than buf size quite	
    cmp di,0    
    je overflow
    
    cmp	ax, 0		; quotient = 0 ?
	je	done
	sub di ,_S		; next index value for the output buffer
	jmp	d
done:
;--add last sign symbol if exist
   ;check if negative value was if so add sign
    cmp cx,0
    jge fin ;no

    sub di,_S   ;move buffer decrase index on buffer
    mov _BUFFER[di], '-'
    jmp fin
    
overflow:
    mov _BUFFER[di], '@';if overflow
fin:

Pop  Si Di Dx Cx Bx Ax
EndM
