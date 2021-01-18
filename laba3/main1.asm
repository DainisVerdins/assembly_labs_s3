Ones proc near
    push ebx ; save ebx value
    push ecx ; save ecx value
    xor ebx, ebx ; counter ebx = 0
testb: test eax, 1 ; test rightmost bit of EAX
    jz skip ; skip if bit is zero
    inc ebx ; otherwise increment counter EBX
skip: shr eax, 1 ; shift right EAX by 1 bit
    loop testb ; repeat
    mov eax, ebx ; copy result to EAX
    pop ecx ; restore register values (in reverse order!)
    pop ebx
    ret ; return to caller
Ones endp

.data
num dd 29 ; 1Dh = 11101b
buf db '0000', 0

main proc
mov eax, num
mov ecx, 32
call Ones ; result is in eax
; convert numeric value to text
invoke dwtoa, eax, offset buff
; output to console
push offset buff
call StdOut
; exit
push0
callExitProcess
main endp
