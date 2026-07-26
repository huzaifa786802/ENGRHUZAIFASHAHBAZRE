DSCH 2.1e
VERSION 12/03/01 09:32:37
BB(6,-26,154,84)
SYM  #button1
BB(6,-4,15,4)
TITLE 10 0  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(7,-3,6,6,r)
VIS 1
PIN(15,0,0.000,0.000)ColumnSelect
LIG(14,0,15,0)
LIG(6,4,6,-4)
LIG(14,4,6,4)
LIG(14,-4,14,4)
LIG(6,-4,14,-4)
LIG(7,3,7,-3)
LIG(13,3,7,3)
LIG(13,-3,13,3)
LIG(7,-3,13,-3)
FSYM
SYM  #button2
BB(6,16,15,24)
TITLE 10 20  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(7,17,6,6,r)
VIS 1
PIN(15,20,0.000,0.000)Write
LIG(14,20,15,20)
LIG(6,24,6,16)
LIG(14,24,6,24)
LIG(14,16,14,24)
LIG(6,16,14,16)
LIG(7,23,7,17)
LIG(13,23,7,23)
LIG(13,17,13,23)
LIG(7,17,13,17)
FSYM
SYM  #button3
BB(6,36,15,44)
TITLE 10 40  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(7,37,6,6,r)
VIS 1
PIN(15,40,0.000,0.000)DataIn
LIG(14,40,15,40)
LIG(6,44,6,36)
LIG(14,44,6,44)
LIG(14,36,14,44)
LIG(6,36,14,36)
LIG(7,43,7,37)
LIG(13,43,7,43)
LIG(13,37,13,43)
LIG(7,37,13,37)
FSYM
SYM  #not1
BB(25,30,60,50)
TITLE 40 40  #1
MODEL 101
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 4
PIN(25,40,0.000,0.000)in
PIN(60,40,1.000,1.000)out
LIG(50,38,54,40)
LIG(25,40,35,40)
LIG(35,30,35,50)
LIG(35,50,50,50)
LIG(50,50,50,30)
LIG(50,30,35,30)
LIG(50,40,60,40)
VLG  not not1(out,in);
FSYM
SYM  #not3st
BB(70,25,105,50)
TITLE 85 40  #1
MODEL 121
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 4
PIN(70,40,0.000,0.000)in
PIN(90,25,0.000,0.000)en
PIN(105,40,2.000,1.000)out
LIG(70,40,80,40)
LIG(80,30,80,50)
LIG(80,50,95,50)
LIG(95,50,95,30)
LIG(95,30,80,30)
LIG(90,25,90,30)
LIG(95,40,105,40)
LIG(95,38,99,40)
VLG  notif1 not3st(out,in,en);
FSYM
SYM  #not3st
BB(70,55,105,80)
TITLE 85 70  #1
MODEL 121
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(0,0,0,0,)
VIS 4
PIN(70,70,0.000,0.000)in
PIN(90,55,0.000,0.000)en
PIN(105,70,2.000,1.000)out
LIG(70,70,80,70)
LIG(80,60,80,80)
LIG(80,80,95,80)
LIG(95,80,95,60)
LIG(95,60,80,60)
LIG(90,55,90,60)
LIG(95,70,105,70)
LIG(95,68,99,70)
VLG  notif1 not3st(out,in,en);
FSYM
SYM  #nmos
BB(100,-10,120,10)
TITLE 115 5  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(101,-5,19,15,r)
VIS 4
PIN(120,10,0.000,0.000)source
PIN(100,0,0.000,0.000)gate
PIN(120,-10,1.000,1.000)drain
LIG(110,0,100,0)
LIG(110,6,110,-6)
LIG(112,6,112,-6)
LIG(120,-6,112,-6)
LIG(120,-10,120,-6)
LIG(120,6,112,6)
LIG(120,10,120,6)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #light1
BB(118,-25,124,-11)
TITLE 120 -11  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(119,-24,4,4,r)
VIS 1
PIN(120,-10,0.000,0.000)Todata
LIG(123,-19,123,-24)
LIG(123,-24,122,-25)
LIG(119,-24,119,-19)
LIG(122,-14,122,-17)
LIG(121,-14,124,-14)
LIG(121,-12,123,-14)
LIG(122,-12,124,-14)
LIG(118,-17,124,-17)
LIG(120,-17,120,-10)
LIG(118,-19,118,-17)
LIG(124,-19,118,-19)
LIG(124,-17,124,-19)
LIG(120,-25,119,-24)
LIG(122,-25,120,-25)
FSYM
SYM  #nmos
BB(130,-10,150,10)
TITLE 145 5  #nmos
MODEL 901
PROP   2.0u 0.25u                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
REC(131,-5,19,15,r)
VIS 4
PIN(150,10,0.000,0.000)source
PIN(130,0,0.000,0.000)gate
PIN(150,-10,1.000,1.000)drain
LIG(140,0,130,0)
LIG(140,6,140,-6)
LIG(142,6,142,-6)
LIG(150,-6,142,-6)
LIG(150,-10,150,-6)
LIG(150,6,142,6)
LIG(150,10,150,6)
VLG  nmos nmos(drain,source,gate);
FSYM
SYM  #light2
BB(148,-25,154,-11)
TITLE 150 -11  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(149,-24,4,4,r)
VIS 1
PIN(150,-10,0.000,0.000)TonData
LIG(153,-19,153,-24)
LIG(153,-24,152,-25)
LIG(149,-24,149,-19)
LIG(152,-14,152,-17)
LIG(151,-14,154,-14)
LIG(151,-12,153,-14)
LIG(152,-12,154,-14)
LIG(148,-17,154,-17)
LIG(150,-17,150,-10)
LIG(148,-19,148,-17)
LIG(154,-19,148,-19)
LIG(154,-17,154,-19)
LIG(150,-25,149,-24)
LIG(152,-25,150,-25)
FSYM
CNC(65 20)
CNC(65 20)
CNC(90 0)
LIG(15,40,25,40)
LIG(60,40,70,40)
LIG(15,20,90,20)
LIG(90,20,90,25)
LIG(65,20,65,55)
LIG(65,55,90,55)
LIG(25,40,25,70)
LIG(25,70,70,70)
LIG(15,0,100,0)
LIG(150,70,150,10)
LIG(105,40,120,40)
LIG(120,40,120,10)
LIG(105,70,150,70)
LIG(90,0,90,15)
LIG(90,15,130,15)
LIG(130,15,130,0)
TEXT 107 46  #DataIn buffer
TEXT 108 74  #DataIn inverted
TEXT 9 -17  #DataIn is amplified, validated and sent to vertical data bus
TEXT 9 -26  #Circuit principles for one column selection
FFIG C:\Dsch 2.0\Manual uw2\RamRow.sch
