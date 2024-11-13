include 'emu8086.inc'

.model small
.stack 100h

.DATA
    num1 db ?            ; Variable to store the dividend
    num2 db ?            ; Variable to store the divisor
    quotient db ?        ; Variable to store the quotient
    remainder db ?       ; Variable to store the remainder

.CODE
    ; Initialize data segment
    mov ax, @DATA
    mov DS, AX

_MainProc PROC
    ; Prompt for and input the dividend
    print "Enter Dividend: "
    call scan_num             ; Read the dividend into CX
    printn ""                 ; New line
    mov num1, cl              ; Store the dividend in num1

    ; Prompt for and input the divisor
    print "Enter Divisor: "
    call scan_num             ; Read the divisor into CX
    printn ""                 ; New line
    mov num2, cl              ; Store the divisor in num2

    ; Perform division: quotient = num1 / num2, remainder = num1 % num2
    mov ax, 0                 ; Clear AX
    mov al, num1              ; Load dividend into AL
    div num2                  ; Divide AX by num2, result in AL and AH
    mov quotient, al          ; Store quotient in quotient
    mov remainder, ah         ; Store remainder in remainder

    ; Display the quotient
    print "Quotient: "
    mov ax, 0
    mov al, quotient
    call print_num
    printn ""                 ; New line

    ; Display the remainder
    print "Remainder: "
    mov ax, 0
    mov al, remainder
    call print_num

    ; Exit program
    mov ax, 4c00h
    int 21h

    ret
_MainProc ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END
