; ������ʽ2������ϰ
; ����Ĺ��ܣ������Ƶ�ʮ�����Ƶ�ת��
DATA    SEGMENT
BUF     DW 246FH
DATA   	ENDS
CODE    SEGMENT
MAIN    PROC     FAR
        ASSUME   CS:CODE,DS:DATA
        PUSH     DS
        SUB      AX,AX
        PUSH     AX
        MOV      AX,DATA
        MOV      DS,AX
        MOV      BX,BUF
        MOV      CH,4  ; CH����ѭ���Ĵ�
ROTATE: MOV      CL,4  ; CL����ѭ��������λ
        ROL      BX,CL
        MOV      AL,BL
        AND      AL,0FH ; ÿ��ȡ�����λ
        ADD      AL,30H ; ת��ΪASCII��
        CMP      AL,3AH ; ��3AH�Ƚϣ��ж�����0~9����A~E
        JL       PRINTIT
        ADD      AL,07H ; A~Eת��Ϊ��Ӧ��ASCII��
PRINTIT: MOV      DL,AL
         MOV      AH,2
		 INT      21H
		 DEC      CH ; CH�ݼ�
	     JNZ      ROTATE
		 RET
MAIN    ENDP
CODE    ENDS
END    MAIN
