DSCH 2.6c
VERSION 1/8/2003 4:13:04 AM
BB(-9,-5,74,25)
SYM  #button6
BB(-9,-4,0,4)
TITLE -5 0  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-8,-3,6,6,r)
VIS 1
PIN(0,0,0.000,0.000)g
LIG(-1,0,0,0)
LIG(-9,4,-9,-4)
LIG(-1,4,-9,4)
LIG(-1,-4,-1,4)
LIG(-9,-4,-1,-4)
LIG(-8,3,-8,-3)
LIG(-2,3,-8,3)
LIG(-2,-3,-2,3)
LIG(-8,-3,-2,-3)
FSYM
SYM  #button5
BB(-9,6,0,14)
TITLE -5 10  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-8,7,6,6,r)
VIS 1
PIN(0,10,0.000,0.000)p
LIG(-1,10,0,10)
LIG(-9,14,-9,6)
LIG(-1,14,-9,14)
LIG(-1,6,-1,14)
LIG(-9,6,-1,6)
LIG(-8,13,-8,7)
LIG(-2,13,-8,13)
LIG(-2,7,-2,13)
LIG(-8,7,-2,7)
FSYM
SYM  #button4
BB(-9,16,0,24)
TITLE -5 20  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-8,17,6,6,r)
VIS 1
PIN(0,20,0.000,0.000)ci
LIG(-1,20,0,20)
LIG(-9,24,-9,16)
LIG(-1,24,-9,24)
LIG(-1,16,-1,24)
LIG(-9,16,-1,16)
LIG(-8,23,-8,17)
LIG(-2,23,-8,23)
LIG(-2,17,-2,23)
LIG(-8,17,-2,17)
FSYM
SYM  #and2
BB(0,5,35,25)
TITLE 12 16  #&
MODEL 402
PROP                                                                                                                                                                                                            
REC(0,0,0,0,)
VIS 0
PIN(0,20,0.000,0.000)b
PIN(0,10,0.000,0.000)a
PIN(35,15,0.090,0.070)s
LIG(0,20,8,20)
LIG(8,5,8,25)
LIG(28,15,35,15)
LIG(27,17,24,21)
LIG(28,15,27,17)
LIG(27,13,28,15)
LIG(24,9,27,13)
LIG(19,6,24,9)
LIG(24,21,19,24)
LIG(19,24,8,25)
LIG(8,5,19,6)
LIG(0,10,8,10)
VLG   and and2(out,a,b);
FSYM
SYM  #or2
BB(35,0,70,20)
TITLE 55 10  #|
MODEL 502
PROP                                                                                                                                                                                                            
REC(0,0,0,0,)
VIS 0
PIN(35,5,0.000,0.000)a
PIN(35,15,0.000,0.000)b
PIN(70,10,0.090,0.070)s
LIG(35,15,48,15)
LIG(47,17,43,20)
LIG(63,10,70,10)
LIG(62,12,59,16)
LIG(63,10,62,12)
LIG(62,8,63,10)
LIG(59,4,62,8)
LIG(54,1,59,4)
LIG(59,16,54,19)
LIG(54,19,43,20)
LIG(43,0,54,1)
LIG(49,13,47,17)
LIG(43,0,47,3)
LIG(47,3,49,7)
LIG(49,7,50,10)
LIG(50,10,49,13)
LIG(35,5,48,5)
VLG   or or2(s,a,b);
FSYM
SYM  #light3
BB(68,-5,74,9)
TITLE 70 9  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(69,-4,4,4,r)
VIS 1
PIN(70,10,0.000,0.000)co
LIG(73,1,73,-4)
LIG(73,-4,72,-5)
LIG(69,-4,69,1)
LIG(72,6,72,3)
LIG(71,6,74,6)
LIG(71,8,73,6)
LIG(72,8,74,6)
LIG(68,3,74,3)
LIG(70,3,70,10)
LIG(68,1,68,3)
LIG(74,1,68,1)
LIG(74,3,74,1)
LIG(70,-5,69,-4)
LIG(72,-5,70,-5)
FSYM
LIG(15,5,35,5)
LIG(15,0,15,5)
LIG(0,0,15,0)
FFIG C:\Documents and Settings\Bear\Desktop\dsch2\A_CLA.sch
