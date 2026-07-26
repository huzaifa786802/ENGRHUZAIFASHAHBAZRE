DSCH 2.3a
VERSION 16/10/01 15:44:26
BB(16,5,135,75)
SYM  #button1
BB(16,36,25,44)
TITLE 20 40  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(17,37,6,6,r)
VIS 1
PIN(25,40,0.000,0.000)DataOut
LIG(24,40,25,40)
LIG(16,44,16,36)
LIG(24,44,16,44)
LIG(24,36,24,44)
LIG(16,36,24,36)
LIG(17,43,17,37)
LIG(23,43,17,43)
LIG(23,37,23,43)
LIG(17,37,23,37)
FSYM
SYM  #nmos
BB(75,45,95,65)
TITLE 90 60  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                       
REC(76,50,19,15,r)
VIS 0
PIN(95,65,0.000,0.000)s
PIN(75,55,0.000,0.000)g
PIN(95,45,1.000,1.000)d
LIG(85,55,75,55)
LIG(85,61,85,49)
LIG(87,61,87,49)
LIG(95,49,87,49)
LIG(95,45,95,49)
LIG(95,61,87,61)
LIG(95,65,95,61)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #inv
BB(35,30,70,50)
TITLE 50 40  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(-35,-10,0,0,)
VIS 0
PIN(35,40,0.000,0.000)in
PIN(70,40,1.000,1.000)out
LIG(35,40,45,40)
LIG(45,30,45,50)
LIG(45,30,60,40)
LIG(45,50,60,40)
LIG(62,40,62,40)
LIG(64,40,70,40)
VLG  not not1(out,in);
FSYM
SYM  #pmos
BB(75,15,95,35)
TITLE 90 30  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                       
REC(76,20,19,15,r)
VIS 0
PIN(95,15,0.000,0.000)s
PIN(75,25,0.000,0.000)g
PIN(95,35,1.000,1.000)d
LIG(75,25,81,25)
LIG(83,25,83,25)
LIG(85,31,85,19)
LIG(87,31,87,19)
LIG(95,19,87,19)
LIG(95,15,95,19)
LIG(95,31,87,31)
LIG(95,35,95,31)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #padout1
BB(120,35,135,45)
TITLE 120 35  #PadOut
MODEL 62
PROP                                                                                                                                                                                                           
REC(122,37,8,8,g)
VIS 1
PIN(120,40,0.000,0.000)pad
LIG(120,35,130,35)
LIG(130,35,135,40)
LIG(135,40,130,45)
LIG(130,45,120,45)
LIG(120,45,120,35)
LIG(121,36,121,44)
LIG(121,44,129,44)
LIG(129,44,129,36)
LIG(121,36,129,36)
LIG(121,36,129,44)
LIG(129,36,121,44)
FSYM
SYM  #vdd
BB(90,5,100,15)
TITLE 93 11  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(95,15,0.000,0.000)vdd
LIG(95,15,95,10)
LIG(95,10,90,10)
LIG(90,10,95,5)
LIG(95,5,100,10)
LIG(100,10,95,10)
FSYM
SYM  #vss
BB(90,67,100,75)
TITLE 94 72  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(90,65,0,0,b)
VIS 0
PIN(95,65,0.000,0.000)vss
LIG(95,65,95,70)
LIG(90,70,100,70)
LIG(90,73,92,70)
LIG(92,73,94,70)
LIG(94,73,96,70)
LIG(96,73,98,70)
FSYM
CNC(75 40)
CNC(95 40)
CNC(95 40)
LIG(75,25,75,40)
LIG(70,40,75,40)
LIG(75,40,75,55)
LIG(95,35,95,40)
LIG(95,40,120,40)
LIG(95,40,95,45)
LIG(25,40,35,40)
FFIG C:\Dsch 2.0\Book on CMOS\IOSimpleOut.sch
