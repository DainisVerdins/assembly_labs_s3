FormVector  Macro _N, _M, _Matrix, _Vector, _Min, _Max, _S
            Local Rows, Cols, Next

            Push Ax Bx Cx Dx Di

            Mov  Cx, _N
            Lea  Bx, _Matrix
            Lea  Di, _Vector

Rows:       Mov  Dx, Cx
            Mov  Cx, _M
            Xor  Ax, Ax

Cols:       Cmp  [Bx], Word Ptr _Min
            Jl   Next
            Cmp  [Bx], Word Ptr _Max
            Jg   Next
            Inc  Ax
Next:
            Add  Bx, _S
            Loop Cols

            Mov  [Di], Ax
            Mov  Cx, Dx
            Add  Di, _S
            Loop Rows

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