; 完整格式1操作练习
; 程序的功能：显示10行HELLO
DATA    SEGMENT
MESG    DB 'HELLO',0AH,0DH,'$'
DATA    ENDS
STACK   SEGMENT PARA STACK 'STACK'
        DB  100 DUP('$')
STACK   ENDS
CODE    SEGMENT
        ASSUME CS:CODE,DS:DATA,SS:STACK
BEG:    MOV    AX,STACK
        MOV    SS,AX
        MOV    SP,100
        MOV    AX,DATA
        MOV    DS,AX
        MOV    CX,10 ; 循环10次。每次循环CX-=1，直到CX=0
LAST:   MOV    AH,9 ; 输出字符串，以$结尾
        MOV    DX,OFFSET MESG
        INT    21H
        LOOP   LAST
        MOV    AH,4CH
        INT    21H
CODE    ENDS
END BEG