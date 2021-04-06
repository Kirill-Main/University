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
Three DWORD 3
Four DWORD 4
TwelveTimesTwo DWORD 24
         .DATA
zapros DB 'Input value of matrix: ',0
result DB 13,10,'Result value of matrix: '
ResStr DB 16 DUP (' '),0
NewLine DB 13,10,0
i DWORD 0
j DWORD 0
MaxI DWORD 3
count SDWORD 1
index DWORD 0
LineIndex DWORD 0
; matrix SDWORD 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18
         .DATA?
inbuf    DB    100 DUP (?)
buf DB 10 DUP (?)
matrix SDWORD 18 DUP (?)
elem SDWORD ?
         .CODE
Start:
; ¬вод матрицы
mov EBX,0 ; номер элемента 0
mov ECX,18 ; счетчик цикла
input_cycle:
    push ECX
    Invoke StdOut, ADDR zapros
    Invoke StdIn, ADDR buf, LengthOf buf
    ; ѕреобразование в SDWORD
    Invoke atol, ADDR buf
    mov DWORD PTR matrix[EBX*4],EAX
    add EBX,1
    pop ECX
loop input_cycle

; ¬ычислени€
; mov BX,0 ; номер элемента 0
mov ECX,3 ; счетчик цикла
cycle1:
    ; сохран€ем данные
    mov MaxI,ECX
    
    mov j,0 ; номер элемента 0
    mov ECX,6 ; счетчик цикла
    cycle2:
        mov EBX,j
        cmp i,EBX ; провер€ем совпадает ли номер текущего элемента со строкой
        jne next ; если не совпадает, то вычисл€ем произведение
        
        ; сохар€нем индекс элемента, в который далее будет записыватьс€ произведение
        mov EAX,i
        imul TwelveTimesTwo ; EAX:=i*6*4
        mov EBP,EAX
        mov EAX,j
        imul Four ; EAX:=j*4
        add EBP,EAX ; EBP:=j*4+i*6*4
        mov LineIndex,EBP
        jmp continue
        
        next:
            mov EAX,i
            imul TwelveTimesTwo ; EAX:=i*6*4
            mov EBP,EAX
            mov EAX,j
            imul Four ; EAX:=j*4
            add EBP,EAX ; EBP:=j*4+i*6*4
            mov EBX,EBP
            mov index,EBX ; сохран€ем индекс, чтобы не искать его повторно
            mov EAX,matrix[EBX]
            XOR EDX,EDX ; очищаем EDX
            idiv Three ; делим на 3
            cmp EDX,0 ; провер€ем делитс€ ли число на 3
            jne continue ; если не делитс€ на 3, то продолжить
        
        make:
            mov EBX,index
            mov EAX,matrix[EBX]
            imul count ; EAX:=EAX*count
            mov count,EAX
        continue:
            add j,1
            dec ECX
    jne cycle2
    
    ; записываем в i-элемент произведение
    mov EBX,LineIndex
    mov EAX,count
    mov matrix[EBX],EAX
    
    ; восстанавливаем данные
    mov count,1
    mov ECX,MaxI
    
    add i,1
    dec ECX 
jne cycle1

; ¬ывод матрицы
mov EBX,0 ; номер элемента 0
mov ECX,18 ; счетчик цикла
output_cycle:
    push ECX
    mov EAX,matrix[EBX*4]
    mov elem,EAX
    Invoke dwtoa,elem,ADDR ResStr
    Invoke StdOut, ADDR result
    add EBX,1
    pop ECX
loop output_cycle
Invoke StdOut, ADDR NewLine

XOR    EAX,EAX
Invoke StdOut,ADDR MsgExit
Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
Invoke ExitProcess,0
End    Start

