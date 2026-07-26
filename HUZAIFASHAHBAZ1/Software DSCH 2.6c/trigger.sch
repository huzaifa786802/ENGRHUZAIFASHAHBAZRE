DSCH 2.1e
VERSION 09/01/01 18:02:50
BB(16,5,169,135)
SYM  #pmos
BB(45,15,65,35)
TITLE 60 20  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,0,0,0,r)
VIS 1
PIN(65,15,0.000,0.000)source
PIN(45,25,0.000,0.000)gate
PIN(65,35,7.000,30.000)drain
LIG(45,25,51,25)
LIG(53,25,53,25)
LIG(55,19,55,31)
LIG(57,19,57,31)
LIG(65,31,57,31)
LIG(65,35,65,31)
LIG(65,19,57,19)
LIG(65,15,65,19)
VLG      pmos pmos(drain,source,gate);
FSYM
SYM  #pmos
BB(45,35,65,55)
TITLE 60 40  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,0,0,0,r)
VIS 1
PIN(65,35,0.000,0.000)source
PIN(45,45,0.000,0.000)gate
PIN(65,55,7.000,30.000)drain
LIG(45,45,51,45)
LIG(53,45,53,45)
LIG(55,39,55,51)
LIG(57,39,57,51)
LIG(65,51,57,51)
LIG(65,55,65,51)
LIG(65,39,57,39)
LIG(65,35,65,39)
VLG      pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(45,55,65,75)
TITLE 60 60  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,0,0,0,r)
VIS 1
PIN(65,75,0.000,0.000)source
PIN(45,65,0.000,0.000)gate
PIN(65,55,7.000,30.000)drain
LIG(55,65,45,65)
LIG(55,59,55,71)
LIG(57,59,57,71)
LIG(65,71,57,71)
LIG(65,75,65,71)
LIG(65,59,57,59)
LIG(65,55,65,59)
VLG      nmos nmos(drain,source,gate);
FSYM
SYM  #nmos
BB(45,75,65,95)
TITLE 60 80  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,0,0,0,r)
VIS 1
PIN(65,95,0.000,0.000)source
PIN(45,85,0.000,0.000)gate
PIN(65,75,7.000,30.000)drain
LIG(55,85,45,85)
LIG(55,79,55,91)
LIG(57,79,57,91)
LIG(65,91,57,91)
LIG(65,95,65,91)
LIG(65,79,57,79)
LIG(65,75,65,79)
VLG      nmos nmos(drain,source,gate);
FSYM
SYM  #vss
BB(60,97,70,105)
TITLE 64 102  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,0,0,0,r)
VIS 0
PIN(65,95,0.000,0.000).
LIG(65,95,65,100)
LIG(60,100,70,100)
LIG(60,103,62,100)
LIG(62,103,64,100)
LIG(64,103,66,100)
LIG(66,103,68,100)
FSYM
SYM  #vdd
BB(60,5,70,15)
TITLE 63 11  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,0,0,0,r)
VIS 0
PIN(65,15,0.000,0.000).
LIG(65,15,65,10)
LIG(65,10,60,10)
LIG(60,10,65,5)
LIG(65,5,70,10)
LIG(70,10,65,10)
FSYM
SYM  #button2
BB(16,51,25,59)
TITLE 20 55  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(17,52,6,6,r)
VIS 1
PIN(25,55,0.000,0.000)Input
LIG(24,55,25,55)
LIG(16,51,16,59)
LIG(24,51,16,51)
LIG(24,59,24,51)
LIG(16,59,24,59)
LIG(17,52,17,58)
LIG(23,52,17,52)
LIG(23,58,23,52)
LIG(17,58,23,58)
FSYM
SYM  #pmos
BB(85,35,105,55)
TITLE 90 40  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(55,145,0,0,r)
VIS 1
PIN(85,35,0.000,0.000)source
PIN(95,55,0.000,0.000)gate
PIN(105,35,7.000,30.000)drain
LIG(95,55,95,49)
LIG(95,47,95,47)
LIG(89,45,101,45)
LIG(89,43,101,43)
LIG(101,35,101,43)
LIG(105,35,101,35)
LIG(89,35,89,43)
LIG(85,35,89,35)
VLG      pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(85,55,105,75)
TITLE 100 70  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(170,-40,0,0,r)
VIS 1
PIN(85,75,0.000,0.000)source
PIN(95,55,0.000,0.000)gate
PIN(105,75,7.000,30.000)drain
LIG(95,65,95,55)
LIG(101,65,89,65)
LIG(101,67,89,67)
LIG(89,75,89,67)
LIG(85,75,89,75)
LIG(101,75,101,67)
LIG(105,75,101,75)
VLG      nmos nmos(drain,source,gate);
FSYM
SYM  #light2
BB(163,40,169,54)
TITLE 165 55  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(164,42,4,5,r)
VIS 1
PIN(165,55,0.000,0.000)Output
LIG(168,47,168,42)
LIG(168,42,167,41)
LIG(164,42,164,47)
LIG(167,52,167,49)
LIG(166,52,169,52)
LIG(166,54,168,52)
LIG(167,54,169,52)
LIG(163,49,169,49)
LIG(165,49,165,55)
LIG(163,47,163,49)
LIG(169,47,163,47)
LIG(169,49,169,47)
LIG(165,41,164,42)
LIG(167,41,165,41)
FSYM
SYM  #vss
BB(135,97,145,105)
TITLE 139 102  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,0,0,0,r)
VIS 0
PIN(140,95,0.000,0.000).
LIG(140,95,140,100)
LIG(135,100,145,100)
LIG(135,103,137,100)
LIG(137,103,139,100)
LIG(139,103,141,100)
LIG(141,103,143,100)
FSYM
SYM  #vdd
BB(135,5,145,15)
TITLE 138 11  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(-5,0,0,0,r)
VIS 0
PIN(140,15,0.000,0.000).
LIG(140,15,140,10)
LIG(140,10,135,10)
LIG(135,10,140,5)
LIG(140,5,145,10)
LIG(145,10,140,10)
FSYM
SYM  #pmos
BB(120,20,140,40)
TITLE 135 25  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(-5,0,0,0,r)
VIS 1
PIN(140,20,0.000,0.000)source
PIN(120,30,0.000,0.000)gate
PIN(140,40,7.000,30.000)drain
LIG(120,30,126,30)
LIG(128,30,128,30)
LIG(130,24,130,36)
LIG(132,24,132,36)
LIG(140,36,132,36)
LIG(140,40,140,36)
LIG(140,24,132,24)
LIG(140,20,140,24)
VLG      pmos pmos(drain,source,gate);
FSYM
SYM  #vss
BB(105,37,115,45)
TITLE 109 42  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,0,0,0,r)
VIS 0
PIN(110,35,0.000,0.000).
LIG(110,35,110,40)
LIG(105,40,115,40)
LIG(105,43,107,40)
LIG(107,43,109,40)
LIG(109,43,111,40)
LIG(111,43,113,40)
FSYM
SYM  #vdd
BB(105,65,115,75)
TITLE 108 71  #vdd
MODEL 1
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,0,0,0,r)
VIS 0
PIN(110,75,0.000,0.000).
LIG(110,75,110,70)
LIG(110,70,105,70)
LIG(105,70,110,65)
LIG(110,65,115,70)
LIG(115,70,110,70)
FSYM
SYM  #nmos
BB(120,70,140,90)
TITLE 135 75  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(0,0,0,0,r)
VIS 1
PIN(140,90,0.000,0.000)source
PIN(120,80,0.000,0.000)gate
PIN(140,70,7.000,30.000)drain
LIG(130,80,120,80)
LIG(130,74,130,86)
LIG(132,74,132,86)
LIG(140,86,132,86)
LIG(140,90,140,86)
LIG(140,74,132,74)
LIG(140,70,140,74)
VLG      nmos nmos(drain,source,gate);
FSYM
CNC(45 55)
CNC(140 55)
CNC(120 55)
LIG(45,25,45,85)
LIG(45,55,25,55)
LIG(65,55,120,55)
LIG(140,15,140,20)
LIG(105,35,110,35)
LIG(105,75,110,75)
LIG(65,35,85,35)
LIG(65,75,85,75)
LIG(140,55,165,55)
LIG(140,40,140,70)
LIG(120,80,120,30)
TEXT 73 125  #The trigger is an inverter with high noise margin
FFIG C:\Dsch 2.0\Manual uw2\trigger.sch
