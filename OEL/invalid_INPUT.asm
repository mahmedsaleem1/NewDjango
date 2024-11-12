include 'emu8086.inc'

.model small
.stack 100h

.DATA
    num db 0          ; Store the accumulated number (result of user input)
    temp db 0         ; Temporary variable to store the current digit

.CODE
    ; Initialize data segment
    mov ax, @DATA
    mov DS, AX

_MainProc PROC
    ; Prompt user to enter a number
    printn "Enter Number: "

input:
    ; Read character input from user
    mov ah, 01h
    int 21h
    
    ; Check if Enter key (carriage return) is pressed
    cmp al, 13
    je output            ; Jump to output if Enter key is pressed
    
    ; Check if input is a valid digit
    cmp al, 48           ; Compare with ASCII for '0'
    jl lesser            ; Jump if input is less than '0' (invalid digit)
    cmp al, 57           ; Compare with ASCII for '9'
    jg greater           ; Jump if input is greater than '9' (invalid digit)

    ; Convert ASCII to numeric value and accumulate the number
    mov temp, al
    sub temp, 48         ; Convert ASCII digit to numeric value (0-9)
    mov al, num
    mov bl, 10           ; Multiply current num by 10 (shift left by one decimal place)
    mul bl
    add al, temp         ; Add the new digit to the current number
    mov num, al          ; Store the updated number
    
    ; Go back to input for next digit
    jmp input

greater:
    printn ""
    printn "Enter valid digit"
    jmp input            ; Loop back to input if invalid digit is entered

lesser:
    printn ""
    printn "Enter valid digit"
    jmp input            ; Loop back to input if invalid digit is entered

output:
    ; Print new line (carriage return and line feed)
    mov ah, 02h
    mov dl, 10           ; Line feed
    int 21h
    mov dl, 13           ; Carriage return
    int 21h

    ; Display the result
    mov ax, 0            ; Clear AX register
    mov al, num          ; Load the accumulated number into AL
    print "The multidigit number is: "
    call print_num       ; Print the number

    ; Exit the program
    mov ax, 4c00h
    int 21h

    ret
_MainProc ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END
