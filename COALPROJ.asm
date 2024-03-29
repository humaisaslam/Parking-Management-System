                           
.model small
.stack 100h
.data
menu db '*****************MENU*********************$'
menu1 db 'Press 1 for rikshw$'
menu2 db 'Press 2 for cars$'
menu3 db 'Press 3 for bus$'
menu4 db 'Press 4 to show the record$'
menu5 db 'Press 5 to delete the record$'
menu6 db 'Press 6 to exit$'
msg1 db 'Parking Is Full$'
msg2 db 'Wrong input$'
msg3 db 'car$'
msg4 db 'bus$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount is=$'
msg8 db 'the total numbers of vehicles parked=$'
msg9 db 'the total number of rikshws parked=$'
msg10 db 'the total number of cars parked=$'
msg11 db 'the total number of buses parked=$'
msg12 db '***Record deleted successfully***$'
amount dw 0  ;initialization
count dw  '0' ;initialization



r dw '0'         ;initialization
c db '0'         ;initialization
b db '0'          ;initialization
.code
main proc
mov ax,@data   ; imports the address of data section
mov ds,ax      ; moves data address to access variables



while_:   ;Label or Loop 
             
mov dx,10     ;New line
mov ah,2      ;Showing output
int 21h       
mov dx,13    ;Carriage return
mov ah,2
int 21h


mov dx,offset menu  ;msg" is likely the address of a memory location where a message or data is stored,
                    ; and the instruction is moving that memory address into the DX register. 

mov ah,9            ; service routine to print string
int 21h

mov dx,10           ;New line
mov ah,2            ;Showing output
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu1  ; Same like menu 
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu3
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu4
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h



mov dx,offset menu5
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset menu6
mov ah,9
int 21h
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h




  ;userinput

mov ah,1          ;used to get input from user
int 21h
mov bl,al          ; store value of al to bl which we take from user
mov dx,10          ; new line
mov ah,2             ;output
int 21h
mov dx,13           ;carrige return
mov ah,2
int 21h

                      ;now compare
mov al,bl
cmp al,'1'            ;compare with user input if user enter 1 program will jump to rikshw label
je rikshw
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_         ; if user enter 6 program will terminated

                        ;wrong input
mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_             ; if user input greater than 6 program will jump to while label which we decleare in starting

rikshw:
call rikshaw            ; this statment call to rikshaw main proc


car:
call caar


rec:
call recrd


del:
call delt


bus:
call buss



end_:
mov ah,4ch ; structure of program
int 21h

main endp





rikshaw proc
cmp count,'8'                       ;"cmp count,'8'" instruction is comparing the value stored in the count memory location with the ASCII code of the character '8'.

jle rikshw1                          ;"jle rikshw1" instruction is a conditional jump instruction, which will transfer control to the label "rikshw1"
                                    ;if the result of the comparison is less than or equal to zero.

mov dx,offset msg1
mov ah,9                             ;string output
int 21h
jmp while_
jmp end_

rikshw1:
mov ax,200                        ; instruction is moving the value 200 into the AX register.
add amount, ax                     ; adding the value in the AX register (200) to the value stored at the memory location "amount".
mov dx,0                          ; remainder is 0
mov bx,10 
mov cx,0  ;loop
l2:
        div bx                 ;instruction is performing an integer division of the value in the DX:AX register 
                             ;by the value in the BX register, storing the result in the AX register and the remainder in the DX register.

        push dx             ; instruction is pushing the value in the DX register onto the stack.
        mov dx,0 
        mov ah,0
        inc cx                 ;instruction is incrementing the value in the CX register by 1.
        cmp ax,0                ; instruction is comparing the value in the AX register with 0.
        jne l2                ;transfer control to the label "l2" if the result of the comparison is not equal to zero.
                               ; This loop will continue till the value in AX become zero.
    
l3:
        pop dx                  ;instruction is popping the value from the stack into the DX register
        add dx,48
        mov ah,2
        int 21h
loop l3                       ;loop l3 is decrementing the CX register by 1 and jumping to the label "l3" if the value in CX is not zero.

inc count                   ;instruction is incrementing the value stored at the memory location "count" 

inc r                         ; instruction is incrementing the value stored at the memory location "r" by 1.

jmp while_
jmp end_


caar proc
cmp count,'8'                ;compares the value of the "count" register with the character '8'.
jle car1                        ;jumps to the label car1 if the value in the count register is less than or equal to the character '8'
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

car1:    
                      ;{ At "car1", it sets "ax" to 300, add amount register and 300,
mov ax,300              ; later it sets dx to 0 and bx to 10, and cx to 0 
add amount, ax          ;and starts a loop for digit extraction.}
mov dx,0
mov bx,10
mov cx,0                      ;loop
l22:
        div bx           ;divides AX by BX and stores result in AX and remainder in DX
        push dx         ;pushes DX register on the stack
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0       ;it checks if AX is zero or not, if it not zero it jumps to l22
       jne l22
   
l33:
        pop dx        ;pop stack
        add dx,48     ;adds 48 to the popped value
        mov ah,2     
        int 21h         ;triggers another software interrupt
loop l33
inc count                 ; it increments count and c register and jumps back to while_ and then to end_
inc c
jmp while_
jmp end_


; All procedures are same 

buss proc
cmp count,'8'
jle bus1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

bus1:
mov ax,400
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l222:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l222
   
l333:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l333
inc count
inc b
jmp while_
jmp end_

;Total Amount
recrd proc                ;show record 
mov dx,offset msg7
mov ah,9
int 21h                               
mov ax, amount               ; print here the whole amount
mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
     
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h






;Total no of Vehicle parked
mov dx,offset msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


mov dx,offset msg9
mov ah,9
int 21h

mov dx,r
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


;Total no of Rick park
mov dx,offset msg10
mov ah,9
int 21h


mov dl,c  ; variable thar we initilize 0 at the start
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h


;Total no of car park
mov dx,offset msg11
mov ah,9
int 21h

mov dl,b
mov ah,2
int 21h

jmp while_
jmp end_

                       ;delete
delt proc          
mov r,'0'               ; deleting record
mov c,'0'
mov b,'0'
mov amount,0   

mov count,'0'
                             ;Record Delete sucessfully
mov dx,offset msg12
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_
jmp end_
end main