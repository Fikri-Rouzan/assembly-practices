.model small 
.stack 100h

.data
    msg1 db 'Masukkan Angka (0-9): $'
    msg2 db 0dh, 0ah, 'Angka Ini Ganjil$'
    msg3 db 0dh, 0ah, 'Angka Ini Genap$'
    
.code
    mov ax, @data
    mov ds, ax
    
    mov ax, 0
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
        
    mov bh, 2
    sub al, '0'
    mov ah, 0
    div bh
    
    cmp ah, 0
    je even   
    
odd:
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp end_program
    
even:
    lea dx, msg3
    mov ah, 09h
    int 21h
    
end_program:
    mov ah, 4ch
    int 21h    