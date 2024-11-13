include 'emu8086.inc'
ORG 100h

.DATA
    num DW 0            ; Variable to store the result (initially 0)
    num1Neg DB 0        ; Flag to check if the first number is negative
    num2Neg DB 0        ; Flag to check if the second number is negative
    resultSign DB 0     ; Variable to store the final sign of the result (positive or negative)

.CODE
    MOV AX, @DATA       ; Initialize the data segment
    MOV DS, AX

MAIN PROC
    ; Prompt for the first number
    print "Enter First Number: "
    call scan_num       ; Get the first number (input stored in CX)
    MOV BX, CX          ; Store the first number in BX for manipulation

    CMP BX, 0           ; Compare BX with 0 to check if it's negative
    JNS num1Positive    ; If BX is non-negative, jump to num1Positive
    MOV num1Neg, 1      ; Set flag to indicate first number is negative
    NEG BX              ; Make BX positive (take the absolute value)
num1Positive:

    ; Prompt for the second number
    printn ""
    print "Enter Second Number: "
    call scan_num       ; Get the second number (input stored in CX)
    MOV DX, CX          ; Store the second number in DX for manipulation

    CMP DX, 0           ; Compare DX with 0 to check if it's negative
    JNS num2Positive    ; If DX is non-negative, jump to num2Positive
    MOV num2Neg, 1      ; Set flag to indicate second number is negative
    NEG DX              ; Make DX positive (take the absolute value)
num2Positive:

    ; Initialize result to zero
    MOV num, 0

    ; If either number is zero, the result is zero
    MOV CX, BX          ; Copy BX to CX for outer loop iteration
    CMP CX, 0
    JE finish           ; If BX (the first number) is zero, exit

outerLoop:
    MOV CX, DX          ; Copy DX (the second number) to CX for inner loop
    CMP CX, 0
    JE finish           ; If DX (the second number) is zero, exit

innerLoop:
    MOV AL, num2Neg     ; Load the flag for the second number's sign
    CMP num1Neg, AL     ; Compare first number's sign with second number's sign
    JE sameSign         ; If signs are the same, jump to sameSign

    DEC num             ; Decrease result for different signs
    LOOP innerLoop      ; Decrement CX and repeat if CX != 0
    CMP CX, 0
    JE innerLoopFinished
sameSign:
    INC num             ; Increase result for same signs
    LOOP innerLoop      ; Decrement CX and repeat if CX != 0

innerLoopFinished:
    MOV CX, BX          ; Copy BX to CX for outer loop iteration
    DEC BX              ; Decrement BX (number of iterations for the outer loop)
    LOOP outerLoop      ; Repeat outer loop if BX != 0

finish:
    ; Determine the sign of the result
    MOV AL, num1Neg     ; Load the flag for the first number's sign
    MOV BL, num2Neg     ; Load the flag for the second number's sign
    XOR AL, BL          ; XOR the signs to get the result sign (0 for positive, 1 for negative)
    MOV resultSign, AL  ; Store the result sign

    ; If the result sign is negative, convert the result to negative
    CMP resultSign, 1
    JZ makeResultNegative
    JMP printResult

makeResultNegative:
    NEG num             ; Make the result negative if the sign is negative

printResult:
    MOV AX, num         ; Load the result into AX for printing
    print "Result = "
    call print_num      ; Print the result

    HLT                 ; Halt the program

MAIN ENDP

DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM
DEFINE_SCAN_NUM
END
