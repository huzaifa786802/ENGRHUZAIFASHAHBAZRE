DSCH 2.0d
VERSION 08/09/00 10:35:42
BB(5,-12,260,140)
SYM  #Capa
BB(175,90,185,110)
TITLE 185 95  #C
MODEL 900
PROP   Crosstalk                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
REC(0,20,0,0,)
VIS 2
PIN(180,90,0.000,0.000)c1
PIN(180,110,0.000,0.000)c2
LIG(180,98,180,90)
LIG(185,98,175,98)
LIG(175,102,185,102)
LIG(180,110,180,102)
FSYM
SYM  #vdd
BB(65,70,75,80)
TITLE 68 76  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,70,0,0,r)
VIS 4
PIN(70,80,0.000,0.000)vdd
LIG(70,80,70,75)
LIG(70,75,65,75)
LIG(65,75,70,70)
LIG(70,70,75,75)
LIG(75,75,70,75)
FSYM
SYM  #vss
BB(65,132,75,140)
TITLE 69 137  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,80,0,0,r)
VIS 1
PIN(70,130,0.000,0.000)vss
LIG(70,130,70,135)
LIG(65,135,75,135)
LIG(65,138,67,135)
LIG(67,138,69,135)
LIG(69,138,71,135)
LIG(71,138,73,135)
FSYM
SYM  #pmos
BB(50,85,70,105)
TITLE 65 90  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,75,0,0,r)
VIS 0
PIN(70,85,0.000,0.000)source
PIN(50,95,0.000,0.000)gate
PIN(70,105,1.000,1.000)drain
LIG(50,95,56,95)
LIG(58,95,58,95)
LIG(60,89,60,101)
LIG(62,89,62,101)
LIG(70,101,62,101)
LIG(70,105,70,101)
LIG(70,89,62,89)
LIG(70,85,70,89)
VLG     pmos pmos(drain,source,gate);
FSYM
SYM  #vdd
BB(25,95,35,105)
TITLE 28 101  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 0
PIN(30,105,0.000,0.000)vdd
LIG(30,105,30,100)
LIG(30,100,25,100)
LIG(25,100,30,95)
LIG(30,95,35,100)
LIG(35,100,30,100)
FSYM
SYM  #nmos
BB(50,110,70,130)
TITLE 65 115  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,80,0,0,r)
VIS 0
PIN(70,130,0.000,0.000)source
PIN(50,120,0.000,0.000)gate
PIN(70,110,1.000,1.000)drain
LIG(60,120,50,120)
LIG(60,114,60,126)
LIG(62,114,62,126)
LIG(70,126,62,126)
LIG(70,130,70,126)
LIG(70,114,62,114)
LIG(70,110,70,114)
VLG     nmos nmos(drain,source,gate);
FSYM
SYM  #vdd
BB(65,-5,75,5)
TITLE 68 1  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,-5,0,0,r)
VIS 4
PIN(70,5,0.000,0.000)vdd
LIG(70,5,70,0)
LIG(70,0,65,0)
LIG(65,0,70,-5)
LIG(70,-5,75,0)
LIG(75,0,70,0)
FSYM
SYM  #vss
BB(65,57,75,65)
TITLE 69 62  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,5,0,0,r)
VIS 1
PIN(70,55,0.000,0.000)vss
LIG(70,55,70,60)
LIG(65,60,75,60)
LIG(65,63,67,60)
LIG(67,63,69,60)
LIG(69,63,71,60)
LIG(71,63,73,60)
FSYM
SYM  #pmos
BB(50,10,70,30)
TITLE 65 15  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,0,0,0,r)
VIS 0
PIN(70,10,0.000,0.000)source
PIN(50,20,0.000,0.000)gate
PIN(70,30,1.000,1.000)drain
LIG(50,20,56,20)
LIG(58,20,58,20)
LIG(60,14,60,26)
LIG(62,14,62,26)
LIG(70,26,62,26)
LIG(70,30,70,26)
LIG(70,14,62,14)
LIG(70,10,70,14)
VLG     pmos pmos(drain,source,gate);
FSYM
SYM  #clock1
BB(5,27,20,33)
TITLE 10 30  #clock
MODEL 69
PROP   10.000 10.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(7,28,6,4,r)
VIS 1
PIN(20,30,50.000,50.000)Buffer1
LIG(15,30,20,30)
LIG(10,28,8,28)
LIG(14,28,12,28)
LIG(15,27,15,33)
LIG(5,33,5,27)
LIG(10,32,10,28)
LIG(12,28,12,32)
LIG(12,32,10,32)
LIG(8,32,6,32)
LIG(8,28,8,32)
LIG(15,33,5,33)
LIG(15,27,5,27)
FSYM
SYM  #nmos
BB(50,35,70,55)
TITLE 65 40  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,5,0,0,r)
VIS 0
PIN(70,55,0.000,0.000)source
PIN(50,45,0.000,0.000)gate
PIN(70,35,1.000,1.000)drain
LIG(60,45,50,45)
LIG(60,39,60,51)
LIG(62,39,62,51)
LIG(70,51,62,51)
LIG(70,55,70,51)
LIG(70,39,62,39)
LIG(70,35,70,39)
VLG     nmos nmos(drain,source,gate);
FSYM
SYM  #Capa
BB(175,70,185,90)
TITLE 185 75  #C
MODEL 900
PROP   Crosstalk                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
REC(0,0,0,0,)
VIS 2
PIN(180,70,0.000,0.000)c1
PIN(180,90,0.000,0.000)c2
LIG(180,78,180,70)
LIG(185,78,175,78)
LIG(175,82,185,82)
LIG(180,90,180,82)
FSYM
SYM  #Capa
BB(175,90,185,110)
TITLE 185 95  #C
MODEL 900
PROP   Crosstalk                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
REC(0,20,0,0,)
VIS 2
PIN(180,90,0.000,0.000)c1
PIN(180,110,0.000,0.000)c2
LIG(180,98,180,90)
LIG(185,98,175,98)
LIG(175,102,185,102)
LIG(180,110,180,102)
FSYM
CNC(50 105)
CNC(50 30)
CNC(50 105)
CNC(100 70)
CNC(100 70)
LIG(70,105,70,110)
LIG(50,105,30,105)
LIG(70,105,90,105)
LIG(50,95,50,120)
LIG(70,85,70,80)
LIG(70,30,70,35)
LIG(50,30,20,30)
LIG(70,30,90,30)
LIG(50,20,50,45)
LIG(70,10,70,5)
LIG(90,30,90,70)
LIG(90,70,210,70)
LIG(90,105,90,90)
LIG(90,90,210,90)
LIG(100,70,100,110)
LIG(100,110,215,110)
TEXT 107 62  #Long interconnects
TEXT 77 112  #Victim near
TEXT 220 86  #Victim far_end
TEXT 94 23  #Agressor near end
TEXT 205 62  #agressor far end
TEXT 115 -12  #Crosstalk effect setup
FFIG C:\Dsch 2.0\Manual uw2\crosstalk.sch
