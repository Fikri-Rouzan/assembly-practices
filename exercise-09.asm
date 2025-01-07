.model small
.stack 100h

.data 

    msg1 db 'Masukkan Angka Pertama (0-9): $'
    msg2 db 10, 13, 'Masukkan Angka Kedua (0-9): $'
    msg3 db 10, 13, 'Masukkan Angka Ketiga (0-9): $'
    result db 10, 13, 'Urutan Angka Secara Ascending: $'
    newline db 10, 13, '$'
    a db ?  
    b db ?  
    c db ? 

.code

main:
    mov ax, @data       
    mov ds, ax         

input1:
    lea dx, msg1       
    mov ah, 09h         
    int 21h             
    mov ah, 01h         
    int 21h            
    sub al, '0'         
    mov a, al           

input2:
    lea dx, msg2
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov b, al           

input3:
    lea dx, msg3
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov c, al           

bubble_sort:
    mov al, a            
    mov bl, b           
    cmp al, bl           
    jbe skip_ab
    xchg al, bl         
    mov a, al           
    mov b, bl
    
skip_ab:
    mov al, b            
    mov bl, c
    cmp al, bl
    jbe skip_bc
    xchg al, bl          
    mov b, al
    mov c, bl
    
skip_bc:
    mov al, a            
    mov bl, b
    cmp al, bl
    jbe skip_ab_final
    xchg al, bl
    mov a, al
    mov b, bl
    
skip_ab_final:
    lea dx, result
    mov ah, 09h
    int 21h

displays1:
    mov al, a
    add al, '0'         
    mov dl, al
    mov ah, 02h
    int 21h

displays2:
    mov ah, 02h
    mov al, ' '         
    mov dl, al
    int 21h

    mov al, b
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

displays3:
    mov ah, 02h
    mov al, ' '         
    mov dl, al
    int 21h

    mov al, c
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

out_program:
    mov ah, 4Ch
    int 21h

end main