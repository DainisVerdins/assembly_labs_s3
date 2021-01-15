include macro_21.mac
include macro_10.mac

.model tiny
.code
.startup
   Org 100h
   Jmp Short Start
Message Db "Hello, User !$"   

Start:
   Cls
   GoToXY    0, 2
   PutString Message
   GoToXY    0, 3
   MultiChar '*', 7
   MultiChar '*', 7   
   GoToXY    0, 4
   PutString Message

.exit 0
end