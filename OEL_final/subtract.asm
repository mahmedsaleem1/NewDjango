include 'emu8086.inc'

.model small
.stack 100h

.DATA
    num1 dw ?            ; Variable to store the first number
    num2 dw ?            ; Variable to store the second number
    result dw ?          ; Variable to store the result of subtraction

.CODE
    mov ax, @DATA        ; Initialize data segment
    mov DS, AX

_MainProc PROC
    ; Input the first number
    print "Enter First Number: "
    call scan_num            ; Scan the first number and store in CX
    printn ""                ; New line
    mov num1, cx             ; Store the first number in num1

    ; Input the second number
    print "Enter Second Number: "
    call scan_num            ; Scan the second number and store in CX
    printn ""                ; New line
    mov num2, cx             ; Store the second number in num2

    ; Perform subtraction: result = num1 - num2
    mov ax, num1
    sub ax, num2
    mov result, ax           ; Store the result in result

    ; Display the result
    print "Result: "
    call print_num           ; Print the result

    ; Exit program
    mov ax, 4c00h
    int 21h

    ret
_MainProc ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END
