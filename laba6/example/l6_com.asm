include macr.asm



.model tiny
.code
.startup
            Org  100h
            Jmp  Short Start
    N       Equ 2
    M       Equ 3
    Matrix  Dw  2, 6, 1
            Dw  4, 4, 1
    Vector  DW  N Dup (?)
    Min     Equ 2
    Max     Equ 6
    S       Equ Type Matrix

Start:
                mov AX,0
                MOV AX,0
            FormVector  N, M, Matrix, Vector, Min, Max, S
            Print N, Vector    ; netika izmantots parametrs S - biistami!

.exit 0
end