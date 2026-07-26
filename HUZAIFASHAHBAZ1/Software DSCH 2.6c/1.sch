DSCH 2.6c
VERSION 5/21/2009 11:47:34 PM
BB(6,-15,90,80)
SYM  #pmos
BB(35,0,55,20)
TITLE 50 15  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(36,5,19,15,r)
VIS 2
PIN(55,0,0.000,0.000)s
PIN(35,10,0.000,0.000)g
PIN(55,20,0.030,0.070)d
LIG(35,10,41,10)
LIG(43,10,43,10)
LIG(45,16,45,4)
LIG(47,16,47,4)
LIG(55,4,47,4)
LIG(55,0,55,4)
LIG(55,16,47,16)
LIG(55,20,55,16)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #pmos
BB(35,25,55,45)
TITLE 50 40  #pmos
MODEL 902
PROP   2.0u 0.12u                                                                                                                                                                                                       
REC(36,30,19,15,r)
VIS 2
PIN(55,25,0.000,0.000)s
PIN(35,35,0.000,0.000)g
PIN(55,45,0.030,0.210)d
LIG(35,35,41,35)
LIG(43,35,43,35)
LIG(45,41,45,29)
LIG(47,41,47,29)
LIG(55,29,47,29)
LIG(55,25,55,29)
LIG(55,41,47,41)
LIG(55,45,55,41)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(35,50,55,70)
TITLE 50 65  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(36,55,19,15,r)
VIS 2
PIN(55,70,0.000,0.000)s
PIN(35,60,0.000,0.000)g
PIN(55,50,0.030,0.210)d
LIG(45,60,35,60)
LIG(45,66,45,54)
LIG(47,66,47,54)
LIG(55,54,47,54)
LIG(55,50,55,54)
LIG(55,66,47,66)
LIG(55,70,55,66)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #light1
BB(83,25,89,39)
TITLE 85 39  #light
MODEL 49
PROP                                                                                                                                                                                                           
REC(84,26,4,4,r)
VIS 1
PIN(85,40,0.000,0.000)out1
LIG(88,31,88,26)
LIG(88,26,87,25)
LIG(84,26,84,31)
LIG(87,36,87,33)
LIG(86,36,89,36)
LIG(86,38,88,36)
LIG(87,38,89,36)
LIG(83,33,89,33)
LIG(85,33,85,40)
LIG(83,31,83,33)
LIG(89,31,83,31)
LIG(89,33,89,31)
LIG(85,25,84,26)
LIG(87,25,85,25)
FSYM
SYM  #vss
BB(50,72,60,80)
TITLE 54 77  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(50,70,0,0,b)
VIS 0
PIN(55,70,0.000,0.000)vss
LIG(55,70,55,75)
LIG(50,75,60,75)
LIG(50,78,52,75)
LIG(52,78,54,75)
LIG(54,78,56,75)
LIG(56,78,58,75)
FSYM
SYM  #nmos
BB(70,55,90,75)
TITLE 85 70  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                       
REC(71,60,19,15,r)
VIS 2
PIN(90,75,0.000,0.000)s
PIN(70,65,0.000,0.000)g
PIN(90,55,0.030,0.210)d
LIG(80,65,70,65)
LIG(80,71,80,59)
LIG(82,71,82,59)
LIG(90,59,82,59)
LIG(90,55,90,59)
LIG(90,71,82,71)
LIG(90,75,90,71)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #button1
BB(16,6,25,14)
TITLE 20 10  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(17,7,6,6,r)
VIS 1
PIN(25,10,0.000,0.000)in1
LIG(24,10,25,10)
LIG(16,14,16,6)
LIG(24,14,16,14)
LIG(24,6,24,14)
LIG(16,6,24,6)
LIG(17,13,17,7)
LIG(23,13,17,13)
LIG(23,7,23,13)
LIG(17,7,23,7)
FSYM
SYM  #button2
BB(6,46,15,54)
TITLE 10 50  #button
MODEL 59
PROP                                                                                                                                                                                                           
REC(7,47,6,6,r)
VIS 1
PIN(15,50,0.000,0.000)in2
LIG(14,50,15,50)
LIG(6,54,6,46)
LIG(14,54,6,54)
LIG(14,46,14,54)
LIG(6,46,14,46)
LIG(7,53,7,47)
LIG(13,53,7,53)
LIG(13,47,13,53)
LIG(7,47,13,47)
FSYM
SYM  #vdd
BB(50,-15,60,-5)
TITLE 53 -9  #vdd
MODEL 1
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(55,-5,0.000,0.000)vdd
LIG(55,-5,55,-10)
LIG(55,-10,50,-10)
LIG(50,-10,55,-15)
LIG(55,-15,60,-10)
LIG(60,-10,55,-10)
FSYM
CNC(70 50)
CNC(35 50)
LIG(55,20,55,25)
LIG(55,45,55,50)
LIG(35,35,35,50)
LIG(85,40,70,40)
LIG(70,40,70,50)
LIG(70,50,55,50)
LIG(90,55,70,55)
LIG(70,55,70,50)
LIG(70,65,50,65)
LIG(50,65,50,10)
LIG(25,10,50,10)
LIG(70,70,55,70)
LIG(15,50,35,50)
LIG(35,50,35,60)
LIG(55,-5,55,0)
LIG(90,75,70,75)
LIG(70,75,70,70)
FFIG D:\backup\Software DSCH 2.6c\1.sch
