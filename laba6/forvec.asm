FormVector  Macro _N, _M, _Matrix, _Vector, _S
            Local Rows, Cols,ODD, ZERODIV

            Push Ax Bx Cx Dx Di

            mov Bx,_Matrix ;now point on first elem of matrix
            Mov Di,_Vector  ;now points on first elem of output vect

;--nested loop        
Rows:       Push    Cx ; ?????????????

            Mov    Cx, _N  ;loop rows length times ;
            Xor    Ax, Ax
            xor    dl,dl

Cols:       test [BX][SI], Word Ptr 1
            Jnz ODD          
            Add Ax,[BX][SI]
            inc dl
ODD:

            Add  Bx, _M*_S 
            Loop Cols
                
            cmp dl,0
            je ZERODIV
            idiv dl ; AX/dl

ZERODIV:
            Mov    [Di], Ax ;put into result vector
            Add    Di, _S  ;into next index
            
            Pop     Cx
            Add     Si, _S
            xor     Bx,Bx
            Loop    Rows           
;-end of nested loop

            Pop  Di Dx Cx Bx Ax

            EndM