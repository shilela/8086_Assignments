; COM�ļ��ı�̸�ʽ����������¹涨��
;   1.Դ����ֻ����ʹ��һ���߼��Σ�������Σ����������ö�ջ�Σ�
;   2.����ʹ�õ����ݣ����Լ��������ڴ���εĿ�ʼ��ĩβ��
;   3.�ڴ����ƫ�Ƶ�ַ(��Ч��ַ)Ϊ100H�ĵ�Ԫ�������ǳ��������ָ�
;   4.�����Ŀ���С��64KB��

; �򻯸�ʽ������ϰ
; ����Ĺ��ܣ���������

.MODEL TINY 
.CODE 
.STARTUP
MOV    DX,OFFSET STRING
MOV    AH,9 
INT    21H
MOV    AH,01H 
INT    21H
MOV    AH,02H
MOV    DL,07H ; ASCII��07H��Ӧ����
INT    21H
.EXIT  0
STRING DB 'PRESS ANY KEY TO CONTINUE !$'
END