;顺序程序设计--查表法实现0~9的BCD码转换为ASCII码程序
;有10个BCD码存在BCDM为首地址的内存单元，将它们转换成ASCII码，并存放在首地址为ASC2的内存单元。
.MODEL SMALL
.DATA
BCDtoASC2_table  DB 30H,31H,32H,33H,34H,35H,36H,37H,38H,39H
BCDM     DB 0001B,0010B,0011B,0100B,0101B,0110B,0111B,1000B,1001B,0000B
            ;1   ,2    ,3    ,4    ,5    ,6    ,7    ,8    ,9    ,0
ASC2     DB 10 DUP(0)
.CODE
.STARTUP
        MOV    CX,10 ; CX保存循环次数
        LEA    BX,BCDtoASC2_table
        LEA    SI,[BCDM]
        LEA    DI,[ASC2]   
AGAIN:
        MOV    AL,[SI]
        XLAT   ;查表
        MOV    [DI],AL
        INC    SI
        INC    DI
        LOOP   AGAIN
.EXIT   0