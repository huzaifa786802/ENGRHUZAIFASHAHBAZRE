DSCH 2.2b
VERSION 28/06/01 23:49:09
BB(11,-4,109,55)
SYM  #nmos
BB(30,0,50,20)
TITLE 35 15  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                        
REC(30,1,15,19,r)
VIS 5
PIN(30,20,0.000,0.000)source
PIN(40,0,0.000,0.000)gate
PIN(50,20,1.000,1.000)drain
LIG(40,10,40,0)
LIG(34,10,46,10)
LIG(34,12,46,12)
LIG(46,20,46,12)
LIG(50,20,46,20)
LIG(34,20,34,12)
LIG(30,20,34,20)
VLG    nmos nmos(drain,source,gate);
FSYM
SYM  #pmos
BB(75,35,95,55)
TITLE 90 40  #pmos
MODEL 902
PROP   2.0u 0.25u                                                                                                                                                                                                        
REC(80,35,15,19,r)
VIS 5
PIN(75,35,0.000,0.000)source
PIN(85,55,0.000,0.000)gate
PIN(95,35,1.000,1.000)drain
LIG(85,55,85,49)
LIG(85,47,85,47)
LIG(91,45,79,45)
LIG(91,43,79,43)
LIG(79,35,79,43)
LIG(75,35,79,35)
LIG(91,35,91,43)
LIG(95,35,91,35)
VLG    pmos pmos(drain,source,gate);
FSYM
SYM  #button1
BB(11,-4,20,4)
TITLE 15 0  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(12,-3,6,6,r)
VIS 1
PIN(20,0,0.000,0.000)Gate
LIG(19,0,20,0)
LIG(11,4,11,-4)
LIG(19,4,11,4)
LIG(19,-4,19,4)
LIG(11,-4,19,-4)
LIG(12,3,12,-3)
LIG(18,3,12,3)
LIG(18,-3,18,3)
LIG(12,-3,18,-3)
FSYM
SYM  #button2
BB(11,16,20,24)
TITLE 15 20  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(12,17,6,6,r)
VIS 1
PIN(20,20,0.000,0.000)Data
LIG(19,20,20,20)
LIG(11,24,11,16)
LIG(19,24,11,24)
LIG(19,16,19,24)
LIG(11,16,19,16)
LIG(12,23,12,17)
LIG(18,23,12,23)
LIG(18,17,18,23)
LIG(12,17,18,17)
FSYM
SYM  #light1
BB(78,5,84,19)
TITLE 80 19  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(79,6,4,4,r)
VIS 1
PIN(80,20,0.000,0.000)nMOS_Out
LIG(83,11,83,6)
LIG(83,6,82,5)
LIG(79,6,79,11)
LIG(82,16,82,13)
LIG(81,16,84,16)
LIG(81,18,83,16)
LIG(82,18,84,16)
LIG(78,13,84,13)
LIG(80,13,80,20)
LIG(78,11,78,13)
LIG(84,11,78,11)
LIG(84,13,84,11)
LIG(80,5,79,6)
LIG(82,5,80,5)
FSYM
SYM  #light2
BB(103,20,109,34)
TITLE 105 34  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(104,21,4,4,r)
VIS 1
PIN(105,35,0.000,0.000)pMOS_Out
LIG(108,26,108,21)
LIG(108,21,107,20)
LIG(104,21,104,26)
LIG(107,31,107,28)
LIG(106,31,109,31)
LIG(106,33,108,31)
LIG(107,33,109,31)
LIG(103,28,109,28)
LIG(105,28,105,35)
LIG(103,26,103,28)
LIG(109,26,103,26)
LIG(109,28,109,26)
LIG(105,20,104,21)
LIG(107,20,105,20)
FSYM
CNC(25 20)
LIG(20,0,65,0)
LIG(95,35,105,35)
LIG(65,0,65,55)
LIG(65,55,85,55)
LIG(20,20,25,20)
LIG(25,20,25,35)
LIG(25,35,75,35)
LIG(50,20,80,20)
LIG(25,20,30,20)
FFIG C:\Dsch 2.0\Manual uw2\MosExplain.sch
