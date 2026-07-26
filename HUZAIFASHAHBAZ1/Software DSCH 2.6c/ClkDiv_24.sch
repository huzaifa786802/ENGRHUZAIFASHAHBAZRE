DSCH 2.5a
VERSION 16/03/02 22:53:44
BB(-80,65,184,205)
SYM  #Div_10es
BB(15,65,45,125)
TITLE 25 75  #Div_10es
MODEL 6000
PROP                                                                                                                                                                                                            
REC(20,70,20,50,r)
VIS 5
PIN(15,95,0.000,0.070)Enable
PIN(15,85,0.000,0.070)Raz
PIN(15,105,0.000,0.070)Clock
PIN(15,75,0.000,0.070)ResetB
PIN(45,85,0.040,0.420)D
PIN(45,75,0.040,0.350)Sup9
PIN(45,115,0.040,0.490)A
PIN(45,105,0.040,0.420)B
PIN(45,95,0.040,0.350)C
LIG(15,95,20,95)
LIG(15,85,20,85)
LIG(15,105,20,105)
LIG(15,75,20,75)
LIG(40,85,45,85)
LIG(40,75,45,75)
LIG(40,115,45,115)
LIG(40,105,45,105)
LIG(40,95,45,95)
LIG(20,70,20,120)
LIG(20,70,40,70)
LIG(40,70,40,120)
LIG(40,120,20,120)
VLG       module Div_10es( Enable,Raz,Clock,ResetB,D,Sup9,A,B,
VLG        C);
VLG        input Enable,Raz,Clock,ResetB;
VLG        output D,Sup9,A,B,C;
VLG        wire w16,w17,w18,w19,w20,w21,w22,w23;
VLG        wire w24,w25,w26,w27;
VLG        and and2(w5,ResetB,w4)
VLG        not not1(Sup9,w4)
VLG        nand nand3(w4,D,A,Enable)
VLG        xor xor2_T_1(w16,B,w9)
VLG        and and2_T_2(w17,w5,w16)
VLG        dreg dreg3_T_3(B,w18,w17,Raz,Clock)
VLG        and and2_T_4(w11,w9,B)
VLG        xor xor2_T_5(w19,A,Enable)
VLG        and and2_T_6(w20,w5,w19)
VLG        dreg dreg3_T_7(A,w21,w20,Raz,Clock)
VLG        and and2_T_8(w9,Enable,A)
VLG        xor xor2_T_9(w22,C,w11)
VLG        and and2_T_10(w23,w5,w22)
VLG        dreg dreg3_T_11(C,w24,w23,Raz,Clock)
VLG        and and2_T_12(w14,w11,C)
VLG        xor xor2_T_13(w25,D,w14)
VLG        and and2_T_14(w26,w5,w25)
VLG        dreg dreg3_T_15(D,w27,w26,Raz,Clock)
VLG        and and2_T_16(w15,w14,D)
VLG       endmodule
FSYM
SYM  #Div_3es
BB(110,65,150,115)
TITLE 120 75  #Div_3es
MODEL 6000
PROP                                                                                                                                                                                                            
REC(115,70,30,40,r)
VIS 5
PIN(110,105,0.000,0.070)clk1
PIN(110,95,0.000,0.070)Enable
PIN(110,75,0.000,0.070)ResetB
PIN(110,85,0.000,0.070)Raz
PIN(150,75,0.040,0.140)Sup3
PIN(150,95,0.040,0.420)A
PIN(150,85,0.040,0.490)B
LIG(110,105,115,105)
LIG(110,95,115,95)
LIG(110,75,115,75)
LIG(110,85,115,85)
LIG(145,75,150,75)
LIG(145,95,150,95)
LIG(145,85,150,85)
LIG(115,70,115,110)
LIG(115,70,145,70)
LIG(145,70,145,110)
LIG(145,110,115,110)
VLG     module Div_3es( clk1,Enable,ResetB,Raz,Sup3,A,B);
VLG      input clk1,Enable,ResetB,Raz;
VLG      output Sup3,A,B;
VLG      wire w12,w13,w14,w15,w16,w17;
VLG      not not1(Sup3,w2)
VLG      nand nand3(w2,A,B,Enable)
VLG      and and2(w7,ResetB,w2)
VLG      xor xor2_T_1(w12,B,w6)
VLG      and and2_T_2(w13,w7,w12)
VLG      dreg dreg3_T_3(B,w14,w13,Raz,clk1)
VLG      and and2_T_4(w10,w6,B)
VLG      xor xor2_T_5(w15,A,Enable)
VLG      and and2_T_6(w16,w7,w15)
VLG      dreg dreg3_T_7(A,w17,w16,Raz,clk1)
VLG      and and2_T_8(w6,Enable,A)
VLG     endmodule
FSYM
SYM  #clock1
BB(-80,102,-65,108)
TITLE -75 105  #clock
MODEL 69
PROP   2.000 2.000                                                                                                                                                                                                        
REC(-78,103,6,4,r)
VIS 1
PIN(-65,105,1.000,0.490)clk1
LIG(-70,105,-65,105)
LIG(-75,103,-77,103)
LIG(-71,103,-73,103)
LIG(-70,102,-70,108)
LIG(-80,108,-80,102)
LIG(-75,107,-75,103)
LIG(-73,103,-73,107)
LIG(-73,107,-75,107)
LIG(-77,107,-79,107)
LIG(-77,103,-77,107)
LIG(-70,108,-80,108)
LIG(-70,102,-80,102)
FSYM
SYM  #button2
BB(-74,91,-65,99)
TITLE -70 95  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-73,92,6,6,r)
VIS 1
PIN(-65,95,0.000,0.350)Enable
LIG(-66,95,-65,95)
LIG(-74,99,-74,91)
LIG(-66,99,-74,99)
LIG(-66,91,-66,99)
LIG(-74,91,-66,91)
LIG(-73,98,-73,92)
LIG(-67,98,-73,98)
LIG(-67,92,-67,98)
LIG(-73,92,-67,92)
FSYM
SYM  #button1
BB(-74,81,-65,89)
TITLE -70 85  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-73,82,6,6,r)
VIS 1
PIN(-65,85,0.000,0.490)Raz
LIG(-66,85,-65,85)
LIG(-74,89,-74,81)
LIG(-66,89,-74,89)
LIG(-66,81,-66,89)
LIG(-74,81,-66,81)
LIG(-73,88,-73,82)
LIG(-67,88,-73,88)
LIG(-67,82,-67,88)
LIG(-73,82,-67,82)
FSYM
SYM  #padout1
BB(60,80,75,90)
TITLE 60 80  #PadOut
MODEL 62
PROP                                                                                                                                                                                                            
REC(62,82,8,8,g)
VIS 1
PIN(60,85,0.000,0.350)u_d
LIG(60,80,70,80)
LIG(70,80,75,85)
LIG(75,85,70,90)
LIG(70,90,60,90)
LIG(60,90,60,80)
LIG(61,81,61,89)
LIG(61,89,69,89)
LIG(69,89,69,81)
LIG(61,81,69,81)
LIG(61,81,69,89)
LIG(69,81,61,89)
FSYM
SYM  #padout2
BB(60,90,75,100)
TITLE 60 90  #PadOut
MODEL 62
PROP                                                                                                                                                                                                            
REC(62,92,8,8,g)
VIS 1
PIN(60,95,0.000,0.280)u_c
LIG(60,90,70,90)
LIG(70,90,75,95)
LIG(75,95,70,100)
LIG(70,100,60,100)
LIG(60,100,60,90)
LIG(61,91,61,99)
LIG(61,99,69,99)
LIG(69,99,69,91)
LIG(61,91,69,91)
LIG(61,91,69,99)
LIG(69,91,61,99)
FSYM
SYM  #padout3
BB(60,100,75,110)
TITLE 60 100  #PadOut
MODEL 62
PROP                                                                                                                                                                                                            
REC(62,102,8,8,g)
VIS 1
PIN(60,105,0.000,0.350)u_b
LIG(60,100,70,100)
LIG(70,100,75,105)
LIG(75,105,70,110)
LIG(70,110,60,110)
LIG(60,110,60,100)
LIG(61,101,61,109)
LIG(61,109,69,109)
LIG(69,109,69,101)
LIG(61,101,69,101)
LIG(61,101,69,109)
LIG(69,101,61,109)
FSYM
SYM  #padout4
BB(60,110,75,120)
TITLE 60 110  #PadOut
MODEL 62
PROP                                                                                                                                                                                                            
REC(62,112,8,8,g)
VIS 1
PIN(60,115,0.000,0.420)u_a
LIG(60,110,70,110)
LIG(70,110,75,115)
LIG(75,115,70,120)
LIG(70,120,60,120)
LIG(60,120,60,110)
LIG(61,111,61,119)
LIG(61,119,69,119)
LIG(69,119,69,111)
LIG(61,111,69,111)
LIG(61,111,69,119)
LIG(69,111,61,119)
FSYM
SYM  #light3
BB(178,80,184,94)
TITLE 180 94  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(179,81,4,4,r)
VIS 1
PIN(180,95,0.000,0.350)D_A
LIG(183,86,183,81)
LIG(183,81,182,80)
LIG(179,81,179,86)
LIG(182,91,182,88)
LIG(181,91,184,91)
LIG(181,93,183,91)
LIG(182,93,184,91)
LIG(178,88,184,88)
LIG(180,88,180,95)
LIG(178,86,178,88)
LIG(184,86,178,86)
LIG(184,88,184,86)
LIG(180,80,179,81)
LIG(182,80,180,80)
FSYM
SYM  #light2
BB(178,70,184,84)
TITLE 180 84  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(179,71,4,4,r)
VIS 1
PIN(180,85,0.000,0.420)D_B
LIG(183,76,183,71)
LIG(183,71,182,70)
LIG(179,71,179,76)
LIG(182,81,182,78)
LIG(181,81,184,81)
LIG(181,83,183,81)
LIG(182,83,184,81)
LIG(178,78,184,78)
LIG(180,78,180,85)
LIG(178,76,178,78)
LIG(184,76,178,76)
LIG(184,78,184,76)
LIG(180,70,179,71)
LIG(182,70,180,70)
FSYM
SYM  #not1
BB(115,170,150,190)
TITLE 130 180  #1
MODEL 101
PROP                                                                                                                                                                                                            
REC(5,20,0,0,r)
VIS 4
PIN(115,180,0.000,0.280)in
PIN(150,180,1.000,0.140)out
LIG(140,178,144,180)
LIG(115,180,125,180)
LIG(125,170,125,190)
LIG(125,190,140,190)
LIG(140,190,140,170)
LIG(140,170,125,170)
LIG(140,180,150,180)
VLG   not not1(out,in);
FSYM
SYM  #nand3
BB(55,165,95,195)
TITLE 69 174  #&
MODEL 203
PROP                                                                                                                                                                                                            
REC(55,165,0,0,P)
VIS 4
PIN(55,170,0.000,0.350)a
PIN(55,180,0.000,0.420)b
PIN(55,190,0.000,0.140)c
PIN(95,180,1.000,0.280)out
LIG(55,190,65,190)
LIG(55,180,65,180)
LIG(55,170,65,170)
LIG(65,165,65,195)
LIG(65,195,85,195)
LIG(85,195,85,165)
LIG(85,165,65,165)
LIG(85,180,95,180)
LIG(85,178,90,180)
VLG          nand nand3(out,a,b,c);
FSYM
SYM  #light1
BB(163,150,169,164)
TITLE 165 164  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(164,151,4,4,r)
VIS 1
PIN(165,165,0.000,0.140)Sup23
LIG(168,156,168,151)
LIG(168,151,167,150)
LIG(164,151,164,156)
LIG(167,161,167,158)
LIG(166,161,169,161)
LIG(166,163,168,161)
LIG(167,163,169,161)
LIG(163,158,169,158)
LIG(165,158,165,165)
LIG(163,156,163,158)
LIG(169,156,163,156)
LIG(169,158,169,156)
LIG(165,150,164,151)
LIG(167,150,165,150)
FSYM
SYM  #and2
BB(-5,180,30,200)
TITLE 7 191  #&
MODEL 402
PROP                                                                                                                                                                                                            
REC(0,0,0,0,)
VIS 4
PIN(-5,195,0.000,0.420)a
PIN(-5,185,0.000,0.350)b
PIN(30,190,2.000,0.140)out
LIG(-5,195,1,195)
LIG(-5,185,1,185)
LIG(1,180,1,200)
LIG(1,200,22,200)
LIG(22,200,22,180)
LIG(22,180,1,180)
LIG(30,190,22,190)
VLG         and and2(out,a,b);
FSYM
CNC(5 105)
CNC(0 85)
CNC(105 180)
CNC(-5 95)
CNC(-5 95)
CNC(-5 95)
CNC(50 115)
CNC(55 105)
CNC(55 105)
CNC(55 105)
CNC(5 75)
CNC(155 85)
LIG(15,85,0,85)
LIG(15,95,-5,95)
LIG(15,105,5,105)
LIG(45,85,60,85)
LIG(45,95,60,95)
LIG(45,105,55,105)
LIG(45,115,50,115)
LIG(45,75,85,75)
LIG(85,75,85,95)
LIG(85,95,110,95)
LIG(5,105,5,125)
LIG(5,125,105,125)
LIG(105,125,105,105)
LIG(105,105,110,105)
LIG(0,85,0,130)
LIG(0,130,100,130)
LIG(100,130,100,85)
LIG(100,85,110,85)
LIG(165,165,165,180)
LIG(105,180,115,180)
LIG(105,205,105,180)
LIG(95,180,105,180)
LIG(105,205,-45,205)
LIG(-45,75,-45,205)
LIG(150,180,165,180)
LIG(-45,75,5,75)
LIG(5,75,15,75)
LIG(-10,185,-5,185)
LIG(30,190,55,190)
LIG(-5,95,-5,170)
LIG(-5,170,55,170)
LIG(-15,135,-15,195)
LIG(45,155,155,155)
LIG(45,155,45,180)
LIG(45,180,55,180)
LIG(50,115,50,135)
LIG(50,135,-15,135)
LIG(-5,195,-15,195)
LIG(-10,145,-10,185)
LIG(55,105,55,145)
LIG(55,145,-10,145)
LIG(5,75,5,65)
LIG(5,65,105,65)
LIG(105,65,105,75)
LIG(105,75,110,75)
LIG(0,85,-65,85)
LIG(-5,95,-65,95)
LIG(5,105,-65,105)
LIG(55,105,60,105)
LIG(50,115,60,115)
LIG(155,85,180,85)
LIG(150,85,155,85)
LIG(150,95,180,95)
LIG(155,155,155,85)
FFIG C:\Dsch2\Book on CMOS\ClkDiv_24.sch
