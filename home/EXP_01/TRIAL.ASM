; MASM REP/LOOP Difference Experiment
; By Yuxuan Zhang

DSEG SEGMENT
    STR DB "HelloWorld!","$" ; Length: 11
DSEG ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DSEG, ES:DSEG
START:
    MOV AX, DSEG
    MOV DS, AX
    MOV ES, AX

    MOV AL, "$"
    MOV CX, 0FFFFH
    LEA DI, STR
APPR1:
    REPNE SCASB
    JMP NEXT
APPR2:
    DEC CX
    JZ NEXT
    INC DI
    JNE APPR2
NEXT:
    MOV AX, 0FFFFH
    SUB AX, CX
    MOV CX, AX
EXIT:
    MOV  AH, 4CH
    MOV  AL, 0
    INT  21H
CODE ENDS
END START
