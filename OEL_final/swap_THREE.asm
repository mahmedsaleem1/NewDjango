include 'emu8086.inc'
org 100h

.DATA
    A DB ?          ; Declare variable A
    B DB ?          ; Declare variable B
    C DB ?          ; Declare variable C

.CODE
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

MAIN PROC
    ; Prompt for and input value for A
    print "A: "
    MOV AH, 01h         ; Read a character from keyboard
    int 21h
    MOV A, AL           ; Store input in variable A
    MOV AH, 02h         ; Output newline (CR)
    MOV DL, 10
    int 21h
    MOV DL, 13
    int 21h

    ; Prompt for and input value for B
    print "B: "
    MOV AH, 01h         ; Read a character from keyboard
    int 21h
    MOV B, AL           ; Store input in variable B
    MOV AH, 02h         ; Output newline (CR)
    MOV DL, 10
    int 21h
    MOV DL, 13
    int 21h

    ; Prompt for and input value for C
    print "C: "
    MOV AH, 01h         ; Read a character from keyboard
    int 21h
    MOV C, AL           ; Store input in variable C
    MOV AH, 02h         ; Output newline (CR)
    MOV DL, 10
    int 21h
    MOV DL, 13
    int 21h

    ; Swap A, B, and C using XCHG
    MOV BL, A           ; Copy A to BL
    MOV BH, B           ; Copy B to BH
    MOV CL, C           ; Copy C to CL
    XCHG BL, BH         ; Swap A and B
    XCHG BH, CL         ; Swap B and C
    MOV A, BL           ; Store new A
    MOV B, BH           ; Store new B
    MOV C, CL           ; Store new C

    ; Output "After Swapping"
    printn "After Swapping"
    
    ; Output the values of A, B, and C after swapping
    print "A = "
    MOV DL, A
    MOV AH, 02h
    int 21h
    MOV DL, 10
    int 21h
    MOV DL, 13
    int 21h

    print "B = "
    MOV DL, B
    int 21h
    MOV DL, 10
    int 21h
    MOV DL, 13
    int 21h

    print "C = "
    MOV DL, C
    int 21h
    MOV DL, 10
    int 21h
    MOV DL, 13
    int 21h

    ; Exit program
    MOV AX, 4C00h
    int 21h

    ret
MAIN ENDP
