; Include Emu8086 library for input/output operations
include 'emu8086.inc'

; Define the memory model (small) and stack size (100h)
.model small
.stack 100h

; Start of the code segment
.CODE

; Define the main procedure
_MainProc PROC

    ; Prompt the user to enter the first number
    print 'Enter first number:'

    ; Read a character from the keyboard (first number)
    mov ah, 01h       ; AH = 01h, function to read a character from keyboard
    int 21h           ; Call interrupt 21h to read input
    ; The input character is now in the AL register

    ; Convert ASCII to numeric value (0-9)
    sub al, 48        ; Subtract ASCII value of '0' (48) to get the numeric value
    mov bl, al        ; Store the first number in BL register for later addition

    ; Print a newline character
    mov dl, 10        ; Newline ASCII code
    mov ah, 02h       ; AH = 02h, function to output a character
    int 21h           ; Print newline

    ; Print a carriage return
    mov dl, 13        ; Carriage return ASCII code
    mov ah, 02h
    int 21h           ; Print carriage return

    ; Prompt the user to enter the second number
    print 'Enter second number:'

    ; Read the second number from the keyboard
    mov ah, 01h       ; AH = 01h, function to read a character from keyboard
    int 21h           ; Call interrupt 21h to read input
    ; The input character is now in the AL register

    ; Convert ASCII to numeric value (0-9)
    sub al, 48        ; Subtract ASCII value of '0' (48) to get the numeric value

    ; Add the second number to the first number stored in BL
    add bl, al        ; Add the two numbers

    ; Convert numeric result back to ASCII for display
    add bl, 48        ; Add ASCII value of '0' (48) to convert to ASCII

    ; Print a newline character
    mov dl, 10        ; Newline ASCII code
    mov ah, 02h
    int 21h           ; Print newline

    ; Print a carriage return
    mov dl, 13        ; Carriage return ASCII code
    mov ah, 02h
    int 21h           ; Print carriage return

    ; Display the result message
    print 'Your sum is:'

    ; Print the sum (stored in BL register)
    mov dl, bl        ; Move the sum (in ASCII) to DL
    mov ah, 02h       ; AH = 02h, function to output a character
    int 21h           ; Print the sum

; End of the main procedure
_MainProc ENDP

; End of the program
END
