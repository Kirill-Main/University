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
    ; пролог
    push ecx
    push ebx
    
    ; сохраняем адреса строки string и result
    mov edi,[esp+12]
    mov esi,[esp+16]
    
    ; переменные, нужные для цикла
    mov ecx,255
    mov ebx,0
    
    mov saveD,edi
    cycle:
        ; сохраняем ecx
        mov saveC,ecx
        
        cld
        mov al,[edi+ebx] ; получаем текущий элемент
        push al
        call ?print@@YGXD@Z ; вызов внешней функции
        mov ecx,255
        mov saveD,edi
        mov edi,esi ; сбрасываем указатель
        repne scasb ; проверяем есть ли элемент в строке
        je continue ; если уже есть элемент
        ; иначе добавляем его к цепочке
        mov edi,esi
        add edi,count
        inc count
        stosb
        
        continue:
            ; восстаналиваем данные
            mov edi,saveD
            mov ecx,saveC
        
            inc ebx
    loop cycle
    
    ; эпилог
    pop ebx
    pop ecx
    
    ret

_create endp

end