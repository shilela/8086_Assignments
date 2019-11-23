; COM文件的编程格式必须符合以下规定：
;   1.源程序只允许使用一个逻辑段，即代码段，不允许设置堆栈段；
;   2.程序使用的数据，可以集中设置在代码段的开始或末尾；
;   3.在代码段偏移地址(有效地址)为100H的单元，必须是程序的启动指令；
;   4.代码段目标块小于64KB。

; 简化格式操作练习
; 程序的功能：按键响铃

.MODEL TINY 
.CODE 
.STARTUP
MOV    DX,OFFSET STRING
MOV    AH,9 
INT    21H
MOV    AH,01H 
INT    21H
MOV    AH,02H
MOV    DL,07H ; ASCII码07H对应响铃
INT    21H
.EXIT  0
STRING DB 'PRESS ANY KEY TO CONTINUE !$'
END