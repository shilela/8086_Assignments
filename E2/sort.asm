;3��ѭ���������--����
;�����ڴ���BUF��Ԫ��ʼ�����ɸ����ֽ��޷�������
;Ҫ������ǰ���ֵ��С����С�����������С�

.MODEL SMALL
.DATA
COUNT = 7
BUF DB  11H,45H,14H,19H,19H,81H,0H
.CODE
.STARTUP
       MOV    CX,COUNT
       JCXZ   EXIT ; û����ֱ�ӽ���
       LEA    SI,BUF
AGAIN: DEC    CX ; CX��������Ҫ�Ƚϵ����ĸ�����һֱ�ݼ�ֱ��ֻʣһ����
       CALL   SORT ; ð������AL��ΪFLAG�ǳ������      
       INC    SI ; SI֮����δ����õĲ���
       CMP    AL,0 ; AL==0 or CX==1 �������
       JZ     EXIT
       CMP    CX,1
       JZ     EXIT
       JMP    AGAIN
EXIT:
.EXIT   0
SORT   PROC
       PUSH   CX ; ����CX�Ĵ����������Ҫ�ȽϵĴ���
       XOR    AL,AL ; AL�Ĵ������FLAG��ÿ��Ҫ����
       MOV    AH,[SI] ; AH���δ����õ��������������
       MOV    DI,SI   ; SI�����������ĵ�ַ��DI��ź���Ҫ�Ƚϵ����ĵ�ַ
       JCXZ   RETURN  ; CX==0 ˵��ֻ��һ����������Ƚ�
SORT1: INC    DI
       CMP    AH,[DI] ; ��AH����[DI]���򽻻�λ�ã��ı�FLAG��ֵ 
       JB     SORT2
       MOV     AL,1
       XCHG   AH,[DI]
       MOV    [SI],AH
SORT2: LOOP   SORT1
RETURN:POP    CX
       RET
SORT   ENDP
END