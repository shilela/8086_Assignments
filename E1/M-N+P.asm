; �򻯸�ʽ������ϰ
; ����Ĺ��ܣ�����M-N+P
.MODEL SMALL
.DATA
M DB 30H
N DB 20H
P DB 40H
.CODE
.STARTUP
MOV   BL,M
MOV   AL,BL
SUB   AL,N
ADD   AL,P
.EXIT 0
END