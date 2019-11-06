; MASM Experiment2_1
; SEGMENT Experiments

DSEG SEGMENT
    ORG  1000H
    AR1  DB 20 DUP (?)
    ORG  2000H
    AR2  DB 20 DUP (?)
DSEG ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DSEG, ES:DSEG
START:
    MOV  AX, DSEG
    MOV  DS, AX
    MOV  ES, AX
    
    ; PART 1
    CLD
    MOV  DI, 1000H
    MOV  AX, 55AAH ; 55H = 'U' AAH = ''
    MOV  CX, 0010H
    REP  STOSW

    ; PART 2
    MOV  SI, 1000H
    MOV  DI, 2000H
    MOV  CX, 0020H
    REP  MOVSB

    ; PART 3
    MOV  SI, 1000H
    MOV  DI, 2000H
    MOV  CX, 0010H
    REPZ CMPSW
    
CODE ENDS
END START