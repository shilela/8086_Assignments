;˳��������--���ʵ��0~9��BCD��ת��ΪASCII�����
;��10��BCD�����BCDMΪ�׵�ַ���ڴ浥Ԫ��������ת����ASCII�룬��������׵�ַΪASC2���ڴ浥Ԫ��
.MODEL SMALL
.DATA
BCDtoASC2_table  DB 30H,31H,32H,33H,34H,35H,36H,37H,38H,39H
BCDM     DB 0001B,0010B,0011B,0100B,0101B,0110B,0111B,1000B,1001B,0000B
            ;1   ,2    ,3    ,4    ,5    ,6    ,7    ,8    ,9    ,0
ASC2     DB 10 DUP(0)
.CODE
.STARTUP
        MOV    CX,10 ; CX����ѭ������
        LEA    BX,BCDtoASC2_table
        LEA    SI,[BCDM]
        LEA    DI,[ASC2]   
AGAIN:
        MOV    AL,[SI]
        XLAT   ;���
        MOV    [DI],AL
        INC    SI
        INC    DI
        LOOP   AGAIN
.EXIT   0