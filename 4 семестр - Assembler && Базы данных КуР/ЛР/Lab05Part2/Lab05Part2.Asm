         .586
         .MODEL  flat

         .CODE
externdef stdcall print:near
print proto stdcall char:byte

create proc C public uses ecx ebx edi esi, string:ptr byte, result:ptr byte, len: sdword
    ; счетчик сдвига в res
    local count:dword
    mov count,0
    
    ; сохраняем адреса строки string и result
    mov edi,string
    mov esi,result
    
    ; переменные, нужные для цикла
    mov ecx,len
    mov ebx,0
    
    cycle:
        ; сохраняем ecx
        push ecx
        
        Invoke print,[edi+ebx] ; вызов внешней функции
        
        cld
        mov al,[edi+ebx] ; получаем текущий элемент
        mov ecx,255
        push edi
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
            pop edi
            pop ecx
        
            inc ebx
    loop cycle
    
    ; добавляем 0 в конец строки
    mov al,0
    mov edi,esi
    add edi,count
    stosb
    
    ret

create endp

end