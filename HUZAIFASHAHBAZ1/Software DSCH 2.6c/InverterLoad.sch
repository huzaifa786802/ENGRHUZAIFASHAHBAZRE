DSCH 2.4b
VERSION 28/01/02 22:46:05
BB(-15,-8,180,90)
SYM  #clock1
BB(-15,2,0,8)
TITLE -10 5  #clock
MODEL 69
PROP   10 10                                                                                                                                                                                                       
REC(-13,3,6,4,r)
VIS 1
PIN(0,5,1.000,3.500)clk1
LIG(-5,5,0,5)
LIG(-10,3,-12,3)
LIG(-6,3,-8,3)
LIG(-5,2,-5,8)
LIG(-15,8,-15,2)
LIG(-10,7,-10,3)
LIG(-8,3,-8,7)
LIG(-8,7,-10,7)
LIG(-12,7,-14,7)
LIG(-12,3,-12,7)
LIG(-5,8,-15,8)
LIG(-5,2,-15,2)
FSYM
SYM  #inv
BB(145,70,180,90)
TITLE 160 80  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(85,35,0,0,)
VIS 0
PIN(145,80,0.000,0.000)in
PIN(180,80,0.020,0.070)out
LIG(145,80,155,80)
LIG(155,70,155,90)
LIG(155,70,170,80)
LIG(155,90,170,80)
LIG(172,80,172,80)
LIG(174,80,180,80)
VLG  not not1(out,in);
FSYM
SYM  #inv
BB(0,25,35,45)
TITLE 15 35  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(-60,-10,0,0,)
VIS 0
PIN(0,35,0.000,0.000)in
PIN(35,35,0.020,0.070)out
LIG(0,35,10,35)
LIG(10,25,10,45)
LIG(10,25,25,35)
LIG(10,45,25,35)
LIG(27,35,27,35)
LIG(29,35,35,35)
VLG  not not1(out,in);
FSYM
SYM  #inv
BB(0,-5,35,15)
TITLE 15 5  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(-60,-40,0,0,)
VIS 0
PIN(0,5,0.000,0.000)in
PIN(35,5,0.020,0.070)out
LIG(0,5,10,5)
LIG(10,-5,10,15)
LIG(10,-5,25,5)
LIG(10,15,25,5)
LIG(27,5,27,5)
LIG(29,5,35,5)
VLG  not not1(out,in);
FSYM
SYM  #inv
BB(95,-5,130,15)
TITLE 110 5  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(35,-40,0,0,)
VIS 0
PIN(95,5,0.000,0.000)in
PIN(130,5,0.020,0.070)out
LIG(95,5,105,5)
LIG(105,-5,105,15)
LIG(105,-5,120,5)
LIG(105,15,120,5)
LIG(122,5,122,5)
LIG(124,5,130,5)
VLG  not not1(out,in);
FSYM
SYM  #inv
BB(130,55,165,75)
TITLE 145 65  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(70,20,0,0,)
VIS 0
PIN(130,65,0.000,0.000)in
PIN(165,65,0.020,0.070)out
LIG(130,65,140,65)
LIG(140,55,140,75)
LIG(140,55,155,65)
LIG(140,75,155,65)
LIG(157,65,157,65)
LIG(159,65,165,65)
VLG  not not1(out,in);
FSYM
SYM  #inv
BB(115,40,150,60)
TITLE 130 50  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(55,5,0,0,)
VIS 0
PIN(115,50,0.000,0.000)in
PIN(150,50,0.020,0.070)out
LIG(115,50,125,50)
LIG(125,40,125,60)
LIG(125,40,140,50)
LIG(125,60,140,50)
LIG(142,50,142,50)
LIG(144,50,150,50)
VLG  not not1(out,in);
FSYM
SYM  #inv
BB(95,25,130,45)
TITLE 110 35  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(35,-10,0,0,)
VIS 0
PIN(95,35,0.000,0.000)in
PIN(130,35,0.020,0.070)out
LIG(95,35,105,35)
LIG(105,25,105,45)
LIG(105,25,120,35)
LIG(105,45,120,35)
LIG(122,35,122,35)
LIG(124,35,130,35)
VLG  not not1(out,in);
FSYM
CNC(75 35)
CNC(75 50)
CNC(75 35)
CNC(75 35)
CNC(75 65)
CNC(75 50)
CNC(75 65)
CNC(75 50)
CNC(75 65)
LIG(75,65,130,65)
LIG(0,5,0,35)
LIG(35,5,95,5)
LIG(35,35,75,35)
LIG(75,65,75,80)
LIG(75,35,95,35)
LIG(75,50,115,50)
LIG(75,80,145,80)
LIG(75,35,75,50)
LIG(75,50,75,65)
TEXT 43 25  #Large load (fanout =4)
TEXT 39 -8  #Small load (fanout =1)
FFIG C:\Dsch2\Book on CMOS\InverterLoad.sch
