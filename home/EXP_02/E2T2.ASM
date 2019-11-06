; MASM Experiment2_2
; SEGMENT Experiments

DSEG SEGMENT
    ORG  1000H
         DB "This is a string"
DSEG ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DSEG, ES:DSEG
START:
    MOV  AX, DSEG
    MOV  DS, AX
    MOV  ES, AX
    
    ; Main Part Starts
    MOV  SI, 100FH
    MOV  DI, 2000H
    MOV  CX, 0010H
L1:
    MOV  AX  ,  [SI]
    MOV  [DI],  AX
    INC  DI
    DEC  SI
    LOOP L1

FINAL:
    MOV  [DI],BYTE PTR "$"
    MOV  DX, 2000H
    MOV  AH, 09H
    INT  21H
    MOV  AH, 4CH
    INT  21H
CODE ENDS
END START