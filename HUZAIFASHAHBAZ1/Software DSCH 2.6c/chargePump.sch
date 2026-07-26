DSCH 2.1a
VERSION 26/09/00 09:48:00
BB(-10,-5,151,67)
SYM  #not1
BB(5,20,40,40)
TITLE 20 30  #1
MODEL 101
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 4
PIN(5,30,0.000,0.000)in
PIN(40,30,1.000,1.000)out
LIG(30,28,34,30)
LIG(5,30,15,30)
LIG(15,20,15,40)
LIG(15,40,30,40)
LIG(30,40,30,20)
LIG(30,20,15,20)
LIG(30,30,40,30)
VLG  not not1(out,in);
FSYM
SYM  #Capa
BB(40,25,60,35)
TITLE 45 25  #C
MODEL 900
PROP   Ccoupling                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
REC(10,85,0,0,)
VIS 0
PIN(40,30,0.000,0.000)c1
PIN(60,30,0.000,0.000)c2
LIG(48,30,40,30)
LIG(48,25,48,35)
LIG(52,35,52,25)
LIG(60,30,52,30)
FSYM
SYM  #nmos
BB(60,5,80,25)
TITLE 75 20  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(61,10,19,15,r)
VIS 0
PIN(80,25,0.000,0.000)source
PIN(60,15,0.000,0.000)gate
PIN(80,5,1.000,1.000)drain
LIG(70,15,60,15)
LIG(70,21,70,9)
LIG(72,21,72,9)
LIG(80,9,72,9)
LIG(80,5,80,9)
LIG(80,21,72,21)
LIG(80,25,80,21)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #vdd
BB(75,-5,85,5)
TITLE 78 1  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 0
PIN(80,5,0.000,0.000)vdd
LIG(80,5,80,0)
LIG(80,0,75,0)
LIG(75,0,80,-5)
LIG(80,-5,85,0)
LIG(85,0,80,0)
FSYM
SYM  #nmos
BB(80,30,100,50)
TITLE 95 35  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(85,30,15,19,r)
VIS 0
PIN(100,30,0.000,0.000)source
PIN(90,50,0.000,0.000)gate
PIN(80,30,1.000,1.000)drain
LIG(90,40,90,50)
LIG(96,40,84,40)
LIG(96,38,84,38)
LIG(84,30,84,38)
LIG(80,30,84,30)
LIG(96,30,96,38)
LIG(100,30,96,30)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #Capa
BB(100,30,110,50)
TITLE 110 35  #C
MODEL 900
PROP   1pF                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
REC(0,0,0,0,)
VIS 0
PIN(105,30,0.000,0.000)c1
PIN(105,50,0.000,0.000)c2
LIG(105,38,105,30)
LIG(110,38,100,38)
LIG(100,42,110,42)
LIG(105,50,105,42)
FSYM
SYM  #vss
BB(100,52,110,60)
TITLE 104 57  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(100,50,0,0,b)
VIS 0
PIN(105,50,0.000,0.000)vss
LIG(105,50,105,55)
LIG(100,55,110,55)
LIG(100,58,102,55)
LIG(102,58,104,55)
LIG(104,58,106,55)
LIG(106,58,108,55)
FSYM
SYM  #clock1
BB(-10,27,5,33)
TITLE -5 30  #clock
MODEL 69
PROP   10.000 10.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(-8,28,6,4,r)
VIS 1
PIN(5,30,50.000,50.000)Clock
LIG(0,30,5,30)
LIG(-5,28,-7,28)
LIG(-1,28,-3,28)
LIG(0,27,0,33)
LIG(-10,33,-10,27)
LIG(-5,32,-5,28)
LIG(-3,28,-3,32)
LIG(-3,32,-5,32)
LIG(-7,32,-9,32)
LIG(-7,28,-7,32)
LIG(0,33,-10,33)
LIG(0,27,-10,27)
FSYM
CNC(80 30)
LIG(60,15,60,30)
LIG(60,30,80,30)
LIG(80,30,80,50)
LIG(80,50,90,50)
LIG(80,30,80,25)
LIG(100,30,110,30)
TEXT 74 57  #Diode connected MOS
TEXT 51 0  #Tie to VDD
TEXT 104 26  #Vout
TEXT 111 43  #Tank capacitance
TEXT 12 -1  #Charge Pump
TEXT 39 42  #Coupling capa
FFIG C:\Dsch 2.0\Manual uw2\chargePump.sch
