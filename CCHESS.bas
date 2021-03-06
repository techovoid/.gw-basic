10 '*************************
20 '*                       *
30 '*     CHINESE  CHESS    *
40 '*                       *
50 '*          J.W.L        *
60 '*                       *
70 '*************************
80 DIM A%(90),B%(10,9,90),C%(90),D%(22,90),E%(10,9)
90 ON ERROR GOTO 630
100 OPEN "STEP" FOR INPUT AS #1
110 CLS:T=1:KEY OFF
120   FOR I=211 TO 697 STEP 54
130   LINE(I,20)-(I,244)
140   NEXT I
150 LINE(211,20)-(697,20):LINE(211,244)-(697,244)
160 FOR J=48 TO 216 STEP 28
170 LINE(211,J)-(427,J):LINE(481,J)-(697,J)
180 NEXT J
190 LINE(211,104)-(319,160):LINE(211,160)-(319,104)
200 LINE(589,104)-(697,160):LINE(589,160)-(697,104)
210   OPEN "STEP-0" FOR INPUT AS #2
220   FOR P=1 TO 22
230   FOR K=0 TO 90:INPUT #2,D%(P,K):NEXT K
240   NEXT P
250   CLOSE #2
260  FOR M=1 TO 9
270  LOCATE M*2,18:PRINT 10-M
280  NEXT M
290  FOR N=24 TO 78 STEP 6
300  LOCATE 21,N:PRINT CHR$((N-18)/6+64)
310  NEXT N
320 LOCATE 2,7:PRINT"TURN"
330 LOCATE 9,7:PRINT"MOVE"
340 LOCATE 20,2:PRINT"press S to stop"
350  FOR N=1 TO 9
360  FOR M=1 TO 10:READ P:E%(M,N)=P:NEXT M
370  NEXT N
380  FOR I=1 TO 32
390  READ X,Y
400  X0=(X-135)/54:Y0=10-(Y+22)/28
410  FOR J=0 TO 90:INPUT #1,A%(J):B%(X0,Y0,J)=A%(J):NEXT J
420  PUT (X,Y),A%,PSET
430  NEXT I
440  CLOSE #1
450 CIRCLE(72,55),20,,,,.66
460 T=-T:IF T=1 THEN PAINT(72,55)
470 LOCATE 12,5:INPUT S$
480 X10=ASC(S$)-64:Y10=VAL(MID$(S$,2,1))
490 X1=X10*54+135:Y1=(10-Y10)*28-22
500 X20=ASC(MID$(S$,4,1))-64:Y20=VAL(RIGHT$(S$,1))
510 X2=X20*54+135:Y2=(10-Y20)*28-22
520 P=E%(X10,Y10)
530 FOR K=0 TO 90
540 B%(X20,Y20,K)=B%(X10,Y10,K):A%(K)=B%(X20,Y20,K):B%(X10,Y10,K)=D%(P,K)           :C%(K)=D%(P,K)
550 NEXT K
560 PUT(X1,Y1),C%,PSET:PUT(X2,Y2),A%,PSET:SOUND 575,6
570 LOCATE 12,5:PRINT"        ":PAINT(72,55),0,0
580 GOTO 450
590 DATA 19,15,15,2,15,15,2,15,15,20,18,14,1,14,17,18,14,1,14,17,18,14,14,1,17,          18,1,14,14,17,11,14,6,14,17,18,14,9,14,7,18,4,14,1,17,18,1,14,4,17
600 DATA 13,14,8,14,17,18,14,12,14,10,18,14,14,1,17,18,1,14,14,17,18,14,1,14,17,         18,14,1,14,17,22,16,16,3,16,16,3,16,16,21
610 DATA 351,6,351,62,351,118,351,174,351,230,297,34,297,202,189,6,189,230,              189,34,189,202,189,62,189,174,189,90,189,146,189,118
620 DATA 513,6,513,62,513,118,513,174,513,230,567,34,567,202,675,34,675,202,             675,6,675,230,675,62,675,174,675,90,675,146,675,118
630 IF X10=19 THEN END
640 PLAY"O3 A12 F12 P32 A12 F12"
650 LOCATE 12,5:PRINT"        "
660 RESUME 470
