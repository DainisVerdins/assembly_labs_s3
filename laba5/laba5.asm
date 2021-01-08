Comment &
  Matricu pārskata kolona rinda veida, kuri ir nepara skaitļī, 
  skaitļi tiek summeti un tiek izskaitļots vidējais aritmetiskais
  
&

;TODO NEED TO FIX 63 ROW AND FIGUROUT ABOUT LOCAL VARIABLES IN PROCEDURES!!!


.model small
.stack 100
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

;------------------------------------------------------------------------
; indexing matrix in col-row manner (odd numbs 
;range)counts AVG and puts the result(quotient?) in Vector
;INPUTS - row count of matrix,col count of matrix,Matrix addr,Vector addr
;
;-----------------------------------------------------------------------
MatrixProcessing Proc
        push Bp
        mov Bp,Sp    ;get stack top
        
        ;get rows
        Local rowsCount:Word ;local var
        Sub Sp,2
        Mov Cx, [Bp+4]
        Mov [Bp-2],Cx
        
        ;get Matrix
        mov Bx, [Bp+8] 

        ;get VectorMov
        Mov DI,[Bp+10]
        
        xor SI,SI
        
;--nested loop        
Rows:   Push    Cx

        Mov    Cx, [Bp-2]  ;loop 2 times ;rowsCount
        Xor    Ax, Ax
        xor    dl,dl

Cols:   test [BX][SI], Word Ptr 1
        Jnz ODD          
        Add Ax,[BX][SI]
        inc dl
ODD:
        Add  Bx,  M*S ; NOT WORKING [Bp-4]*S and  
        Loop Cols
            
        cmp dl,0
        je ZERODIV
        idiv dl ; AX/dl

ZERODIV:
        Mov    [Di], Ax ;put into result vector
        Add    Di, S  ;into next index
           
        Pop     Cx
        Add    Si, S
        xor     Bx,Bx
        Loop    Rows           
;-end of nested loop
        Mov Sp,Bp
        Pop Bp ;get back Bp reg
        Ret 2*4 ; get out because pushed was four prms
MatrixProcessing EndP

;--------------------------------------------------------
;proc for printingVector
;prints vector IMITATION
;inputs - col count of matrix, addr of Vector
;----------------------------------------------------------
PrintVector Proc
        push Bp
        mov Bp,Sp    ;get stack top
        
        ;get col count
        Mov Cx, [Bp+4]
        ;get addr of Vector
        Mov DI,[Bp+6]

Print:  Mov    Ax, [DI] ; moves data from vector into AX 
        Add    Di, S ;inc index
        Loop    Print

        Pop Bp ;get back Bp reg
        Ret 2*2 ; get out because pushed was two prms
PrintVector EndP


.startup
   Lea Ax,Vector
   push AX
   Lea Ax,Matrix
   push AX
   Mov Ax,M
   push AX
   Mov Ax,N
   push AX
CALL MatrixProcessing

; data what will be inputed for stack for proc
    ;Xor Bx, Bx
    Lea Ax ,Vector ;putting Vect into stack
    push Ax
    Mov AX, M ;placing M into stack
    push Ax
    CALL PrintVector ; CALLING procedure
        
.exit 0
end