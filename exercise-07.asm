.model small
.stack 100h

.data 

    msg1 db 'Masukkan Nilai N (0-9): $'
    msg2 db 10, 13, 'Hasil Jumlah Deret: $'
    newline db 0dh, 0ah, '$'
    result dw ?  

.code

main:
    mov ax, @data
    mov ds, ax
 
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h  
    mov bl, al  
    
    mov ax, 0  
    mov cl, 0    

loop_sum:
    add cl, 1   
    add ax, cx   
    cmp cl, bl  
    jnz loop_sum 

    mov result, ax

    lea dx, newline
    mov ah, 09h
    int 21h

displays_results:
    lea dx, msg2
    mov ah, 09h
    int 21h
    
    mov ah, 0            
    mov al, byte ptr result  
    aam                  
    
    mov bx, ax           
    
tens_digit:
    mov dl, bh           
    add dl, 30h         
    mov ah, 02h          
    int 21h             
    
unit_digit:
    mov dl, bl          
    add dl, 30h         
    mov ah, 02h         
    int 21h              

out_program:
    mov ah, 4Ch
    int 21h

end main