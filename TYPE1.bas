10 '********************************
20 '*                              *
30 '*       TYPEING  TEST  1       *
40 '*                              *
50 '*             J.W.L            *
60 '*                              *
70 '********************************
80 DEF SEG=0 : POKE 1047,(PEEK(1047) OR 64)
90 CLS : KEY OFF
100 RANDOMIZE VAL(RIGHT$(TIME$,2))*VAL(MID$(TIME$,4,2))
110 MAXRAIN=4
120 DIM C$(MAXRAIN+1),ROW(MAXRAIN+1),COLUMN(MAXRAIN+1),CHAR$(70)
130 DIM EXIT(80)
140 RECORD=0 : REST=76
150 DELAY=0
160 '
170 O$(1)="1234567890"
180 O$(2)="QWERTYUIOP"
190 O$(3)="ASDFGHJKL"
200 O$(4)="ZXCVBNM"
210 O$(5)=O$(2)+O$(3)+O$(4)
220 O$(6)="$*()-=\+;:',<.>/?"+CHR$(34)
230 O$(7)="`~!@#%^&_|[{]}"
240 O$(9)=O$(1)+O$(2)+O$(3)+O$(4)+O$(6)+O$(7)
250 '
260 '-------- stage --------
270 LOCATE 1,15 : PRINT"REST = ";REST;
280 LOCATE 1,50 : PRINT"RECORD = ";RECORD;
290 LOCATE 2,2 : PRINT STRING$(78,216);
300 LINE(8,14)-(711,347),,B
310 LOCATE 25,3 : PRINT STRING$(76,177);
320 '
330 '-------- deside --------
340 LOCATE 10,15 : PRINT"[1] 1-0  [2] Q..P  [3] A..L  [4] Z..M  [5] letters"
350 LOCATE 12,18 : PRINT"[6] $.+.;..  [7] |.~.]..  [8] none  [9] all"
360 LOCATE 14,20 : INPUT "What parts do you want to practice ?  ",O
370 IF O<1 OR O>9 THEN BEEP : GOTO 360
380 LOCATE 15,20 : INPUT "How many delay do you like (0-9)?  ",D : DELAY=D*100
390 IF D<0 OR D>9 THEN BEEP : GOTO 380
400 LOCATE 17,18 : INPUT "If you like to go with SOUND, press [ON]  ",BELL$
410 OBJ$=O$(O) : OBJ=LEN(OBJ$)
420 FOR J=1 TO OBJ : CHAR$(J)=MID$(OBJ$,J,1) : NEXT
430 LINE(125,125)-(575,240),0,BF
440 '
450 '-------- char rain --------
460 WHILE REST>0
470   IF CHARNUM=MAXRAIN THEN 490
480   NUM=CHARNUM+1 : GOSUB 990               'produce
490   I=1
500   WHILE I=< CHARNUM
510     LOCATE ROW(I),COLUMN(I) : PRINT" ";
520     ROW(I)=ROW(I)+1
530     IF ROW(I)=25 THEN GOSUB 630           'break
540     LOCATE ROW(I),COLUMN(I) : PRINT C$(I);
550     KEYIN$=INKEY$
560     IF KEYIN$<>"" THEN GOSUB 740          'kill
570     I=I+1
580     FOR K=0 TO DELAY : NEXT
590   WEND
600 WEND
610 GOTO 1090
620 '
630 '------- break ------
640 LOCATE 25,COLUMN(I) : PRINT" ";
650 IF BELL$="ON" THEN PLAY"MBMLL64CDEGA"
660 REST=REST-1 : CHARNUM=CHARNUM-1
670 LOCATE 1,22 : PRINT REST;
680 EXIT(COLUMN(I))=1
690 FOR J=I TO CHARNUM
700   ROW(J)=ROW(J+1) : COLUMN(J)=COLUMN(J+1) : C$(J)=C$(J+1)
710 NEXT
720 RETURN 550
730 '
740 '------- kill -------
750 KILLNUM=0
760 FOR K=1 TO CHARNUM
770   IF KEYIN$=C$(K) THEN KILLNUM=K : K=CHARNUM
780 NEXT
790 IF KILLNUM=0 THEN RETURN
800 RECORD=RECORD+1
810 LOCATE 1,59 : PRINT RECORD;
820 ROW=ROW(KILLNUM) : COL=COLUMN(KILLNUM)
830 EXIT(COL)=0
840  LINE (COL*9-5,333)-(COL*9-5,ROW*14)
850  LOCATE ROW,COL-1 : PRINT CHR$(27)+CHR$(15)+CHR$(26);
860  LOCATE ROW-1,COL : PRINT CHR$(24);
870  LOCATE ROW+1,COL : PRINT CHR$(25);
880 IF BELL$="ON" THEN SOUND 600,3
890  LINE (COL*9-5,333)-(COL*9-5,ROW*14),0
900  LOCATE ROW,COL-1 : PRINT "   ";
910  LOCATE ROW-1,COL : PRINT " ";
920  LOCATE ROW+1,COL : PRINT " ";
930 IF ROW=24 THEN LOCATE 25,COL : PRINT CHR$(177);
940 FOR J=KILLNUM TO CHARNUM
950   ROW(J)=ROW(J+1) : COLUMN(J)=COLUMN(J+1) : C$(J)=C$(J+1)
960 NEXT
970 CHARNUM=CHARNUM-1
980 RETURN
990 '
1000 '------- produce -------
1010 COLUMN=INT(RND*76)+3
1020 IF EXIT(COLUMN)=1 THEN RETURN
1030 EXIT(COLUMN)=1
1040 COLUMN(NUM)=COLUMN
1050 ROW(NUM)=INT(RND*12)+4
1060 C$(NUM)=CHAR$(INT(RND*OBJ)+1)
1070 CHARNUM=CHARNUM+1
1080 RETURN
1090 '
1100 '------- end -------
1110 KEY ON
1120 END
