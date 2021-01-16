;----------------------
;"prints" out data from Vector putting it into AX reg
;, input N- length of vector, _Vector Vector what contains data
;----------------------- 

Print       Macro _N, _Vector,_S
            Local Pr

            Push Ax Bx Cx

            Mov  Cx, _N
            Lea  Bx, _Vector
Pr:         Mov  Ax, [Bx]
            Add  Bx, _S         ; S no galvenaas programmas, biistami!
            Loop Pr

            Pop  Cx Bx Ax

            EndM