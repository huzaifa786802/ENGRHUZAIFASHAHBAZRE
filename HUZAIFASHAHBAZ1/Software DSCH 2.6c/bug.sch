DSCH2
VERSION 23/09/99 09:58:28
BB(6,15,219,130)
SYM  #vss
BB(150,122,160,130)
TITLE 154 127  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(0,0,0,0)
VIS 0
PIN(155,120,0.000,0)vss
LIG(155,120,155,125)
LIG(150,125,160,125)
LIG(150,128,152,125)
LIG(152,128,154,125)
LIG(154,128,156,125)
LIG(156,128,158,125)
FSYM
SYM  #not
BB(40,45,75,65)
TITLE 55 55  #mynot
MODEL 101
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(30,25,0,0)
VIS 1
PIN(40,55,0.000,0)in
PIN(75,55,0.050,1)out
LIG(65,53,69,55)
LIG(40,55,50,55)
LIG(50,65,50,45)
LIG(50,45,65,45)
LIG(65,45,65,65)
LIG(65,65,50,65)
LIG(65,55,75,55)
VLG       not mynot(out,in);
FSYM
SYM  #button
BB(6,106,15,114)
TITLE 10 110  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(7,107,6,6)
VIS 1
PIN(15,110,0.000,0)clk
LIG(14,110,15,110)
LIG(6,106,6,114)
LIG(14,106,6,106)
LIG(14,114,14,106)
LIG(6,114,14,114)
LIG(7,107,7,113)
LIG(13,107,7,107)
LIG(13,113,13,107)
LIG(7,113,13,113)
FSYM
SYM  #not
BB(75,45,110,65)
TITLE 90 55  #mynot
MODEL 101
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(65,25,0,0)
VIS 1
PIN(75,55,0.000,0)in
PIN(110,55,0.050,2)out
LIG(100,53,104,55)
LIG(75,55,85,55)
LIG(85,65,85,45)
LIG(85,45,100,45)
LIG(100,45,100,65)
LIG(100,65,85,65)
LIG(100,55,110,55)
VLG       not mynot(out,in);
FSYM
SYM  #vss
BB(50,122,60,130)
TITLE 54 127  #vss
MODEL 0
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(-10,25,0,0)
VIS 0
PIN(55,120,0.000,0).
LIG(55,120,55,125)
LIG(50,125,60,125)
LIG(50,128,52,125)
LIG(52,128,54,125)
LIG(54,128,56,125)
LIG(56,128,58,125)
FSYM
SYM  #button
BB(6,91,15,99)
TITLE 10 95  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(7,92,6,6)
VIS 1
PIN(15,95,0.000,0)reset
LIG(14,95,15,95)
LIG(6,91,6,99)
LIG(14,91,6,91)
LIG(14,99,14,91)
LIG(6,99,14,99)
LIG(7,92,7,98)
LIG(13,92,7,92)
LIG(13,98,13,92)
LIG(7,98,13,98)
FSYM
SYM  #button
BB(6,51,15,59)
TITLE 10 55  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(7,52,6,6)
VIS 1
PIN(15,55,0.000,0)D
LIG(14,55,15,55)
LIG(6,51,6,59)
LIG(14,51,6,51)
LIG(14,59,14,51)
LIG(6,59,14,59)
LIG(7,52,7,58)
LIG(13,52,7,52)
LIG(13,58,13,52)
LIG(7,58,13,58)
FSYM
SYM  #nmos
BB(20,55,40,75)
TITLE 35 60  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(50,120,0,0)
VIS 4
PIN(20,55,0.000,0)source
PIN(30,75,0.000,0)gate
PIN(40,55,0.050,3)drain
LIG(30,65,30,75)
LIG(36,65,24,65)
LIG(36,63,24,63)
LIG(24,55,24,63)
LIG(20,55,24,55)
LIG(36,55,36,63)
LIG(40,55,36,55)
VLG    nmos nmos(drain,source,gate);
FSYM
SYM  #not
BB(170,45,205,65)
TITLE 185 55  #mynot
MODEL 101
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(160,25,0,0)
VIS 1
PIN(170,55,0.000,0)in
PIN(205,55,0.050,2)out
LIG(195,53,199,55)
LIG(170,55,180,55)
LIG(180,65,180,45)
LIG(180,45,195,45)
LIG(195,45,195,65)
LIG(195,65,180,65)
LIG(195,55,205,55)
VLG       not mynot(out,in);
FSYM
SYM  #not
BB(135,45,170,65)
TITLE 150 55  #mynot
MODEL 101
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(125,25,0,0)
VIS 1
PIN(135,55,0.000,0)in
PIN(170,55,0.050,2)out
LIG(160,53,164,55)
LIG(135,55,145,55)
LIG(145,65,145,45)
LIG(145,45,160,45)
LIG(160,45,160,65)
LIG(160,65,145,65)
LIG(160,55,170,55)
VLG       not mynot(out,in);
FSYM
SYM  #pmos
BB(115,55,135,75)
TITLE 120 60  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(105,175,0,0)
VIS 4
PIN(115,55,0.000,0)source
PIN(125,75,0.000,0)gate
PIN(135,55,0.050,3)drain
LIG(125,75,125,69)
LIG(125,67,125,67)
LIG(119,65,131,65)
LIG(119,63,131,63)
LIG(131,55,131,63)
LIG(135,55,131,55)
LIG(119,55,119,63)
LIG(115,55,119,55)
VLG    pmos pmos(drain,source,gate);
FSYM
SYM  #pmos
BB(70,75,90,95)
TITLE 85 80  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(170,185,0,0)
VIS 6
PIN(90,75,0.000,0)source
PIN(80,95,0.000,0)gate
PIN(70,75,0.050,3)drain
LIG(80,95,80,89)
LIG(80,87,80,87)
LIG(86,85,74,85)
LIG(86,83,74,83)
LIG(74,75,74,83)
LIG(70,75,74,75)
LIG(86,75,86,83)
LIG(90,75,86,75)
VLG   pmos pmos(drain,source,gate);
FSYM
SYM  #nmos
BB(35,85,55,105)
TITLE 50 90  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(-10,10,0,0)
VIS 4
PIN(55,105,0.000,0)source
PIN(35,95,0.000,0)gate
PIN(55,85,0.050,3)drain
LIG(45,95,35,95)
LIG(45,89,45,101)
LIG(47,89,47,101)
LIG(55,101,47,101)
LIG(55,105,55,101)
LIG(55,89,47,89)
LIG(55,85,55,89)
VLG    nmos nmos(drain,source,gate);
FSYM
SYM  #nmos
BB(135,85,155,105)
TITLE 150 90  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(5,5,0,0)
VIS 5
PIN(155,105,0.000,0)source
PIN(135,95,0.000,0)gate
PIN(155,85,0.050,3)drain
LIG(145,95,135,95)
LIG(145,89,145,101)
LIG(147,89,147,101)
LIG(155,101,147,101)
LIG(155,105,155,101)
LIG(155,89,147,89)
LIG(155,85,155,89)
VLG   nmos nmos(drain,source,gate);
FSYM
SYM  #nmos
BB(165,75,185,95)
TITLE 170 80  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
REC(90,270,0,0)
VIS 4
PIN(185,75,0.000,0)source
PIN(175,95,0.000,0)gate
PIN(165,75,0.050,3)drain
LIG(175,85,175,95)
LIG(169,85,181,85)
LIG(169,83,181,83)
LIG(181,75,181,83)
LIG(185,75,181,75)
LIG(169,75,169,83)
LIG(165,75,169,75)
VLG    nmos nmos(drain,source,gate);
FSYM
SYM  #light
BB(213,40,219,54)
TITLE 215 55  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(214,42,4,5)
VIS 1
PIN(215,55,0.000,0)Q
LIG(218,47,218,42)
LIG(218,42,217,41)
LIG(214,42,214,47)
LIG(217,52,217,49)
LIG(216,52,219,52)
LIG(216,54,218,52)
LIG(217,54,219,52)
LIG(213,49,219,49)
LIG(215,49,215,55)
LIG(213,47,213,49)
LIG(219,47,213,47)
LIG(219,49,219,47)
LIG(215,41,214,42)
LIG(217,41,215,41)
FSYM
SYM  #light
BB(213,15,219,29)
TITLE 215 30  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
REC(214,17,4,5)
VIS 1
PIN(215,30,0.000,0)nQ
LIG(218,22,218,17)
LIG(218,17,217,16)
LIG(214,17,214,22)
LIG(217,27,217,24)
LIG(216,27,219,27)
LIG(216,29,218,27)
LIG(217,29,219,27)
LIG(213,24,219,24)
LIG(215,24,215,30)
LIG(213,22,213,24)
LIG(219,22,213,22)
LIG(219,24,219,22)
LIG(215,16,214,17)
LIG(217,16,215,16)
FSYM
SYM  #not
BB(100,20,135,40)
TITLE 115 30  #inv
MODEL 101
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(90,0,0,0)
VIS 5
PIN(100,30,0.000,0)in
PIN(135,30,0.050,30)out
LIG(125,32,129,30)
LIG(100,30,110,30)
LIG(110,20,110,40)
LIG(110,40,125,40)
LIG(125,40,125,20)
LIG(125,20,110,20)
LIG(125,30,135,30)
VLG  not inv(out,in);
FSYM
SYM  #light
BB(148,20,154,34)
TITLE 150 20  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(149,28,4,5)
VIS 5
PIN(150,20,0.000,0)out6
LIG(153,28,153,33)
LIG(153,33,152,34)
LIG(149,33,149,28)
LIG(152,23,152,26)
LIG(151,23,154,23)
LIG(151,21,153,23)
LIG(152,21,154,23)
LIG(148,26,154,26)
LIG(150,26,150,20)
LIG(148,28,148,26)
LIG(154,28,148,28)
LIG(154,26,154,28)
LIG(150,34,149,33)
LIG(152,34,150,34)
FSYM
CNC(30 110)
CNC(80 110)
CNC(55 75)
CNC(125 110)
CNC(155 75)
CNC(25 95)
CNC(55 75)
LIG(110,55,115,55)
LIG(55,105,55,120)
LIG(35,95,15,95)
LIG(30,75,30,110)
LIG(15,55,20,55)
LIG(40,55,40,75)
LIG(70,75,40,75)
LIG(90,75,110,75)
LIG(135,95,135,115)
LIG(55,75,55,85)
LIG(15,110,115,110)
LIG(80,95,80,110)
LIG(125,75,125,110)
LIG(115,110,175,110)
LIG(175,95,175,110)
LIG(135,55,135,75)
LIG(135,75,165,75)
LIG(185,75,205,75)
LIG(205,75,205,55)
LIG(170,55,170,30)
LIG(170,30,215,30)
LIG(205,55,215,55)
LIG(155,75,155,85)
LIG(155,105,155,120)
LIG(25,95,25,115)
LIG(25,115,135,115)
LIG(110,55,110,75)
FFIG C:\Dsch 2.0\Manual\bug.sch
