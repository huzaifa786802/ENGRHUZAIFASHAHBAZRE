DSCH 2.3a
VERSION 16/10/01 15:47:17
BB(16,-15,135,95)
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
BB(35,-5,70,15)
TITLE 50 5  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(-35,-45,0,0,)
VIS 0
PIN(35,5,0.000,0.000)in
PIN(70,5,1.000,1.000)out
LIG(35,5,45,5)
LIG(45,-5,45,15)
LIG(45,-5,60,5)
LIG(45,15,60,5)
LIG(62,5,62,5)
LIG(64,5,70,5)
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
SYM  #button2
BB(16,61,25,69)
TITLE 20 65  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(17,62,6,6,r)
VIS 1
PIN(25,65,0.000,0.000)Enable
LIG(24,65,25,65)
LIG(16,69,16,61)
LIG(24,69,16,69)
LIG(24,61,24,69)
LIG(16,61,24,61)
LIG(17,68,17,62)
LIG(23,68,17,68)
LIG(23,62,23,68)
LIG(17,62,23,62)
FSYM
SYM  #vss
BB(90,87,100,95)
TITLE 94 92  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(90,85,0,0,b)
VIS 0
PIN(95,85,0.000,0.000)vss
LIG(95,85,95,90)
LIG(90,90,100,90)
LIG(90,93,92,90)
LIG(92,93,94,90)
LIG(94,93,96,90)
LIG(96,93,98,90)
FSYM
SYM  #pmos
BB(75,-5,95,15)
TITLE 90 10  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                       
REC(76,0,19,15,r)
VIS 0
PIN(95,-5,0.000,0.000)s
PIN(75,5,0.000,0.000)g
PIN(95,15,1.000,1.000)d
LIG(75,5,81,5)
LIG(83,5,83,5)
LIG(85,11,85,-1)
LIG(87,11,87,-1)
LIG(95,-1,87,-1)
LIG(95,-5,95,-1)
LIG(95,11,87,11)
LIG(95,15,95,11)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(75,65,95,85)
TITLE 90 80  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                       
REC(76,70,19,15,r)
VIS 0
PIN(95,85,0.000,0.000)s
PIN(75,75,0.000,0.000)g
PIN(95,65,1.000,1.000)d
LIG(85,75,75,75)
LIG(85,81,85,69)
LIG(87,81,87,69)
LIG(95,69,87,69)
LIG(95,65,95,69)
LIG(95,81,87,81)
LIG(95,85,95,81)
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
SYM  #vdd
BB(90,-15,100,-5)
TITLE 93 -9  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(95,-5,0.000,0.000)vdd
LIG(95,-5,95,-10)
LIG(95,-10,90,-10)
LIG(90,-10,95,-15)
LIG(95,-15,100,-10)
LIG(100,-10,95,-10)
FSYM
SYM  #light1
BB(113,15,119,29)
TITLE 115 29  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(114,16,4,4,r)
VIS 1
PIN(115,30,0.000,0.000)out1
LIG(118,21,118,16)
LIG(118,16,117,15)
LIG(114,16,114,21)
LIG(117,26,117,23)
LIG(116,26,119,26)
LIG(116,28,118,26)
LIG(117,28,119,26)
LIG(113,23,119,23)
LIG(115,23,115,30)
LIG(113,21,113,23)
LIG(119,21,113,21)
LIG(119,23,119,21)
LIG(115,15,114,16)
LIG(117,15,115,15)
FSYM
CNC(75 40)
CNC(95 40)
CNC(95 40)
CNC(30 65)
CNC(115 40)
LIG(75,25,75,40)
LIG(70,40,75,40)
LIG(75,40,75,55)
LIG(95,35,95,40)
LIG(95,40,115,40)
LIG(95,40,95,45)
LIG(25,40,35,40)
LIG(25,65,30,65)
LIG(35,5,30,5)
LIG(30,5,30,65)
LIG(30,65,60,65)
LIG(70,5,75,5)
LIG(60,65,60,75)
LIG(60,75,75,75)
LIG(115,30,115,40)
LIG(115,40,120,40)
FFIG C:\Dsch 2.0\Book on CMOS\IO3StateOut.sch
