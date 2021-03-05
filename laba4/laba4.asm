Comment &
  Atrast katrâ rindiòâ elementu daudzumu diapazonâ [Min, Max]
&
;!!!!! BE AWARE HERE ARE SOMETHING PROBLEMS WITH MEMORY. I FORGET WHAT KIND OF
.model tiny
.data
N    Equ 2 ;rows
M     Equ    3 ;colons

Min    Equ    2
Max    Equ    6

Matrix    DW    2, 2, 1  ; 
        DW    4, 2, 1  ; 
Vector    DW    M Dup (?)

S    Equ    Type Matrix

.code
.startup
    Xor    Bx, Bx
    Xor Si,Si
    Mov    Cx, M
    Lea    Di, Vector

Rows:    Push    Cx

    Mov    Cx, N  ;loop 2 times
    ;Xor    Si, Si
    Xor    Ax, Ax
    Xor    Bx, Bx
    xor dl,dl

Cols:    test    Matrix[BX][SI], 1
    Jnz    False          
    Add    Ax,Matrix[BX][SI]
    inc dl
False:
    Add    Bx, S*M ;move iterator
    Loop    Cols
    
    cmp dl,0
    je ZERODIV
    idiv dl ; AX/dl

ZERODIV:
    Mov    [Di], Ax ;put into result vector
    Add    Di, S  ;into next index
   
    Pop     Cx
    Add    Si, S
    Loop    Rows   


    Xor Bx, Bx
    Mov    Cx, M
Print:    Mov    Ax, Vector[Bx]
    Add    Bx, S
    Loop    Print
        
.exit 0
end