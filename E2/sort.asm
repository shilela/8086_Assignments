;3、循环程序设计--排序
;假设内存中BUF单元开始有若干个单字节无符号数，
;要求把它们按数值大小，从小到大重新排列。

.MODEL SMALL
.DATA
COUNT = 7
BUF DB  11H,45H,14H,19H,19H,81H,0H
.CODE
.STARTUP
       MOV    CX,COUNT
       JCXZ   EXIT ; 没有数直接结束
       LEA    SI,BUF
AGAIN: DEC    CX ; CX计数，需要比较的数的个数，一直递减直到只剩一个数
       CALL   SORT ; 冒泡排序，AL作为FLAG是程序出口      
       INC    SI ; SI之后是未排序好的部分
       CMP    AL,0 ; AL==0 or CX==1 排序结束
       JZ     EXIT
       CMP    CX,1
       JZ     EXIT
       JMP    AGAIN
EXIT:
.EXIT   0
SORT   PROC
       PUSH   CX ; 保护CX寄存器，存放需要比较的次数
       XOR    AL,AL ; AL寄存器存放FLAG，每次要清零
       MOV    AH,[SI] ; AH存放未排序好的数组的最左侧的数
       MOV    DI,SI   ; SI存放最左侧数的地址，DI存放后面要比较的数的地址
       JCXZ   RETURN  ; CX==0 说明只有一个数，无须比较
SORT1: INC    DI
       CMP    AH,[DI] ; 若AH大于[DI]，则交换位置，改变FLAG的值 
       JB     SORT2
       MOV     AL,1
       XCHG   AH,[DI]
       MOV    [SI],AH
SORT2: LOOP   SORT1
RETURN:POP    CX
       RET
SORT   ENDP
END