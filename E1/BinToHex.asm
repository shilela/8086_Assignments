; 完整格式2操作练习
; 程序的功能：二进制到十六进制的转换
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
        MOV      CH,4  ; CH控制循环四次
ROTATE: MOV      CL,4  ; CL控制循环左移四位
        ROL      BX,CL
        MOV      AL,BL
        AND      AL,0FH ; 每次取最低四位
        ADD      AL,30H ; 转换为ASCII码
        CMP      AL,3AH ; 与3AH比较，判断属于0~9还是A~E
        JL       PRINTIT
        ADD      AL,07H ; A~E转换为对应的ASCII码
PRINTIT: MOV      DL,AL
         MOV      AH,2
		 INT      21H
		 DEC      CH ; CH递减
	     JNZ      ROTATE
		 RET
MAIN    ENDP
CODE    ENDS
END    MAIN
