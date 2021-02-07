;--------------------------------------------
; loops thru input Matrix in col-row manner ;
;counts not odd numbers of colum and calcs avarage of it (withoout quotient)
;-------------------------------------------

FormVector  Macro _N, _M, _Matrix, _Vector, _S
            Local Rows, Cols,ODD, ZERODIV

            Push Ax Bx Cx Dx Di

            Lea Di,_Vector  ;now points on first elem of output vect
            XOR SI,SI

            mov    Cx,_M ;
;--nested loop        
Rows:       push    Cx 

            Mov    Cx, _N  ;loop rows length times ;
            Xor    Ax, Ax
            xor    dx,dx
            xor    bx,bx

Cols:       test _Matrix[BX+SI], Word Ptr 1
            Jnz ODD          
            Add Ax,_Matrix[BX][SI]
            inc dx
ODD:

            Add  Bx, _M*_S 
            Loop Cols
                
            cmp dx,0
            je ZERODIV
            mov ax,ax
            mov cx,dx
            cwd
            idiv cx ; AX/dx

ZERODIV:
            Mov     [Di], Ax ;put into result vector
            Add     Di, _S  ;into next index
            
            Pop     Cx
            Add     Si, _S
            Loop    Rows           
;-end of nested loop
          

            Pop  Di Dx Cx Bx Ax

            EndM