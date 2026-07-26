DSCH 2.5f
VERSION 16/05/02 09:00:24
BB(-11,-16,131,55)
SYM  #inv
BB(35,25,70,45)
TITLE 55 35  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(105,30,0,0,)
VIS 0
PIN(70,35,0.000,0.000)in
PIN(35,35,0.030,0.070)out
LIG(70,35,60,35)
LIG(60,25,60,45)
LIG(60,25,45,35)
LIG(60,45,45,35)
LIG(43,35,43,35)
LIG(41,35,35,35)
VLG  not not1(out,in);
FSYM
SYM  #nmos
BB(15,25,35,45)
TITLE 30 30  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                        
REC(20,25,15,19,r)
VIS 0
PIN(35,25,0.000,0.000)source
PIN(25,45,0.000,0.000)gate
PIN(15,25,1.000,1.000)drain
LIG(25,35,25,45)
LIG(31,35,19,35)
LIG(31,33,19,33)
LIG(19,25,19,33)
LIG(15,25,19,25)
LIG(31,25,31,33)
LIG(35,25,31,25)
VLG   nmos nmos(drain,source,gate);
FSYM
SYM  #nmos
BB(75,25,95,45)
TITLE 90 30  #nmos
MODEL 901
PROP   1.0u 0.12u                                                                                                                                                                                                        
REC(80,25,15,19,r)
VIS 0
PIN(95,25,0.000,0.000)source
PIN(85,45,0.000,0.000)gate
PIN(75,25,1.000,1.000)drain
LIG(85,35,85,45)
LIG(91,35,79,35)
LIG(91,33,79,33)
LIG(79,25,79,33)
LIG(75,25,79,25)
LIG(91,25,91,33)
LIG(95,25,91,25)
VLG   nmos nmos(drain,source,gate);
FSYM
SYM  #inv
BB(35,-5,70,15)
TITLE 50 5  #1
MODEL 101
PROP                                                                                                                                                                                                           
REC(0,0,0,0,)
VIS 0
PIN(35,5,0.000,0.000)in
PIN(70,5,0.030,0.070)out
LIG(35,5,45,5)
LIG(45,-5,45,15)
LIG(45,-5,60,5)
LIG(45,15,60,5)
LIG(62,5,62,5)
LIG(64,5,70,5)
VLG  not not1(out,in);
FSYM
CNC(70 25)
CNC(85 50)
CNC(25 50)
LIG(35,35,35,5)
LIG(70,5,70,25)
LIG(70,25,75,25)
LIG(85,50,105,50)
LIG(25,45,25,50)
LIG(0,50,25,50)
LIG(85,45,85,50)
LIG(95,55,95,-5)
LIG(70,25,70,35)
LIG(70,20,70,25)
LIG(15,55,15,-5)
LIG(25,50,85,50)
TEXT 74 15  #1/0
TEXT 26 15  #0/1
TEXT 91 -13  #nData
TEXT -11 45  #Sel
TEXT 48 -16  #Memory Cell
TEXT 10 -15  #Data
FFIG C:\Dsch2\Book on CMOS\Ram1.sch
