; Template for console application
         .586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

;Include kernel32.inc
;Include masm32.inc

;IncludeLib kernel32.lib
; IncludeLib masm32.lib

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
    
    ; ������
    push ecx
    push ebx
    
    mov ecx,LengthOf string
    mov ebx,0

    cycle:
        ; ��������� ecx
        push ecx
    
        cld
        mov ecx,LengthOf result
        mov al,string[ebx] ; �������� ������� �������
        lea edi,result ; ���������� ���������
        repne scasb ; ��������� ���� �� ������� � ������
        je continue ; ���� ��� ���� �������
        ; ����� ��������� ��� � �������
        lea edi,result
        add edi,count
        inc count
        stosb
    
        continue:
            ; �������������� ecx
            pop ecx
        
            inc ebx
        loop cycle
    
    ; ������
    pop ebx
    pop ecx
    
    
    ret

createDictionary endp

;Start:

; ����������
;mov ecx,LengthOf string
;mov ebx,0

;cycle:
    ; ��������� ecx
    ;push ecx
    
    ;cld
    ;mov ecx,LengthOf result
    ;mov al,string[ebx] ; �������� ������� �������
    ;lea edi,result ; ���������� ���������
    ;repne scasb ; ��������� ���� �� ������� � ������
    ;je continue ; ���� ��� ���� �������
    ; ����� ��������� ��� � �������
    ;lea edi,result
    ;add edi,count
    ;inc count
    ;stosb
    
    ;continue:
        ; �������������� ecx
        ;pop ecx
        
        ;inc ebx
;loop cycle

; ����� �� �����
;Invoke StdOut,ADDR MsgResult
;Invoke StdOut,ADDR result
;Invoke StdOut,ADDR NewLine
;XOR    EAX,EAX
;Invoke StdOut,ADDR MsgExit
;Invoke StdIn,ADDR inbuf,LengthOf inbuf		
	
;Invoke ExitProcess,0
;End    Start

