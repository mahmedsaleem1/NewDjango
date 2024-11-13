include 'emu8086.inc'
org 100h

.DATA
    C DW ?         ; Variable to store Celsius temperature
    F DW ?         ; Variable to store Fahrenheit temperature

.CODE
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

MAIN PROC
    ; Prompt the user to enter temperature in Celsius
    print "Enter temperature in Celsius: "
    call scan_num          ; Call subroutine to scan number input
    MOV C, CX             ; Store the Celsius value in C

    ; Convert Celsius to Fahrenheit using the formula: F = (C * 9/5) + 32
    MOV AX, C             ; Move Celsius value to AX
    MOV BX, 9             ; Load 9 into BX (for the multiplication part)
    MUL BX                ; AX = C * 9 (multiply by 9)
    MOV BX, 5             ; Load 5 into BX (for the division part)
    DIV BX                ; AX = (C * 9) / 5 (divide by 5)
    ADD AX, 32            ; Add 32 to the result to get Fahrenheit

    MOV F, AX             ; Store the Fahrenheit value in F

    ; Print the Celsius temperature
    printn ""
    print "Temperature in Celsius: "
    MOV AX, C             ; Move Celsius value to AX for printing
    call print_num        ; Call subroutine to print the number

    ; Print the Fahrenheit temperature
    printn ""
    print "Temperature in Fahrenheit: "
    MOV AX, F             ; Move Fahrenheit value to AX for printing
    call print_num        ; Call subroutine to print the number

    ; Exit the program
    mov ax, 4c00h         ; Function to exit the program
    int 21h               ; Interrupt to terminate the program

    ret                    ; Return from the main procedure
MAIN ENDP

DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM
DEFINE_SCAN_NUM
END
