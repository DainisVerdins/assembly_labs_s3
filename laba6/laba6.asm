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

    Matrix    DW    -160, -100, 16  ; 
              DW    -40, -100, -10  ; 
    Vector    DW    M Dup (?)
    buffer_size   Equ 6; max value in DW could be 5 digits big +1 digit for sign = 6
    buff_emty_sign Equ '#'
    buffer    DW  buffer_size Dup(buff_emty_sign);will hold digits for graphic output
    S    Equ    Type Matrix
Start:
;==================================
;-- TWO AT LEAST THE TODO TO DO!!!!!!!!!!!1
;===================================

    FormVector  N, M, Matrix, Vector, S
    Print M, Vector,S    ; just puts vectors data into ax register 
    Gprint M,Vector,buffer,buffer_size,buff_emty_sign,S    ;graphicaly outputs result into console
.exit 0
end