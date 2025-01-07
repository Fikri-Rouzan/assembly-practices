.model small 
.stack 100h

.data

    msg1 db "Masukan Nilai N: $"    
    msg2 db 0dh, 0ah, "Hasilnya: $" 
    newline db 0dh, 0ah, "$"
    result db ?
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
displays_messages:
    lea dx, msg1
    mov ah, 09h
    int 21h
    
input:
    mov ah, 01h
    int 21h
    sub al, 30h

n_multiply3:
    mov bl, 3
    mul bl
    mov result, al
    
two_plus_five:
    mov ah, 5
    mov al, 2
    add ah, al
    
n_multiply3_plus_two_plus_five:
    mov al, result
    add ah, al
    mov al, 0
    mov al, ah     
    
aam_n:
    aam
    mov bh, ah
    mov bl, al 

ascii_conversion:    
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    add bh, 30h
    add bl, 30h
    
print:
    mov dl, bh
    mov ah, 02h
    int 21h
    
    mov dl, bl
    mov ah, 02h
    int 21h
    
    mov ah, 4ch
    int 21h            
      
end main