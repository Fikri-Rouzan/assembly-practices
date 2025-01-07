.model small
.stack 100h

.data

    msg1 db "Masukkan N1: $"
    msg2 db "Masukkan N2: $"
    msg3 db "Hasil Dari (N1+N2)*2 : $"
    newline db 0dh, 0ah, '$'
    
.code

main:
    mov ax, @data
    mov ds, ax
    
first_input:
    mov ah, 09h
    lea dx, msg1
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al
        
    lea dx, newline
    mov ah, 09h
    int 21h
    
second_input:
    mov ah, 09h
    lea dx, msg2
    int 21h
    
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bh, al
        
    lea dx, newline
    mov ah, 09h
    int 21h

operation:    
    add bl, bh  
    
    mov al, bl
    
    mov cl, 2
    
    mul cl      
    
    aam
    
    mov bx, ax
    
output:
    lea dx, newline
    mov ah, 09h
    int 21h

    mov ah, 09h
    lea dx, msg3
    int 21h
    
tens_digit:
    mov dl, bh
    add dl, 30h
    mov ah, 02h
    int 21h
       
unit_digit:
    mov dl, bl
    add dl, 30h
    int 21h