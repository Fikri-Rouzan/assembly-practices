.model small
.stack 100h

.data 

    num1 dw 100
    num2 dw 150
    result dw ?
    msg dw "Hasil: $" 

.code 

main proc
    mov ax, @data      
    mov ds, ax         
   
    mov ax, num1        
    add ax, num2        
    mov result, ax      
  
    lea dx, msg         
    mov ah, 09h        
    int 21h             
  
    mov ax, result      
    call print_number  
   
    mov ax, 4Ch        
    int 21h            

print_number proc   
    mov cx, 0          
    mov bx, 10          

convert_loop:
    mov dx, 0           
    div bx             
    push dx            
    inc cx             
    cmp ax, 0          
    jne convert_loop    

print_digits:
    pop dx             
    add dl, '0'         
    mov ah, 02h         
    int 21h            
    loop print_digits   
    ret
    
print_number endp

end main