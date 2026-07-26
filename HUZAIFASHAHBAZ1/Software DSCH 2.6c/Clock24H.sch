DSCH 2.5a
VERSION 16/03/02 23:14:15
BB(-175,55,100,250)
SYM  #Div_60es
BB(-120,95,-90,185)
TITLE -110 95  #Div_60es
MODEL 6000
PROP                                                                                                                                                                                                            
REC(-115,100,20,80,r)
VIS 5
PIN(-120,135,0.000,0.070)clk1
PIN(-120,125,0.000,0.070)Enable
PIN(-120,115,0.000,0.070)Raz
PIN(-120,105,0.000,0.070)ResetB
PIN(-90,135,0.040,0.420)U_A
PIN(-90,125,0.040,0.350)U_B
PIN(-90,115,0.040,0.350)U_C
PIN(-90,105,0.040,0.420)U_D
PIN(-90,165,0.040,0.350)D_B
PIN(-90,145,0.040,0.420)Sup59
PIN(-90,155,0.040,0.420)D_C
PIN(-90,175,0.040,0.420)D_A
LIG(-120,135,-115,135)
LIG(-120,125,-115,125)
LIG(-120,115,-115,115)
LIG(-120,105,-115,105)
LIG(-95,135,-90,135)
LIG(-95,125,-90,125)
LIG(-95,115,-90,115)
LIG(-95,105,-90,105)
LIG(-95,165,-90,165)
LIG(-95,145,-90,145)
LIG(-95,155,-90,155)
LIG(-95,175,-90,175)
LIG(-115,100,-115,180)
LIG(-115,100,-95,100)
LIG(-95,100,-95,180)
LIG(-95,180,-115,180)
VLG module Div_60es( clk1,Enable,Raz,ResetB,U_A,U_B,U_C,U_D,
VLG  D_B,Sup59,D_C,D_A);
VLG  input clk1,Enable,Raz,ResetB;
VLG  output U_A,U_B,U_C,U_D,D_B,Sup59,D_C,D_A;
VLG  wire w15,w16,w17,w18,w19,w20,w21,w22;
VLG  wire w23,w24,w25,w26,w27,w28,w29,w30;
VLG  wire w31,w32,w33,w34,w35,w36,w37,w38;
VLG  wire w39,w40,w41,w42,w43,w44,w45,w46;
VLG  and and2(Sup59,w10,w6)
VLG  and and2_Di1(w16,ResetB,w15)
VLG  not not1_Di2(w6,w15)
VLG  nand nand3_Di3(w15,U_D,U_A,Enable)
VLG  xor xor2_T_1_Di4(w18,U_B,w17)
VLG  and and2_T_2_Di5(w19,w16,w18)
VLG  dreg dreg3_T_3_Di6(U_B,w20,w19,Raz,clk1)
VLG  and and2_T_4_Di7(w21,w17,U_B)
VLG  xor xor2_T_5_Di8(w22,U_A,Enable)
VLG  and and2_T_6_Di9(w23,w16,w22)
VLG  dreg dreg3_T_7_Di10(U_A,w24,w23,Raz,clk1)
VLG  and and2_T_8_Di11(w17,Enable,U_A)
VLG  xor xor2_T_9_Di12(w25,U_C,w21)
VLG  and and2_T_10_Di13(w26,w16,w25)
VLG  dreg dreg3_T_11_Di14(U_C,w27,w26,Raz,clk1)
VLG  and and2_T_12_Di15(w28,w21,U_C)
VLG  xor xor2_T_13_Di16(w29,U_D,w28)
VLG  and and2_T_14_Di17(w30,w16,w29)
VLG  dreg dreg3_T_15_Di18(U_D,w31,w30,Raz,clk1)
VLG  and and2_T_16_Di19(w32,w28,U_D)
VLG  nand nand3_Di20(w33,w6,D_C,D_A)
VLG  not not1_Di21(w10,w33)
VLG  and and2_Di22(w34,ResetB,w33)
VLG  xor xor2_T_1_Di23(w36,D_B,w35)
VLG  and and2_T_2_Di24(w37,w34,w36)
VLG  dreg dreg3_T_3_Di25(D_B,w38,w37,Raz,clk1)
VLG  and and2_T_4_Di26(w39,w35,D_B)
VLG  xor xor2_T_5_Di27(w40,D_C,w39)
VLG  and and2_T_6_Di28(w41,w34,w40)
VLG  dreg dreg3_T_7_Di29(D_C,w42,w41,Raz,clk1)
VLG  and and2_T_8_Di30(w43,w39,D_C)
VLG  xor xor2_T_9_Di31(w44,D_A,w6)
VLG  and and2_T_10_Di32(w45,w34,w44)
VLG  dreg dreg3_T_11_Di33(D_A,w46,w45,Raz,clk1)
VLG  and and2_T_12_Di34(w35,w6,D_A)
VLG endmodule
FSYM
SYM  #button5
BB(-174,186,-165,194)
TITLE -170 190  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(-173,187,6,6,r)
VIS 1
PIN(-165,190,0.000,0.980)Raz
LIG(-166,190,-165,190)
LIG(-174,194,-174,186)
LIG(-166,194,-174,194)
LIG(-166,186,-166,194)
LIG(-174,186,-166,186)
LIG(-173,193,-173,187)
LIG(-167,193,-173,193)
LIG(-167,187,-167,193)
LIG(-173,187,-167,187)
FSYM
SYM  #vdd
BB(-170,90,-160,100)
TITLE -167 96  #vdd
MODEL 1
PROP                                                                                                                                                                                                            
REC(5,-25,0,0,
)
VIS 0
PIN(-165,100,0.000,0.420)vdd
LIG(-165,100,-165,95)
LIG(-165,95,-170,95)
LIG(-170,95,-165,90)
LIG(-165,90,-160,95)
LIG(-160,95,-165,95)
FSYM
SYM  #clock2
BB(-175,227,-160,233)
TITLE -170 230  #clock
MODEL 69
PROP   1.000 1.000                                                                                                                                                                                                        
REC(-173,228,6,4,r)
VIS 1
PIN(-160,230,1.000,0.630)Quartz
LIG(-165,230,-160,230)
LIG(-170,228,-172,228)
LIG(-166,228,-168,228)
LIG(-165,227,-165,233)
LIG(-175,233,-175,227)
LIG(-170,232,-170,228)
LIG(-168,228,-168,232)
LIG(-168,232,-170,232)
LIG(-172,232,-174,232)
LIG(-172,228,-172,232)
LIG(-165,233,-175,233)
LIG(-165,227,-175,227)
FSYM
SYM  #Div_24es
BB(-35,170,-5,250)
TITLE -25 170  #Div_24es
MODEL 6000
PROP                                                                                                                                                                                                            
REC(-30,175,20,70,r)
VIS 5
PIN(-35,200,0.000,0.070)clk1
PIN(-35,190,0.000,0.070)Enable
PIN(-35,180,0.000,0.070)Raz
PIN(-5,180,0.040,0.420)u_d
PIN(-5,190,0.040,0.350)u_c
PIN(-5,200,0.040,0.420)u_b
PIN(-5,210,0.040,0.490)u_a
PIN(-5,240,0.040,0.420)D_A
PIN(-5,230,0.040,0.490)D_B
PIN(-5,220,0.040,0.140)Sup23
LIG(-35,200,-30,200)
LIG(-35,190,-30,190)
LIG(-35,180,-30,180)
LIG(-10,180,-5,180)
LIG(-10,190,-5,190)
LIG(-10,200,-5,200)
LIG(-10,210,-5,210)
LIG(-10,240,-5,240)
LIG(-10,230,-5,230)
LIG(-10,220,-5,220)
LIG(-30,175,-30,245)
LIG(-30,175,-10,175)
LIG(-10,175,-10,245)
LIG(-10,245,-30,245)
VLG module Div_24es( clk1,Enable,Raz,u_d,u_c,u_b,u_a,D_A,
VLG  D_B,Sup23);
VLG  input clk1,Enable,Raz;
VLG  output u_d,u_c,u_b,u_a,D_A,D_B,Sup23;
VLG  wire w15,w16,w17,w18,w19,w20,w21,w22;
VLG  wire w23,w24,w25,w26,w27,w28,w29,w30;
VLG  wire w31,w32,w33,w34,w35,w36,w37,w38;
VLG  wire w39,w40,w41,w42;
VLG  not not1(Sup23,w4)
VLG  nand nand3(w4,Enable,D_B,w14)
VLG  and and2(w14,u_a,u_b)
VLG  and and2_Di1(w16,w4,w15)
VLG  not not1_Di2(w6,w15)
VLG  nand nand3_Di3(w15,u_d,u_a,Enable)
VLG  xor xor2_T_1_Di4(w18,u_b,w17)
VLG  and and2_T_2_Di5(w19,w16,w18)
VLG  dreg dreg3_T_3_Di6(u_b,w20,w19,Raz,clk1)
VLG  and and2_T_4_Di7(w21,w17,u_b)
VLG  xor xor2_T_5_Di8(w22,u_a,Enable)
VLG  and and2_T_6_Di9(w23,w16,w22)
VLG  dreg dreg3_T_7_Di10(u_a,w24,w23,Raz,clk1)
VLG  and and2_T_8_Di11(w17,Enable,u_a)
VLG  xor xor2_T_9_Di12(w25,u_c,w21)
VLG  and and2_T_10_Di13(w26,w16,w25)
VLG  dreg dreg3_T_11_Di14(u_c,w27,w26,Raz,clk1)
VLG  and and2_T_12_Di15(w28,w21,u_c)
VLG  xor xor2_T_13_Di16(w29,u_d,w28)
VLG  and and2_T_14_Di17(w30,w16,w29)
VLG  dreg dreg3_T_15_Di18(u_d,w31,w30,Raz,clk1)
VLG  and and2_T_16_Di19(w32,w28,u_d)
VLG  not not1_Di20(w10,w33)
VLG  nand nand3_Di21(w33,D_A,D_B,w6)
VLG  and and2_Di22(w34,w4,w33)
VLG  xor xor2_T_1_Di23(w36,D_B,w35)
VLG  and and2_T_2_Di24(w37,w34,w36)
VLG  dreg dreg3_T_3_Di25(D_B,w38,w37,Raz,clk1)
VLG  and and2_T_4_Di26(w39,w35,D_B)
VLG  xor xor2_T_5_Di27(w40,D_A,w6)
VLG  and and2_T_6_Di28(w41,w34,w40)
VLG  dreg dreg3_T_7_Di29(D_A,w42,w41,Raz,clk1)
VLG  and and2_T_8_Di30(w35,w6,D_A)
VLG endmodule
FSYM
SYM  #Min2
BB(50,55,75,95)
TITLE 50 88  #digit
MODEL 89
PROP                                                                                                                                                                                                            
REC(55,65,15,21,r)
VIS 2
PIN(55,95,0.000,0.070)Min24
PIN(60,95,0.000,0.350)Min23
PIN(65,95,0.000,0.280)Min22
PIN(70,95,0.000,0.350)Min21
PIN(70,55,0.000,0.350)Min20
LIG(70,55,70,56)
LIG(70,58,70,58)
LIG(50,60,50,90)
LIG(75,60,50,60)
LIG(75,90,75,60)
LIG(50,90,75,90)
LIG(55,90,55,95)
LIG(60,90,60,95)
LIG(65,90,65,95)
LIG(70,90,70,95)
FSYM
SYM  #Min
BB(75,55,100,95)
TITLE 75 88  #digit
MODEL 89
PROP                                                                                                                                                                                                            
REC(80,65,15,21,r)
VIS 2
PIN(80,95,0.000,0.350)Min4
PIN(85,95,0.000,0.280)Min3
PIN(90,95,0.000,0.280)Min2
PIN(95,95,0.000,0.350)Min1
PIN(95,55,0.000,0.350)Min0
LIG(95,55,95,56)
LIG(95,58,95,58)
LIG(75,60,75,90)
LIG(100,60,75,60)
LIG(100,90,100,60)
LIG(75,90,100,90)
LIG(80,90,80,95)
LIG(85,90,85,95)
LIG(90,90,90,95)
LIG(95,90,95,95)
FSYM
SYM  #vss
BB(-25,57,-15,65)
TITLE -21 62  #vss
MODEL 0
PROP                                                                                                                                                                                                            
REC(-25,55,0,0,b)
VIS 0
PIN(-20,55,0.000,0.350)vss
LIG(-20,55,-20,60)
LIG(-25,60,-15,60)
LIG(-25,63,-23,60)
LIG(-23,63,-21,60)
LIG(-21,63,-19,60)
LIG(-19,63,-17,60)
FSYM
SYM  #Hour2
BB(-10,55,15,95)
TITLE -10 88  #digit
MODEL 89
PROP                                                                                                                                                                                                            
REC(-5,65,15,21,r)
VIS 2
PIN(-5,95,0.000,0.070)Hour24
PIN(0,95,0.000,0.070)Hour23
PIN(5,95,0.000,0.420)Hour22
PIN(10,95,0.000,0.350)Hour21
PIN(10,55,0.000,0.350)Hour20
LIG(10,55,10,56)
LIG(10,58,10,58)
LIG(-10,60,-10,90)
LIG(15,60,-10,60)
LIG(15,90,15,60)
LIG(-10,90,15,90)
LIG(-5,90,-5,95)
LIG(0,90,0,95)
LIG(5,90,5,95)
LIG(10,90,10,95)
FSYM
SYM  #Hour1
BB(20,55,45,95)
TITLE 20 88  #digit
MODEL 89
PROP                                                                                                                                                                                                            
REC(25,65,15,21,r)
VIS 2
PIN(25,95,0.000,0.350)Hour14
PIN(30,95,0.000,0.280)Hour13
PIN(35,95,0.000,0.350)Hour12
PIN(40,95,0.000,0.420)Hour11
PIN(40,55,0.000,0.350)Hour10
LIG(40,55,40,56)
LIG(40,58,40,58)
LIG(20,60,20,90)
LIG(45,60,20,60)
LIG(45,90,45,60)
LIG(20,90,45,90)
LIG(25,90,25,95)
LIG(30,90,30,95)
LIG(35,90,35,95)
LIG(40,90,40,95)
FSYM
SYM  #buf1
BB(-130,220,-95,240)
TITLE -115 230  #1
MODEL 111
PROP                                                                                                                                                                                                            
REC(-130,220,0,0,P)
VIS 4
PIN(-130,230,0.000,0.630)in
PIN(-95,230,0.500,0.490)out
LIG(-130,230,-120,230)
LIG(-120,220,-120,240)
LIG(-120,240,-105,240)
LIG(-105,240,-105,220)
LIG(-105,220,-120,220)
LIG(-105,230,-95,230)
VLG      buf buf1(out,in);
FSYM
CNC(-160 190)
CNC(-160 190)
CNC(-150 230)
CNC(-165 125)
CNC(-165 105)
LIG(-5,230,5,230)
LIG(-5,240,10,240)
LIG(-90,105,80,105)
LIG(80,105,80,95)
LIG(-5,210,40,210)
LIG(35,95,35,200)
LIG(-5,200,35,200)
LIG(40,95,40,210)
LIG(30,95,30,190)
LIG(-5,190,30,190)
LIG(25,95,25,180)
LIG(-5,180,25,180)
LIG(-90,165,65,165)
LIG(10,95,10,240)
LIG(-65,175,-65,170)
LIG(-90,175,-65,175)
LIG(90,125,90,95)
LIG(-90,115,85,115)
LIG(95,95,95,135)
LIG(-165,100,-165,105)
LIG(85,115,85,95)
LIG(-65,170,70,170)
LIG(-90,125,90,125)
LIG(-20,55,95,55)
LIG(-90,135,95,135)
LIG(-165,105,-165,125)
LIG(-150,135,-120,135)
LIG(-160,115,-120,115)
LIG(-65,180,-35,180)
LIG(-150,230,-130,230)
LIG(-165,105,-120,105)
LIG(-65,190,-65,180)
LIG(-45,200,-35,200)
LIG(-160,190,-65,190)
LIG(-165,190,-160,190)
LIG(-160,115,-160,190)
LIG(-45,230,-45,200)
LIG(-50,190,-35,190)
LIG(-90,145,-50,145)
LIG(5,95,5,230)
LIG(70,95,70,170)
LIG(-165,125,-120,125)
LIG(65,95,65,165)
LIG(-95,230,-45,230)
LIG(-150,135,-150,230)
LIG(-160,230,-150,230)
LIG(-165,105,-165,125)
LIG(-90,155,60,155)
LIG(60,155,60,95)
LIG(-50,145,-50,190)
FFIG C:\Dsch2\Book on CMOS\Clock24H.sch
