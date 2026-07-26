DSCH 2.3d
VERSION 14/12/01 23:12:46
BB(31,5,109,65)
SYM  #nmos
BB(55,35,75,55)
TITLE 70 50  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                        
REC(56,40,19,15,r)
VIS 2
PIN(75,55,0.000,0.000)s
PIN(55,45,0.000,0.000)g
PIN(75,35,1.000,1.000)d
LIG(65,45,55,45)
LIG(65,51,65,39)
LIG(67,51,67,39)
LIG(75,39,67,39)
LIG(75,35,75,39)
LIG(75,51,67,51)
LIG(75,55,75,51)
VLG    nmos nmos(drain,source,gate);
FSYM
SYM  #pmos
BB(55,15,75,35)
TITLE 70 30  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                        
REC(56,20,19,15,r)
VIS 2
PIN(75,15,0.000,0.000)s
PIN(55,25,0.000,0.000)g
PIN(75,35,1.000,1.000)d
LIG(55,25,61,25)
LIG(63,25,63,25)
LIG(65,31,65,19)
LIG(67,31,67,19)
LIG(75,19,67,19)
LIG(75,15,75,19)
LIG(75,31,67,31)
LIG(75,35,75,31)
VLG    pmos pmos(drain,source,gate);
FSYM
SYM  #button1
BB(31,31,40,39)
TITLE 35 35  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(32,32,6,6,r)
VIS 1
PIN(40,35,0.000,0.000)in1
LIG(39,35,40,35)
LIG(31,39,31,31)
LIG(39,39,31,39)
LIG(39,31,39,39)
LIG(31,31,39,31)
LIG(32,38,32,32)
LIG(38,38,32,38)
LIG(38,32,38,38)
LIG(32,32,38,32)
FSYM
SYM  #vss
BB(70,57,80,65)
TITLE 74 62  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(70,55,0,0,b)
VIS 0
PIN(75,55,0.000,0.000)vss
LIG(75,55,75,60)
LIG(70,60,80,60)
LIG(70,63,72,60)
LIG(72,63,74,60)
LIG(74,63,76,60)
LIG(76,63,78,60)
FSYM
SYM  #vdd
BB(70,5,80,15)
TITLE 73 11  #vdd
MODEL 1
PROP                                                                                                                                                                                                            
REC(0,0,0,0,)
VIS 0
PIN(75,15,0.000,0.000)vdd
LIG(75,15,75,10)
LIG(75,10,70,10)
LIG(70,10,75,5)
LIG(75,5,80,10)
LIG(80,10,75,10)
FSYM
SYM  #light1
BB(103,20,109,34)
TITLE 105 34  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(104,21,4,4,r)
VIS 1
PIN(105,35,0.000,0.000)out1
LIG(108,26,108,21)
LIG(108,21,107,20)
LIG(104,21,104,26)
LIG(107,31,107,28)
LIG(106,31,109,31)
LIG(106,33,108,31)
LIG(107,33,109,31)
LIG(103,28,109,28)
LIG(105,28,105,35)
LIG(103,26,103,28)
LIG(109,26,103,26)
LIG(109,28,109,26)
LIG(105,20,104,21)
LIG(107,20,105,20)
FSYM
CNC(55 35)
LIG(40,35,55,35)
LIG(55,25,55,35)
LIG(55,35,55,45)
LIG(75,35,105,35)
FFIG C:\Dsch2\Book on CMOS\cmosInv.sch
