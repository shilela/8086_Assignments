; ������ʽ������ϰ
; ����Ĺ��ܣ�ͳ�Ƽ����ַ�'A'���ַ�'B'�ĸ�����
C_SEG SEGMENT
         ASSUME CS:C_SEG,DS:C_SEG,ES:C_SEG
         ORG  100H
BEGIN: JMP START
NUM    DW    6 ; ����ѭ�������������ַ���������
A      DB   '?'
B      DB   '?'
START: MOV   CX,NUM
	   MOV   DX,0
INPUT: MOV   AH,1
       INT   21H
       CMP   AL,'A'
       JZ    ACNT
       CMP   AL,'B'
       JZ    BCNT
       JMP NEXT
ACNT:  INC    DL
       JMP   NEXT
BCNT:  INC   DH
NEXT:  LOOP   INPUT
       MOV     A,DL
       MOV     B,DH
       MOV     AH,4CH
       INT     21H
C_SEG  ENDS
END BEGIN
