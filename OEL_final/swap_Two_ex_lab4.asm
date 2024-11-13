org 100h

.DATA
    A DB ?     ; Variable A to store first input
    B DB ?     ; Variable B to store second input

.CODE
main PROC
    ; Setup Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Input First Variable
    MOV AH, 1          ; Read a character
    INT 21h            ; Wait for user input
    MOV A, AL          ; Store input in A

    ; Input Second Variable
    MOV AH, 1
    INT 21h
    MOV B, AL          ; Store input in B

    ; Swap Variables
    MOV BL, A
    MOV CL, B
    XCHG BL, CL        ; Swap BL and CL

    ; Output Swapped Variables
    MOV AH, 2
    MOV DL, BL
    INT 21h            ; Print new value of A

    MOV DL, CL
    INT 21h            ; Print new value of B

    ret
main ENDP
