.model small
.stack 100h

.data

    msg1 db "Masukan N: $"
    num1 db 0dh, 0ah, "Anda Menekan angka 1 $" 
    num2 db 0dh, 0ah, "Anda Menekan angka 2 $"  
    num345 db 0dh, 0ah, "Anda menekan angka 3, 4, atau 5 $"
    no db 0dh, 0ah, "Input Tidak Dikenali $"
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    
input:
    mov ah, 01h
    int 21h
    sub al, 30h

check:
    cmp al, 1
    je print1
             
    cmp al, 2
    je print2
    
    cmp al, 5
    jle print345
    
    jmp printno
             
print1:
    lea dx, num1
    mov ah, 09h
    int 21h
    jmp end 
    
print2:
    lea dx, num2
    mov ah, 09h
    int 21h
    jmp end 

print345:
    lea dx, num345
    mov ah, 09h
    int 21h
    jmp end
    
printno:
    lea dx, no
    mov ah, 09h
    int 21h
    jmp end    
    
end:
    mov ah, 4ch
    int 21h
            
end main                     