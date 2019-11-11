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
    MOV CX, 0

    LEA DI, STR
    CMP CX,CX
    REPNE SCASB

    LEA DI, STR
    CMP CX,1
    REPNE SCASB

EXIT:
    MOV  AH, 4CH
    MOV  AL, 0
    INT  21H
CODE ENDS
END START
