.model tiny
.data
msgInit db "Press any key or Esc to exit!", 13, 10, "$"
msgCtrl db "Ctrl is down", 13, 10, "$"
.code
.startup
mov ah, 9h
mov dx, offset msgInit
int 21h
xor bx, bx
mov es, bx
tst: mov al, es:0417h
test al, 00000100b
jz noctrl
mov dx, offset msgCtrl
mov ah, 9
int 21h
noctrl:
mov ah, 0 ; BIOS interrupt service
int 16h ; wait for key press (returns: ah=scan code, al=ASCII)
cmp ah, 1 ; Esc scan code?
jne tst
.exit
end