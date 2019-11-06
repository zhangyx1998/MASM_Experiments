; MASM HelloWorld Experiment
; By Yuxuan Zhang

DSEG SEGMENT
    DATA DB "HelloWorld!","$";
DSEG ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DSEG, ES:DSEG
START:
    MOV  AX, DSEG
    MOV  DS, AX
    MOV  ES, AX

    LEA  DX, DATA
    MOV  AH, 09H
    INT  21H
EXIT:
    MOV  AH, 4CH
    MOV  AL, 0
    INT  21H
CODE ENDS
END START
