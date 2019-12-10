;2、分支程序设计--求函数Y的值
;Y=1(X>0);Y=0(X=0);Y=-1(X<0)
.MODEL SMALL
.DATA
Y   DB   0
.CODE
.STARTUP
        LEA    BX,Y
        CALL   READ ; 读取键盘输入数值，并保存在AX中
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
        PUSH   DX ; 调用子程序，保护寄存器中原有的值，压入栈中
        XOR    BX,BX ; 寄存器清零
        XOR    CX,CX
        MOV    AH,1
        INT    21H
        CMP    AL,'+' ; 判断符号位
        JZ     READ1
        CMP    AL,'-'
        JNZ    READ2  ; 若没有符号位直接跳转READ2作为正数读取后续数字	
        MOV    CX,-1  ; CX在READ子程序中储存符号
READ1:	MOV    AH,1
        INT    21H
READ2:  CMP    AL,'0'
        JB     READ3
        CMP    AL,'9'
        JA     READ3  ; 若读取字符不属于0~9，则结束阅读。
        SUB    AL,30H ; ASCII码转为真实的二进制
        SHL    BX,1
        MOV    DX,BX
        SHL    BX,1
        SHL    BX,1
        ADD    BX,DX  ; 相当于BX = 10 * BX，每读取一个数之前的数要乘以10
        MOV    AH,0
        ADD    BX,AX
        JMP    READ1
READ3:  CMP    CX,0  ; 结束前对符号进行处理
        JZ     READ4
        NEG    BX
READ4:  MOV    AX,BX ; AX保存子程序的结果
        POP    DX
        POP    CX
        POP    BX    ; 从栈弹出，恢复寄存器
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