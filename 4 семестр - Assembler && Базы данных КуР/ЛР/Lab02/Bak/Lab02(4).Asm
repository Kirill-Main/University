; Template for console application
         .586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

Include kernel32.inc
Include masm32.inc

IncludeLib kernel32.lib
IncludeLib masm32.lib

         .CONST
MsgExit  DB    13,10,"Press Enter to Exit",0AH,0DH,0

         .DATA
zaprosA DB 'Input a: ',0
zaprosB DB 'Input b: ',0
result DB 'Result = '
ResStr DB 16 DUP (' '),0

         .DATA?
inbuf    DB    100 DUP (?)
buf DB 10 DUP (?)
a SWORD ?
b SWORD ?
q SWORD ?

         .CODE
Start:
; Для a
Invoke StdOut, ADDR zaprosA
Invoke StdIn, ADDR buf, LengthOf buf
; Преобразование a в SDWORD
Invoke atol, ADDR buf
mov DWORD PTR a,EAX
; Для b
Invoke StdOut, ADDR zaprosB
Invoke StdIn, ADDR buf, LengthOf buf
; Преобразование b в SDWORD
Invoke atol, ADDR buf
mov DWORD PTR b,EAX
; Вычисления
mov AX,b
imul b ; AX:=b*b
imul b ; AX:=b*b*b
mov BX,b
add BX,4 ; BX:=b+4
sub BX,a ; BX:=b+4-a
idiv BX ; AX:=b*b*b/(b+4-a)
mov BX,AX
mov AX,a
imul a ; AX:=a*a
mov CX,2
idiv CX ; AX:=a*a/2
sub AX,BX
mov q,AX
; Преобразование
Invoke dwtoa,q,ADDR ResStr
; Вывод
Invoke StdOut,ADDR result
         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
         Invoke ExitProcess,0
         End    Start

