         .586
         .MODEL  flat
         .DATA
count DWORD 0
saveC DWORD ?
saveD DWORD ?
         .CODE
public _create 
externdef ?print@@YGXD@Z:near

_create PROC 
    ; ������
    push ecx
    push ebx
    
    ; ��������� ������ ������ string � result
    mov edi,[esp+12]
    mov esi,[esp+16]
    
    ; ����������, ������ ��� �����
    mov ecx,[esp+20]
    mov ebx,0
    
    mov saveD,edi
    cycle:
        ; ��������� ecx
        mov saveC,ecx
    
        push eax
        call ?print@@YGXD@Z ; ����� ������� �������
        cld
        mov al,[edi+ebx] ; �������� ������� �������
        mov ecx,255
        mov saveD,edi
        mov edi,esi ; ���������� ���������
        repne scasb ; ��������� ���� �� ������� � ������
        je continue ; ���� ��� ���� �������
        ; ����� ��������� ��� � �������
        mov edi,esi
        add edi,count
        inc count
        stosb
        
        continue:
            ; �������������� ������
            mov edi,saveD
            mov ecx,saveC
        
            inc ebx
    loop cycle
    
    ; ��������� 0 � ����� ������
    mov al,0
    mov edi,esi
    add edi,count
    stosb
    
    ; ������
    pop ebx
    pop ecx
    
    ret

_create endp

end