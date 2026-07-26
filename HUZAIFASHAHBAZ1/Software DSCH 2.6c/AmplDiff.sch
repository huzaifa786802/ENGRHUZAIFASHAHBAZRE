DSCH 2.0c
VERSION 08/04/00 11:58:40
BB(-20,-23,145,70)
SYM  #pmos
BB(15,0,35,20)
TITLE 20 15  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(15,5,19,15,r)
VIS 0
PIN(15,0,0.000,0.000)source
PIN(35,10,0.000,0.000)gate
PIN(15,20,1.000,1.000)drain
LIG(35,10,29,10)
LIG(27,10,27,10)
LIG(25,16,25,4)
LIG(23,16,23,4)
LIG(15,4,23,4)
LIG(15,0,15,4)
LIG(15,16,23,16)
LIG(15,20,15,16)
VLG  pmos pmos(drain,source,gate);
FSYM
SYM  #padout1
BB(95,15,110,25)
TITLE 95 15  #PadOut
MODEL 62
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(97,17,8,8,g)
VIS 1
PIN(95,20,0.000,0.000)Vout
LIG(95,15,105,15)
LIG(105,15,110,20)
LIG(110,20,105,25)
LIG(105,25,95,25)
LIG(95,25,95,15)
LIG(96,16,96,24)
LIG(96,24,104,24)
LIG(104,24,104,16)
LIG(96,16,104,16)
LIG(96,16,104,24)
LIG(104,16,96,24)
FSYM
SYM  #nmos
BB(-5,20,15,40)
TITLE 10 35  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(-4,25,19,15,r)
VIS 4
PIN(15,40,0.000,0.000)source
PIN(-5,30,0.000,0.000)gate
PIN(15,20,1.000,1.000)drain
LIG(5,30,-5,30)
LIG(5,36,5,24)
LIG(7,36,7,24)
LIG(15,24,7,24)
LIG(15,20,15,24)
LIG(15,36,7,36)
LIG(15,40,15,36)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #padin2
BB(75,25,90,35)
TITLE 90 25  #padin
MODEL 61
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(80,27,8,8,y)
VIS 1
PIN(75,30,0.000,0.000)Vm
LIG(90,25,80,25)
LIG(80,25,75,30)
LIG(80,25,80,35)
LIG(75,30,80,35)
LIG(80,35,90,35)
LIG(90,35,90,25)
LIG(89,26,89,34)
LIG(89,34,81,34)
LIG(81,34,81,26)
LIG(89,26,81,26)
LIG(89,26,81,34)
LIG(81,26,89,34)
FSYM
SYM  #nmos
BB(55,20,75,40)
TITLE 60 35  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(55,25,19,15,r)
VIS 4
PIN(55,40,0.000,0.000)source
PIN(75,30,0.000,0.000)gate
PIN(55,20,1.000,1.000)drain
LIG(65,30,75,30)
LIG(65,36,65,24)
LIG(63,36,63,24)
LIG(55,24,63,24)
LIG(55,20,55,24)
LIG(55,36,63,36)
LIG(55,40,55,36)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #pmos
BB(35,0,55,20)
TITLE 50 15  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(36,5,19,15,r)
VIS 0
PIN(55,0,0.000,0.000)source
PIN(35,10,0.000,0.000)gate
PIN(55,20,1.000,1.000)drain
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
SYM  #vdd
BB(10,-10,20,0)
TITLE 13 -4  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 0
PIN(15,0,0.000,0.000)vdd
LIG(15,0,15,-5)
LIG(15,-5,10,-5)
LIG(10,-5,15,-10)
LIG(15,-10,20,-5)
LIG(20,-5,15,-5)
FSYM
SYM  #vdd
BB(50,-10,60,0)
TITLE 53 -4  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 0
PIN(55,0,0.000,0.000)vdd
LIG(55,0,55,-5)
LIG(55,-5,50,-5)
LIG(50,-5,55,-10)
LIG(55,-10,60,-5)
LIG(60,-5,55,-5)
FSYM
SYM  #vss
BB(30,57,40,65)
TITLE 34 62  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(30,55,0,0,b)
VIS 0
PIN(35,55,0.000,0.000)vss
LIG(35,55,35,60)
LIG(30,60,40,60)
LIG(30,63,32,60)
LIG(32,63,34,60)
LIG(34,63,36,60)
LIG(36,63,38,60)
FSYM
SYM  #padin1
BB(-20,25,-5,35)
TITLE -20 25  #padin
MODEL 61
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(-18,27,8,8,y)
VIS 1
PIN(-5,30,0.000,0.000)Vp
LIG(-20,25,-10,25)
LIG(-10,25,-5,30)
LIG(-10,25,-10,35)
LIG(-5,30,-10,35)
LIG(-10,35,-20,35)
LIG(-20,35,-20,25)
LIG(-19,26,-19,34)
LIG(-19,34,-11,34)
LIG(-11,34,-11,26)
LIG(-19,26,-11,26)
LIG(-19,26,-11,34)
LIG(-11,26,-19,34)
FSYM
SYM  #aop
BB(95,50,130,70)
TITLE 107 61  #Aop
MODEL 950
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(95,50,1,1,P)
VIS 1
PIN(95,65,0.000,0.000)Vm
PIN(95,55,0.000,0.000)Vp
PIN(130,60,1.000,1.000)Vout
LIG(95,65,100,65)
LIG(95,55,100,55)
LIG(100,50,100,70)
LIG(100,50,125,60)
LIG(100,70,125,60)
LIG(125,60,130,60)
FSYM
CNC(35 40)
LIG(15,40,55,40)
LIG(55,20,95,20)
LIG(35,55,35,40)
LIG(15,20,35,20)
LIG(35,10,35,20)
TEXT -16 -23  #Differential Amplifier
TEXT 55 7  #pMOS current mirror
TEXT 11 47  #nMOS differential pair
TEXT 105 11  #Output voltage
TEXT 102 45  #Equivalent symbol
FFIG C:\Dsch 2.0\Manual uw2\AmplDiff.sch
