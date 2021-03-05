Comment &
  Matricu pārskata kolona rinda veida, kuri ir nepara skaitļī, 
  skaitļi tiek summeti un tiek izskaitļots vidējais aritmetiskais
  
&

;DONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
; TODO CHECK ON TEST EXAMPLES I AM NOT SURE WHAT ALL IS FINE

.model small ;More for using preaty debugger mode(only can be used in .exe files) than td basic one for .com files
.stack 256
.data
N     Equ 2 ;rows
M     Equ    3 ;colons

Min    Equ    2
Max    Equ    6

Matrix    DW    16, 6, 1  ; 
          DW    4, 4, 1  ; 
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
;input
;[Bp+4] - row number
;[Bp+6] - col number
;[Bp+8] - matrix adress
;[Bp+10] -vector address
        push Bp
        mov Bp,Sp    ;get stack top
        
        sub sp,8        ;;added now pART
        ;is var for what times increase BX index
        Local ROWSTEP:Word ;local var
        mov AX,S
        mul word Ptr [Bp+6] ;m
        Mov [Bp-8], AX ;MUST BE 2
        mov BX,AX       ;;ignore this line
        mov [Bp-6],word Ptr S; must be 2
        MOV ax,[Bp-8]   ;must be 6
        mov ax,[Bp-6]   ;must be 2

        Mov [Bp-2], BX;


        mov Bx, [Bp+8] ;get Matrix adrres

        Mov DI,[Bp+10];get VectorMov
        
        xor SI,SI
        mov    Cx,[Bp+6]
;--nested loop        
Rows:   Push    Cx

        Mov    Cx, [Bp+4]  ;loop rows length times ;
        Xor    Ax, Ax
        XOR     BX,BX ;?
        xor    DX,DX

Cols:   test [BX][SI], Word Ptr 1
        Jnz ODD          
        Add Ax,[BX][SI]
        inc DX
ODD:

        Add  Bx, ROWSTEP 
        Loop Cols
            
        cmp dx,0
        je ZERODIV
        MOV CX,DX
        CWD ;AX:AX:DX
        idiv Cx ; AX/dl

ZERODIV:
        Mov    [Di], Ax ;put into result vector
        Add    Di, S  ;into next index of result vector
           
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
    Lea Ax ,Vector ;putting Vect into stack
    push Ax
    Mov AX, word Ptr M ;placing M into stack
    push Ax
    CALL PrintVector ; CALLING procedure
        
.exit 0
end