;converts number into string

.model small
.data 
NUM Equ 16
string_buf    dw    0 ,0, 0 
.code
.startup
    mov di,4
    mov	bx, 10	; divisor - base of the decimal system
    mov	AX, NUM	; save the original value of ax
    cmp ax,0;ax<0?
    jge d;
    neg ax

d:	cwd			; extends ax to dx:ax
	idiv	bx		; dx:ax/bx = dx-remainder,ax-quotient
	add	dx, 30h		; convert binary value of decimal digit to ASCII
	mov	string_buf[di], dx	; copy symbol of the digit into output buffer
	cmp	ax, 0		; quotient = 0 ?
	je	done
	sub di ,2		; next index value for the output buffer
	jmp	d
done:
    mov ax,NUM
    cmp ax,0
    jge put ;no
    sub di,2
    mov string_buf[di], 3
put:
    mov ax,string_buf[0]
    ;cwd
    mov ax,string_buf[2]
    ;cwd
    mov ax,string_buf[4]
;cwd
.exit
end