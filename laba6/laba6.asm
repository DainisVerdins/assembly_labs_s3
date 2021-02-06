;DONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
;---------------------------------
;
;Forms ooutput vector from input matrix where
; matrix is looped thru col-row manner 
;number is checked if it is odd or not
;if not counted and after passing thru all collon
;calcs avarage not odd number of col and puts it into Vector
;-----------------------------------------
; BE AWARE MACROS FILES NAME MUST BE MAX 6 SYmBOLS OTHERWISE ERROR

; TODO SOMETHING ABOUT TO SHOW OUT IN CONSOLE THE RESULT OF VECTOR IN GRAPHIC MODE

include forvec.asm
include print.asm
include gprint.asm
.model tiny
;.data
.code
.startup
        Org 100h
        Jmp Short Start
    N    Equ    2 ;rows
    M    Equ    3 ;colons

    Matrix    DW    16, 6, 1  ; 
              DW    16, 4, 1  ; 
    Vector    DW    M Dup (?)
    Buffer    DW    0,0,0,0 ;Dw is 4 bytes aka 5 digits max plus sign
    S    Equ    Type Matrix
Start:
    FormVector  N, M, Matrix, Vector, S
    Print M, Vector,S    ; now is using param S    
    Gprint M,Vector,Buffer,S
.exit 0
end