;2����֧�������--����Y��ֵ
;Y=1(X>0);Y=0(X=0);Y=-1(X<0)
.MODEL SMALL
.DATA
Y   DB   0
.CODE
.STARTUP
        LEA    BX,Y
        CALL   READ ; ��ȡ����������ֵ����������AX��
        CMP    AX,0
        JZ     ZERO
        JL     NEGTIVE
        MOV    AX,1
        JMP    ZERO
        
NEGTIVE:MOV    AX,-1

ZERO:   MOV   [BX],AX

.EXIT   0

READ    PROC
        PUSH   BX
        PUSH   CX
        PUSH   DX ; �����ӳ��򣬱����Ĵ�����ԭ�е�ֵ��ѹ��ջ��
        XOR    BX,BX ; �Ĵ�������
        XOR    CX,CX
        MOV    AH,1
        INT    21H
        CMP    AL,'+' ; �жϷ���λ
        JZ     READ1
        CMP    AL,'-'
        JNZ    READ2  ; ��û�з���λֱ����תREAD2��Ϊ������ȡ��������	
        MOV    CX,-1  ; CX��READ�ӳ����д������
READ1:	MOV    AH,1
        INT    21H
READ2:  CMP    AL,'0'
        JB     READ3
        CMP    AL,'9'
        JA     READ3  ; ����ȡ�ַ�������0~9��������Ķ���
        SUB    AL,30H ; ASCII��תΪ��ʵ�Ķ�����
        SHL    BX,1
        MOV    DX,BX
        SHL    BX,1
        SHL    BX,1
        ADD    BX,DX  ; �൱��BX = 10 * BX��ÿ��ȡһ����֮ǰ����Ҫ����10
        MOV    AH,0
        ADD    BX,AX
        JMP    READ1
READ3:  CMP    CX,0  ; ����ǰ�Է��Ž��д���
        JZ     READ4
        NEG    BX
READ4:  MOV    AX,BX ; AX�����ӳ���Ľ��
        POP    DX
        POP    CX
        POP    BX    ; ��ջ�������ָ��Ĵ���
        RET
READ    ENDP
DPCRLF  PROC
        MOV    DL,0DH
        MOV    AH,02
        INT    21H
        MOV    DL,0AH
        MOV    AH,02
        INT    21H
        RET
DPCRLF  ENDP
END