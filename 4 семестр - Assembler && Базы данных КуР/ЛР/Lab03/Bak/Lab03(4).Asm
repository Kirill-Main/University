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
f SWORD ?
         .CODE
Start:
; ��� A
Invoke StdOut, ADDR zaprosA
Invoke StdIn, ADDR buf, LengthOf buf
; �������������� a � SDWORD
Invoke atol, ADDR buf
mov DWORD PTR a,EAX
; ��� B
Invoke StdOut, ADDR zaprosB
Invoke StdIn, ADDR buf, LengthOf buf
; �������������� b � SDWORD
Invoke atol, ADDR buf
mov DWORD PTR b,EAX
; ����������
XOR    EDX,EDX ; ������� EDX
mov BX,b
mov AX,a
cwd
idiv BX ; AX:=a/b
mov CX,AX
mov BX,a
sub BX,b ; BX:=a-b
mov AX,a
add AX,b ; AX:=a+b
XOR    EDX,EDX ; ������� EDX
idiv BX ; AX:=(a+b)/(a-b)
cmp AX,CX ; ��������� AX � CX
jl less ; ������� �� ������
mov AX,a
add AX,b
mov f,AX
jmp continue ;  ������� �� ����� ���������
less: 
    mov AX,a
    sub AX,b
    mov f,AX
continue:
Invoke dwtoa,f,ADDR ResStr
Invoke StdOut,ADDR result    
XOR    EAX,EAX
Invoke StdOut,ADDR MsgExit
Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
Invoke ExitProcess,0
End    Start

