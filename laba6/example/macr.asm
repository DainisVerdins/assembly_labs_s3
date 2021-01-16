FormVector  Macro _N, _M, _Matrix, _Vector, _Min, _Max, _S
            Local Rows, Cols,ODD, ZERODIV

            Push Ax Bx Cx Dx Di

            Lea Di,_Vector  ;now points on first elem of output vect
            XOR SI,SI

            mov    Cx,_M ;FIX ON LABA 5
;--nested loop        
Rows:       push    Cx 

            Mov    Cx, _N  ;loop rows length times ;
            Xor    Ax, Ax
            xor    dl,dl
            xor    bx,bx

Cols:       test _Matrix[BX+SI], Word Ptr 1
            Jnz ODD          
            Add Ax,_Matrix[BX][SI]
            inc dl
ODD:

            Add  Bx, _M*_S 
            Loop Cols
                
            cmp dl,0
            je ZERODIV
            idiv dl ; AX/dl

ZERODIV:
            Mov     [Di], Ax ;put into result vector
            Add     Di, _S  ;into next index
            
            Pop     Cx
            Add     Si, _S
            Loop    Rows           
;-end of nested loop
          

            Pop  Di Dx Cx Bx Ax

            EndM



Print       Macro _N, _Vector
            Local Pr

            Push Ax Bx Cx

            Mov  Cx, _N
            Lea  Bx, _Vector
Pr:         Mov  Ax, [Bx]
            Add  Bx, S         ; S no galvenaas programmas, biistami!
            Loop Pr

            Pop  Cx Bx Ax

            EndM