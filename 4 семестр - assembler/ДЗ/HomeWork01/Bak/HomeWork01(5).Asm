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
MsgInput DB "Input string: ",0
MsgResult DB "Result string: ",0
NewLine DB 13,10,0
find DB "OP" ; поиск строки
new DB "!!" ; замена
BackSpace DB 8

         .DATA
; string DB 20 dup(?)
MsgCount DB "Count = "
ResultCount DB 16 DUP (' '),0
count SWORD 0 ; количество повторений
string DB "Primer OP striOF OPv"

         .DATA?
inbuf    DB    100 DUP (?)

         .CODE
Start:
; Ввод строки
;Invoke StdOut,ADDR MsgInput
;Invoke StdIn,ADDR string,LengthOf string
;Invoke StripLF,ADDR string ; заменяем #13#10 нулем

; Вычисления
cld ; сброс флага DF - обработка строки от начала к концу
lea edi,string ; загрузка в edi смещения строки для проверки
lea esi,find ; загрузка в esi подстроки для проверки
mov ecx,LengthOf string
sub ecx,LengthOf find ; ecx:=Length0f(string)-Length0f(find)
add ecx,1 ; ecx:=Length0f(string)-Length0f(find)+1

cycle:
    ; сохраняем данные
    push edi
    push esi
    push ecx
    mov ecx,LengthOf find
    repe cmpsb ; находим строку
    jne next ; если не нашли, то переходим в next
    jcxz equal ; если нашли, то переходим в equal

equal:
    inc count
    sub edi,2
    mov ecx,LengthOf new
    lea esi,new
    rep movsb
    add edi,1
    mov ecx,LengthOf BackSpace
    lea esi,BackSpace
    rep movsb
    lea esi,find
    jmp next
       
next:
    ; восстанавливаем данные
    pop ecx
    pop esi
    pop edi
    inc edi ; смещаем строку
    loop cycle
    cmp ecx,0

result: 
; Вывод строки и количества повторений
Invoke StdOut,ADDR MsgResult
Invoke StdOut,ADDR string
Invoke StdOut,ADDR NewLine
Invoke dwtoa,count,ADDR ResultCount
Invoke StdOut,ADDR MsgCount

XOR    EAX,EAX
Invoke StdOut,ADDR MsgExit
Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
Invoke ExitProcess,0
End    Start

