; Template for console application
         .586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

Include kernel32.inc
Include masm32.inc

IncludeLib kernel32.lib
IncludeLib masm32.lib

         .CONST
MsgExit  DB    "Press Enter to Exit",0AH,0DH,0
string DB "Hellow world how are you today???",0
MsgResult DB "Result = ",0
NewLine DB 13,10,0

         .DATA
result db 20 Dup(?)
count DWORD 0
         .DATA?
inbuf    DB    100 DUP (?)

         .CODE
public createDictionary

createDictionary PROC
    
    ; сохраняем данные
    push ecx
    push ebx
    
    mov ecx,LengthOf string
    mov ebx,0

    cycle:
        ; сохраняем ecx
        push ecx
    
        cld
        mov ecx,LengthOf result
        mov al,string[ebx] ; получаем текущий элемент
        lea edi,result ; сбрасываем указатель
        repne scasb ; проверяем есть ли элемент в строке
        je continue ; если уже есть элемент
        ; иначе добавляем его к цепочке
        lea edi,result
        add edi,count
        inc count
        stosb
    
        continue:
            ; восстаналиваем ecx
            pop ecx
        
            inc ebx
        loop cycle
    
    ; эпилог
    pop ebx
    pop ecx
    
    
    ret

createDictionary endp

Start:

; Вычисления
mov ecx,LengthOf string
mov ebx,0

cycle:
    ; сохраняем ecx
    push ecx
    
    cld
    mov ecx,LengthOf result
    mov al,string[ebx] ; получаем текущий элемент
    lea edi,result ; сбрасываем указатель
    repne scasb ; проверяем есть ли элемент в строке
    je continue ; если уже есть элемент
    ; иначе добавляем его к цепочке
    lea edi,result
    add edi,count
    inc count
    stosb
    
    continue:
        ; восстаналиваем ecx
        pop ecx
        
        inc ebx
loop cycle

; Вывод на экран
Invoke StdOut,ADDR MsgResult
Invoke StdOut,ADDR result
Invoke StdOut,ADDR NewLine
XOR    EAX,EAX
Invoke StdOut,ADDR MsgExit
Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
Invoke ExitProcess,0
End    Start

