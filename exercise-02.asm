.model small
.stack 100h 

.data

    msg1 db 'Masukkan Sebuah Nilai ( 0 - 9 ) : $'
    msg2 db 'Hasil : $'
    newline db 0Dh, 0Ah, '$'

.code 

    mov ax, @data
    mov ds, ax 
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    
receive_input1:
    mov ah, 01h
    int 21h
    mov ah, 0
    mov dx, ax
    push dx
    
receive_input2:
    mov ah, 01h
    int 21h
    mov ah, 0
    mov dx, ax
    push dx 
    
display_messages:
    lea dx, newline
    mov ah, 09h
    int 21h
    
    lea dx, msg2
    mov ah, 09h
    int 21h
    
out_stack:
    pop dx
    mov ah, 02h
    int 21h
    
    pop dx
    mov ah, 02h
    int 21h

end:
    mov ah, 4Ch
    int 21h