         .586
         .MODEL  flat
         .DATA
saveC DWORD ?
saveD DWORD ?

         .CODE
externdef stdcall print:near
print proto stdcall char:byte

create proc C public uses ecx ebx edi esi, str:ptr byte, res:ptr byte, len: sdword
    local count:dword
    mov count,0
    
    ; сохраняем адреса строки string и result
    mov edi,str
    mov esi,res
    
    ; переменные, нужные для цикла
    mov ecx,len
    mov ebx,0
    
    mov saveD,edi
    cycle:
        ; сохраняем ecx
        mov saveC,ecx
        
        push [edi+ebx] ; кладем текущий элемент в стек для передачи в функцию
        Invoke print,[edi+ebx] ; вызов внешней функции
        
        cld
        mov al,[edi+ebx] ; получаем текущий элемент
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
    
    ; добавляем 0 в конец строки
    mov al,0
    mov edi,esi
    add edi,count
    stosb
    
    ret

create endp

end