; ������ʽ1������ϰ
; ����Ĺ��ܣ���ʾ10��HELLO
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
        MOV    CX,10 ; ѭ��10�Ρ�ÿ��ѭ��CX-=1��ֱ��CX=0
LAST:   MOV    AH,9 ; ����ַ�������$��β
        MOV    DX,OFFSET MESG
        INT    21H
        LOOP   LAST
        MOV    AH,4CH
        INT    21H
CODE    ENDS
END BEG