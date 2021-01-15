;---------------------------------
;
;
;-----------------------------------------
; BE AWARE MACROS FILES NAME MUST BE MAX 6 SYBOLS OTHERWISE ERROR

include forvec.asm

.model tiny
;.data
.code
.startup
        Org 100h
        Jmp Short Start
    N    Equ    2 ;rows
    M    Equ    3 ;colons

    Matrix    DW    2, 6, 1  ; 
              DW    4, 4, 1  ; 
    Vector    DW    M Dup (?)

    S    Equ    Type Matrix
Start:
    FormVector  N, M, Matrix, Vector, S
        
.exit 0
end