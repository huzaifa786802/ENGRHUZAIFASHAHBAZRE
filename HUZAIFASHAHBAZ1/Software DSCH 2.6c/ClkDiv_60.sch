DSCH 2.5a
VERSION 16/03/02 23:12:57
BB(-9,-30,164,70)
SYM  #clock1
BB(0,47,15,53)
TITLE 5 50  #clock
MODEL 69
PROP   2.000 2.000                                                                                                                                                                                                        
REC(2,48,6,4,r)
VIS 1
PIN(15,50,1.000,0.560)clk1
LIG(10,50,15,50)
LIG(5,48,3,48)
LIG(9,48,7,48)
LIG(10,47,10,53)
LIG(0,53,0,47)
LIG(5,52,5,48)
LIG(7,48,7,52)
LIG(7,52,5,52)
LIG(3,52,1,52)
LIG(3,48,3,52)
LIG(10,53,0,53)
LIG(10,47,0,47)
FSYM
SYM  #button2
BB(-9,36,0,44)
TITLE -5 40  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-8,37,6,6,r)
VIS 1
PIN(0,40,0.000,0.280)Enable
LIG(-1,40,0,40)
LIG(-9,44,-9,36)
LIG(-1,44,-9,44)
LIG(-1,36,-1,44)
LIG(-9,36,-1,36)
LIG(-8,43,-8,37)
LIG(-2,43,-8,43)
LIG(-2,37,-2,43)
LIG(-8,37,-2,37)
FSYM
SYM  #button2
BB(6,26,15,34)
TITLE 10 30  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(7,27,6,6,r)
VIS 1
PIN(15,30,0.000,0.560)Raz
LIG(14,30,15,30)
LIG(6,34,6,26)
LIG(14,34,6,34)
LIG(14,26,14,34)
LIG(6,26,14,26)
LIG(7,33,7,27)
LIG(13,33,7,33)
LIG(13,27,13,33)
LIG(7,27,13,27)
FSYM
SYM  #Div_10es
BB(30,10,60,70)
TITLE 40 11  #Div_10es
MODEL 6000
PROP                                                                                                                                                                                                            
REC(35,15,20,50,r)
VIS 5
PIN(30,40,0.000,0.070)Enable
PIN(30,30,0.000,0.070)Raz
PIN(30,50,0.000,0.070)Clock
PIN(30,20,0.000,0.070)ResetB
PIN(60,30,0.040,0.420)D
PIN(60,20,0.040,0.420)Sup9
PIN(60,60,0.040,0.420)A
PIN(60,50,0.040,0.350)B
PIN(60,40,0.040,0.350)C
LIG(30,40,35,40)
LIG(30,30,35,30)
LIG(30,50,35,50)
LIG(30,20,35,20)
LIG(55,30,60,30)
LIG(55,20,60,20)
LIG(55,60,60,60)
LIG(55,50,60,50)
LIG(55,40,60,40)
LIG(35,15,35,65)
LIG(35,15,55,15)
LIG(55,15,55,65)
LIG(55,65,35,65)
VLG module Div_10es( Enable,Raz,Clock,ResetB,D,Sup9,A,B,
VLG  C);
VLG  input Enable,Raz,Clock,ResetB;
VLG  output D,Sup9,A,B,C;
VLG  wire w16,w17,w18,w19,w20,w21,w22,w23;
VLG  wire w24,w25,w26,w27;
VLG  and and2(w5,ResetB,w4)
VLG  not not1(Sup9,w4)
VLG  nand nand3(w4,D,A,Enable)
VLG  xor xor2_T_1(w16,B,w9)
VLG  and and2_T_2(w17,w5,w16)
VLG  dreg dreg3_T_3(B,w18,w17,Raz,Clock)
VLG  and and2_T_4(w11,w9,B)
VLG  xor xor2_T_5(w19,A,Enable)
VLG  and and2_T_6(w20,w5,w19)
VLG  dreg dreg3_T_7(A,w21,w20,Raz,Clock)
VLG  and and2_T_8(w9,Enable,A)
VLG  xor xor2_T_9(w22,C,w11)
VLG  and and2_T_10(w23,w5,w22)
VLG  dreg dreg3_T_11(C,w24,w23,Raz,Clock)
VLG  and and2_T_12(w14,w11,C)
VLG  xor xor2_T_13(w25,D,w14)
VLG  and and2_T_14(w26,w5,w25)
VLG  dreg dreg3_T_15(D,w27,w26,Raz,Clock)
VLG  and and2_T_16(w15,w14,D)
VLG endmodule
FSYM
SYM  #light4
BB(83,45,89,59)
TITLE 85 59  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(84,46,4,4,r)
VIS 1
PIN(85,60,0.000,0.350)U_A
LIG(88,51,88,46)
LIG(88,46,87,45)
LIG(84,46,84,51)
LIG(87,56,87,53)
LIG(86,56,89,56)
LIG(86,58,88,56)
LIG(87,58,89,56)
LIG(83,53,89,53)
LIG(85,53,85,60)
LIG(83,51,83,53)
LIG(89,51,83,51)
LIG(89,53,89,51)
LIG(85,45,84,46)
LIG(87,45,85,45)
FSYM
SYM  #light3
BB(78,35,84,49)
TITLE 80 49  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(79,36,4,4,r)
VIS 1
PIN(80,50,0.000,0.280)U_B
LIG(83,41,83,36)
LIG(83,36,82,35)
LIG(79,36,79,41)
LIG(82,46,82,43)
LIG(81,46,84,46)
LIG(81,48,83,46)
LIG(82,48,84,46)
LIG(78,43,84,43)
LIG(80,43,80,50)
LIG(78,41,78,43)
LIG(84,41,78,41)
LIG(84,43,84,41)
LIG(80,35,79,36)
LIG(82,35,80,35)
FSYM
SYM  #light2
BB(73,25,79,39)
TITLE 75 39  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(74,26,4,4,r)
VIS 1
PIN(75,40,0.000,0.280)U_C
LIG(78,31,78,26)
LIG(78,26,77,25)
LIG(74,26,74,31)
LIG(77,36,77,33)
LIG(76,36,79,36)
LIG(76,38,78,36)
LIG(77,38,79,36)
LIG(73,33,79,33)
LIG(75,33,75,40)
LIG(73,31,73,33)
LIG(79,31,73,31)
LIG(79,33,79,31)
LIG(75,25,74,26)
LIG(77,25,75,25)
FSYM
SYM  #light1
BB(63,-25,69,-11)
TITLE 65 -11  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(64,-24,4,4,r)
VIS 1
PIN(65,-10,0.000,0.350)U_D
LIG(68,-19,68,-24)
LIG(68,-24,67,-25)
LIG(64,-24,64,-19)
LIG(67,-14,67,-17)
LIG(66,-14,69,-14)
LIG(66,-12,68,-14)
LIG(67,-12,69,-14)
LIG(63,-17,69,-17)
LIG(65,-17,65,-10)
LIG(63,-19,63,-17)
LIG(69,-19,63,-19)
LIG(69,-17,69,-19)
LIG(65,-25,64,-24)
LIG(67,-25,65,-25)
FSYM
SYM  #and2
BB(95,-25,130,-5)
TITLE 107 -14  #&
MODEL 402
PROP                                                                                                                                                                                                            
REC(0,0,0,0,)
VIS 4
PIN(95,-10,0.000,0.140)a
PIN(95,-20,0.000,0.350)b
PIN(130,-15,2.000,0.140)out
LIG(95,-10,101,-10)
LIG(95,-20,101,-20)
LIG(101,-25,101,-5)
LIG(101,-5,122,-5)
LIG(122,-5,122,-25)
LIG(122,-25,101,-25)
LIG(130,-15,122,-15)
VLG           and and2(out,a,b);
FSYM
SYM  #light6
BB(148,30,154,44)
TITLE 150 44  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(149,31,4,4,r)
VIS 1
PIN(150,45,0.000,0.280)D_B
LIG(153,36,153,31)
LIG(153,31,152,30)
LIG(149,31,149,36)
LIG(152,41,152,38)
LIG(151,41,154,41)
LIG(151,43,153,41)
LIG(152,43,154,41)
LIG(148,38,154,38)
LIG(150,38,150,45)
LIG(148,36,148,38)
LIG(154,36,148,36)
LIG(154,38,154,36)
LIG(150,30,149,31)
LIG(152,30,150,30)
FSYM
SYM  #light8
BB(133,-30,139,-16)
TITLE 135 -16  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(134,-29,4,4,r)
VIS 1
PIN(135,-15,0.000,0.140)Sup59
LIG(138,-24,138,-29)
LIG(138,-29,137,-30)
LIG(134,-29,134,-24)
LIG(137,-19,137,-22)
LIG(136,-19,139,-19)
LIG(136,-17,138,-19)
LIG(137,-17,139,-19)
LIG(133,-22,139,-22)
LIG(135,-22,135,-15)
LIG(133,-24,133,-22)
LIG(139,-24,133,-24)
LIG(139,-22,139,-24)
LIG(135,-30,134,-29)
LIG(137,-30,135,-30)
FSYM
SYM  #light5
BB(138,20,144,34)
TITLE 140 34  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(139,21,4,4,r)
VIS 1
PIN(140,35,0.000,0.350)D_C
LIG(143,26,143,21)
LIG(143,21,142,20)
LIG(139,21,139,26)
LIG(142,31,142,28)
LIG(141,31,144,31)
LIG(141,33,143,31)
LIG(142,33,144,31)
LIG(138,28,144,28)
LIG(140,28,140,35)
LIG(138,26,138,28)
LIG(144,26,138,26)
LIG(144,28,144,26)
LIG(140,20,139,21)
LIG(142,20,140,20)
FSYM
SYM  #button3
BB(-9,16,0,24)
TITLE -5 20  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-8,17,6,6,r)
VIS 1
PIN(0,20,0.000,0.210)ResetB
LIG(-1,20,0,20)
LIG(-9,24,-9,16)
LIG(-1,24,-9,24)
LIG(-1,16,-1,24)
LIG(-9,16,-1,16)
LIG(-8,23,-8,17)
LIG(-2,23,-8,23)
LIG(-2,17,-2,23)
LIG(-8,17,-2,17)
FSYM
SYM  #light7
BB(158,40,164,54)
TITLE 160 54  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(159,41,4,4,r)
VIS 1
PIN(160,55,0.000,0.350)D_A
LIG(163,46,163,41)
LIG(163,41,162,40)
LIG(159,41,159,46)
LIG(162,51,162,48)
LIG(161,51,164,51)
LIG(161,53,163,51)
LIG(162,53,164,51)
LIG(158,48,164,48)
LIG(160,48,160,55)
LIG(158,46,158,48)
LIG(164,46,158,46)
LIG(164,48,164,46)
LIG(160,40,159,41)
LIG(162,40,160,40)
FSYM
SYM  #Div_6es
BB(100,15,125,65)
TITLE 110 17  #Div_6es
MODEL 6000
PROP                                                                                                                                                                                                            
REC(105,20,15,40,r)
VIS 5
PIN(100,25,0.000,0.070)ResetB
PIN(100,55,0.000,0.070)clk1
PIN(100,35,0.000,0.070)Raz
PIN(100,45,0.000,0.070)Enable
PIN(125,25,0.040,0.210)Sup5
PIN(125,35,0.040,0.420)C
PIN(125,45,0.040,0.350)B
PIN(125,55,0.040,0.420)A
LIG(100,25,105,25)
LIG(100,55,105,55)
LIG(100,35,105,35)
LIG(100,45,105,45)
LIG(120,25,125,25)
LIG(120,35,125,35)
LIG(120,45,125,45)
LIG(120,55,125,55)
LIG(105,20,105,60)
LIG(105,20,120,20)
LIG(120,20,120,60)
LIG(120,60,105,60)
VLG module Div_6es( ResetB,clk1,Raz,Enable,Sup5,C,B,A);
VLG  input ResetB,clk1,Raz,Enable;
VLG  output Sup5,C,B,A;
VLG  wire w14,w15,w16,w17,w18,w19,w20,w21;
VLG  wire w22;
VLG  nand nand3(w13,Enable,C,A)
VLG  not not1(Sup5,w13)
VLG  and and2(w5,ResetB,w13)
VLG  xor xor2_T_1(w14,B,w4)
VLG  and and2_T_2(w15,w5,w14)
VLG  dreg dreg3_T_3(B,w16,w15,Raz,clk1)
VLG  and and2_T_4(w7,w4,B)
VLG  xor xor2_T_5(w17,C,w7)
VLG  and and2_T_6(w18,w5,w17)
VLG  dreg dreg3_T_7(C,w19,w18,Raz,clk1)
VLG  and and2_T_8(w11,w7,C)
VLG  xor xor2_T_9(w20,A,Enable)
VLG  and and2_T_10(w21,w5,w20)
VLG  dreg dreg3_T_11(A,w22,w21,Raz,clk1)
VLG  and and2_T_12(w4,Enable,A)
VLG endmodule
FSYM
CNC(25 50)
CNC(70 20)
CNC(20 20)
CNC(25 30)
LIG(125,25,130,25)
LIG(15,30,25,30)
LIG(25,50,35,50)
LIG(60,30,65,30)
LIG(125,35,140,35)
LIG(125,45,150,45)
LIG(125,55,160,55)
LIG(135,-15,130,-15)
LIG(90,0,90,-10)
LIG(95,-20,70,-20)
LIG(95,-10,90,-10)
LIG(130,0,90,0)
LIG(65,30,65,-10)
LIG(60,40,75,40)
LIG(20,5,95,5)
LIG(25,70,25,50)
LIG(100,25,95,25)
LIG(20,20,30,20)
LIG(130,0,130,25)
LIG(70,-20,70,20)
LIG(95,5,95,25)
LIG(60,50,80,50)
LIG(25,10,90,10)
LIG(90,10,90,35)
LIG(90,35,100,35)
LIG(70,20,85,20)
LIG(85,20,85,45)
LIG(85,45,100,45)
LIG(0,40,30,40)
LIG(15,50,25,50)
LIG(100,55,95,55)
LIG(95,55,95,70)
LIG(95,70,25,70)
LIG(60,20,70,20)
LIG(60,60,85,60)
LIG(0,20,20,20)
LIG(20,20,20,5)
LIG(25,10,25,30)
LIG(25,30,35,30)
FFIG C:\Dsch2\Book on CMOS\ClkDiv_60.sch
