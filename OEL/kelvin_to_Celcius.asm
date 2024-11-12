include 'emu8086.inc'
org 100h

.DATA
    C DW ?    ; Variable to store Celsius temperature
    K DW ?    ; Variable to store Kelvin temperature

.CODE
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

MAIN PROC
    ; Prompt the user to enter temperature in Kelvin
    print "Enter temperature in Kelvin: "
    call scan_num         ; Call subroutine to scan the input number
    MOV K, CX            ; Store the Kelvin value in K

    ; Convert Kelvin to Celsius using the formula: C = K - 273
    MOV AX, K            ; Move Kelvin value to AX
    SUB AX, 273          ; Subtract 273 to convert to Celsius
    MOV C, AX            ; Store the Celsius value in C

    ; Print the Kelvin temperature
    printn ""
    print "Temperature in Kelvin: "
    MOV AX, K            ; Move Kelvin value to AX for printing
    call print_num       ; Call subroutine to print the number

    ; Print the Celsius temperature
    printn ""
    print "Temperature in Celsius: "
    MOV AX, C            ; Move Celsius value to AX for printing
    call print_num       ; Call subroutine to print the number

    ; Exit the program
    mov ax, 4c00h        ; Function to exit the program
    int 21h              ; Interrupt to terminate the program

    ret                   ; Return from the main procedure
MAIN ENDP

DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM
DEFINE_SCAN_NUM
END
