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
    ; Prompt the user to enter temperature in Fahrenheit
    print "Enter temperature in Fahrenheit: "
    call scan_num          ; Call subroutine to scan number input
    MOV F, CX             ; Store the Fahrenheit value in F

    ; Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5 / 9
    MOV AX, F             ; Move Fahrenheit value to AX
    SUB AX, 32            ; Subtract 32 from Fahrenheit
    MOV BX, 5             ; Load 5 into BX (for the multiplication part)
    MUL BX                ; AX = (F - 32) * 5
    MOV BX, 9             ; Load 9 into BX (for the division part)
    DIV BX                ; AX = ((F - 32) * 5) / 9

    MOV C, AX             ; Store the Celsius value in C

    ; Print the Fahrenheit temperature
    printn ""
    print "Temperature in Fahrenheit: "
    MOV AX, F             ; Move Fahrenheit value to AX for printing
    call print_num        ; Call subroutine to print the number

    ; Print the Celsius temperature
    printn ""
    print "Temperature in Celsius: "
    MOV AX, C             ; Move Celsius value to AX for printing
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
