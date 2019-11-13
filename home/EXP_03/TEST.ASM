DSEG SEGMENT
    DB 0
DSEG ENDS

SSEG SEGMENT
    DB 0
SSEG ENDS

CODE SEGMENT
    ASSUME cs:CODE, ds:DSEG, es:DSEG, ss:SSEG
START:
    mov  ax, DSEG
    mov  ds, ax
    mov  es, ax
    mov  ax, SSEG
    mov  ss, ax
    xor  ax, ax
    mov  sp,  0000H
    mov  bp, 0FFFFH

    mov  ax, 0FFF0H
    mov  dx, 0FFFFH
    mov  cx, 5
    idiv cx

    mov  ax, 4C00H
    int  21H
CODE ENDS
END START