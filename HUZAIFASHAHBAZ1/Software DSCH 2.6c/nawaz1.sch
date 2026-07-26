DSCH 2.6c
VERSION 5/21/2009 11:40:50 PM
BB(16,-20,89,75)
SYM  #nmos
BB(40,40,60,60)
TITLE 55 55  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(41,45,19,15,r)
VIS 2
PIN(60,60,0.000,0.000)s
PIN(40,50,0.000,0.000)g
PIN(60,40,0.030,0.140)d
LIG(50,50,40,50)
LIG(50,56,50,44)
LIG(52,56,52,44)
LIG(60,44,52,44)
LIG(60,40,60,44)
LIG(60,56,52,56)
LIG(60,60,60,56)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #pmos
BB(40,0,60,20)
TITLE 55 15  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(41,5,19,15,r)
VIS 2
PIN(60,0,0.000,0.000)s
PIN(40,10,0.000,0.000)g
PIN(60,20,0.030,0.140)d
LIG(40,10,46,10)
LIG(48,10,48,10)
LIG(50,16,50,4)
LIG(52,16,52,4)
LIG(60,4,52,4)
LIG(60,0,60,4)
LIG(60,16,52,16)
LIG(60,20,60,16)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #vdd
BB(55,-20,65,-10)
TITLE 58 -14  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(60,-10,0.000,0.000)vdd
LIG(60,-10,60,-15)
LIG(60,-15,55,-15)
LIG(55,-15,60,-20)
LIG(60,-20,65,-15)
LIG(65,-15,60,-15)
FSYM
SYM  #vss
BB(55,67,65,75)
TITLE 59 72  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(55,65,0,0,b)
VIS 0
PIN(60,65,0.000,0.000)vss
LIG(60,65,60,70)
LIG(55,70,65,70)
LIG(55,73,57,70)
LIG(57,73,59,70)
LIG(59,73,61,70)
LIG(61,73,63,70)
FSYM
SYM  #button1
BB(16,26,25,34)
TITLE 20 30  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(17,27,6,6,r)
VIS 1
PIN(25,30,0.000,0.000)in1
LIG(24,30,25,30)
LIG(16,34,16,26)
LIG(24,34,16,34)
LIG(24,26,24,34)
LIG(16,26,24,26)
LIG(17,33,17,27)
LIG(23,33,17,33)
LIG(23,27,23,33)
LIG(17,27,23,27)
FSYM
SYM  #light1
BB(83,15,89,29)
TITLE 85 29  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(84,16,4,4,r)
VIS 1
PIN(85,30,0.000,0.000)out1
LIG(88,21,88,16)
LIG(88,16,87,15)
LIG(84,16,84,21)
LIG(87,26,87,23)
LIG(86,26,89,26)
LIG(86,28,88,26)
LIG(87,28,89,26)
LIG(83,23,89,23)
LIG(85,23,85,30)
LIG(83,21,83,23)
LIG(89,21,83,21)
LIG(89,23,89,21)
LIG(85,15,84,16)
LIG(87,15,85,15)
FSYM
CNC(40 30)
CNC(60 30)
LIG(60,20,60,30)
LIG(60,-10,60,0)
LIG(60,60,60,65)
LIG(40,10,40,30)
LIG(25,30,40,30)
LIG(40,30,40,50)
LIG(85,30,60,30)
LIG(60,30,60,40)
FFIG D:\backup\Software DSCH 2.6c\nawaz1.sch
