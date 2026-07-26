DSCH 2.5f
VERSION 12/21/2002 8:26:55 PM
BB(6,10,94,60)
SYM  #or2
BB(15,10,50,30)
TITLE 35 20  #>=1
MODEL 502
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 4
PIN(15,15,0.000,0.000)a
PIN(15,25,0.000,0.000)b
PIN(50,20,0.090,0.070)s
LIG(15,25,22,25)
LIG(22,30,22,10)
LIG(22,10,42,10)
LIG(42,10,42,30)
LIG(42,30,22,30)
LIG(15,15,22,15)
LIG(42,20,50,20)
VLG  or or2(s,a,b);
FSYM
SYM  #or2
BB(15,40,50,60)
TITLE 35 50  #>=1
MODEL 502
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 4
PIN(15,45,0.000,0.000)a
PIN(15,55,0.000,0.000)b
PIN(50,50,0.090,0.070)s
LIG(15,55,22,55)
LIG(22,60,22,40)
LIG(22,40,42,40)
LIG(42,40,42,60)
LIG(42,60,22,60)
LIG(15,45,22,45)
LIG(42,50,50,50)
VLG  or or2(s,a,b);
FSYM
SYM  #nand2
BB(50,25,85,45)
TITLE 62 36  #&
MODEL 202
PROP                                                                                                                                                                                                           
REC(50,25,1,1,P)
VIS 4
PIN(50,40,0.000,0.000)a
PIN(50,30,0.000,0.000)b
PIN(85,35,0.030,0.070)s
LIG(50,40,56,40)
LIG(50,30,56,30)
LIG(56,25,56,45)
LIG(56,45,77,45)
LIG(77,45,77,25)
LIG(77,25,56,25)
LIG(77,35,85,35)
LIG(77,33,81,35)
VLG  nand nand2(out,a,b);
FSYM
SYM  #button1
BB(6,11,15,19)
TITLE 10 15  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(7,12,6,6,r)
VIS 1
PIN(15,15,0.000,0.000)in1
LIG(14,15,15,15)
LIG(6,19,6,11)
LIG(14,19,6,19)
LIG(14,11,14,19)
LIG(6,11,14,11)
LIG(7,18,7,12)
LIG(13,18,7,18)
LIG(13,12,13,18)
LIG(7,12,13,12)
FSYM
SYM  #button2
BB(6,21,15,29)
TITLE 10 25  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(7,22,6,6,r)
VIS 1
PIN(15,25,0.000,0.000)in2
LIG(14,25,15,25)
LIG(6,29,6,21)
LIG(14,29,6,29)
LIG(14,21,14,29)
LIG(6,21,14,21)
LIG(7,28,7,22)
LIG(13,28,7,28)
LIG(13,22,13,28)
LIG(7,22,13,22)
FSYM
SYM  #button3
BB(6,41,15,49)
TITLE 10 45  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(7,42,6,6,r)
VIS 1
PIN(15,45,0.000,0.000)in3
LIG(14,45,15,45)
LIG(6,49,6,41)
LIG(14,49,6,49)
LIG(14,41,14,49)
LIG(6,41,14,41)
LIG(7,48,7,42)
LIG(13,48,7,48)
LIG(13,42,13,48)
LIG(7,42,13,42)
FSYM
SYM  #button4
BB(6,51,15,59)
TITLE 10 55  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(7,52,6,6,r)
VIS 1
PIN(15,55,0.000,0.000)in4
LIG(14,55,15,55)
LIG(6,59,6,51)
LIG(14,59,6,59)
LIG(14,51,14,59)
LIG(6,51,14,51)
LIG(7,58,7,52)
LIG(13,58,7,58)
LIG(13,52,13,58)
LIG(7,52,13,52)
FSYM
SYM  #light1
BB(88,20,94,34)
TITLE 90 34  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(89,21,4,4,r)
VIS 129
PIN(90,35,0.000,0.000)out1
LIG(93,26,93,21)
LIG(93,21,92,20)
LIG(89,21,89,26)
LIG(92,31,92,28)
LIG(91,31,94,31)
LIG(91,33,93,31)
LIG(92,33,94,31)
LIG(88,28,94,28)
LIG(90,28,90,35)
LIG(88,26,88,28)
LIG(94,26,88,26)
LIG(94,28,94,26)
LIG(90,20,89,21)
LIG(92,20,90,20)
FSYM
LIG(50,20,50,30)
LIG(50,40,50,50)
LIG(85,35,90,35)
FFIG C:\Documents and Settings\Bear\Desktop\dsch2\TEST OAI.sch
