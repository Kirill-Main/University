         .586
         .MODEL  flat
         .DATA
saveC DWORD ?
saveD DWORD ?

         .CODE
externdef stdcall print:near
print proto stdcall char:byte

create PROC C public uses ecx ebx edi esi, str:ptr byte, res:ptr byte, len: sdword
    LOCAL count:dword
    mov count,0
    
    ; ��������� ������ ������ string � result
    mov edi,str
    mov esi,res
    
    ; ����������, ������ ��� �����
    mov ecx,len
    mov ebx,0
    
    mov saveD,edi
    cycle:
        ; ��������� ecx
        mov saveC,ecx
        
        push [edi+ebx] ; ������ ������� ������� � ���� ��� �������� � �������
        Invoke print,[edi+ebx] ; ����� ������� �������
        
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
    
    ret

_create endp

end