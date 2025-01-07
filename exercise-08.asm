.model small
.stack 100h  

.data 

    num1 db ?
    num2 db ?
    num3 db ?
    msg1 db 'Masukkan Angka 3 Digit: $'
    msg2 db 0dh, 0ah, 'Angka Palindrom $'
    msg3 db 0dh,0ah, 'Bukan Angka Palindrom $' 
    
.code             

main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num1, al
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num2, al
    
    mov ah, 01h
    int 21h
    sub al, '0'
    mov num3, al
    
    mov ax, 0
    
    mov bh, num1
    mov bl, num3
    cmp bh, bl
    je equal
       
not_equal:
    lea dx, msg3
    mov ah, 09h
    int 21h
    jmp end_program
    
equal:
    lea dx, msg2
    mov ah, 09h    
    int 21h 
    
end_program:
    mov ah, 4ch
    int 21h
            
end main