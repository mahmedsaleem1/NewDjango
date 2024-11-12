include 'emu8086.inc'

.model small
.stack 100h

.CODE
_MainProc PROC
    ; Prompt and input the first number
    print 'Enter first number:'
    call scan_num            ; Scan first number and store in CX
    mov bx, cx               ; Move the first number to BX for storage

    ; Print new line
    mov dl, 10               ; Line Feed (LF)
    mov ah, 02h
    int 21h
    mov dl, 13               ; Carriage Return (CR)
    mov ah, 02h
    int 21h

    ; Prompt and input the second number
    print 'Enter second number:'
    call scan_num            ; Scan second number and store in CX
    add bx, cx               ; Add the second number to BX (holding first number)

    ; Print new line
    mov dl, 10               ; Line Feed (LF)
    mov ah, 02h
    int 21h
    mov dl, 13               ; Carriage Return (CR)
    mov ah, 02h
    int 21h

    ; Display the sum
    print 'Your sum is:'
    mov ax, bx               ; Move the sum from BX to AX for printing
    call print_num           ; Print the sum

    ; Exit program
    mov ax, 4c00h
    int 21h

    ret
_MainProc ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END
