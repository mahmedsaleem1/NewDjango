include 'emu8086.inc'
org 100h

.DATA
    ; Data section is not needed in this code since we are directly using registers.

.CODE
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

MAIN PROC
    ; Prompt user to enter 4 characters
    printn "Enter 4 characters" 
    
    ; Read first character and store in BH
    MOV AH, 01h         ; Function to read a single character from input
    int 21h
    MOV BH, AL          ; Store first character in BH

    ; Read second character and store in BL
    MOV AH, 01h
    int 21h
    MOV BL, AL          ; Store second character in BL

    ; Read third character and store in CH
    MOV AH, 01h
    int 21h
    MOV CH, AL          ; Store third character in CH

    ; Read fourth character and store in CL
    MOV AH, 01h
    int 21h
    MOV CL, AL          ; Store fourth character in CL

    ; Print new line (CRLF) after input
    MOV AH, 02h         ; Function to print a character
    MOV DL, 10          ; ASCII for line feed (LF)
    int 21h
    MOV DL, 13          ; ASCII for carriage return (CR)
    int 21h

    ; Display message: "Printing in Reverse Order"
    printn "Printing in Reverse Order"

    ; Print characters in reverse order
    MOV AH, 02h         ; Function to print a character
    MOV DL, CL          ; First print the 4th character (CL)
    int 21h
    MOV DL, CH          ; Then print the 3rd character (CH)
    int 21h
    MOV DL, BL          ; Then print the 2nd character (BL)
    int 21h
    MOV DL, BH          ; Finally, print the 1st character (BH)
    int 21h

    ; Exit the program
    mov ax, 4c00h       ; Exit program function
    int 21h

    ret
MAIN ENDP
