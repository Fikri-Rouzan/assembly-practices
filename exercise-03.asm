.model small
.stack 100h

.data

    value dw 7862
    num1 dw 1
    result dw ?
    msg1 dw 'Hasil: $'
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 0
    mov ax, value
    mov bx, num1
    sub ax, bx
    add ax, bx
    mul bx
    mov result, ax
    
    mov ax, 0
    
    lea dx, msg1
    mov ah, 09h
    int 21h
    
    call print_num
    
    mov ah, 4ch
    int 21h    
    
print_num proc
    mov cx, 0
    mov bx, 10
    mov ax, result

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

print_num endp

end main
