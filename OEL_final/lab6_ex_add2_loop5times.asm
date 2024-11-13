; Set starting address for .COM programs
ORG 100h

; Code Segment Declaration
.CODE
    MOV AX, @DATA       ; Set up the data segment
    MOV DS, AX

MAIN PROC
    MOV CX, 5           ; Set the loop counter (CX) to 5 for five iterations
    MOV AX, 0           ; Initialize AX to 0

welcome:                ; Label for the loop start
    ADD AX, 2           ; Add 2 to AX in each iteration
    LOOP welcome        ; Decrement CX and repeat loop until CX = 0

    HLT                 ; Halt the program after the loop completes

MAIN ENDP
END MAIN
RET                     ; Return to the operating system
