DSCH 2.1d
VERSION 14/11/00 17:02:00
BB(106,10,229,75)
SYM  #button1
BB(106,21,115,29)
TITLE 110 25  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(107,22,6,6,r)
VIS 1
PIN(115,25,0.000,0.000)in1
LIG(114,25,115,25)
LIG(106,29,106,21)
LIG(114,29,106,29)
LIG(114,21,114,29)
LIG(106,21,114,21)
LIG(107,28,107,22)
LIG(113,28,107,28)
LIG(113,22,113,28)
LIG(107,22,113,22)
FSYM
SYM  #button2
BB(106,31,115,39)
TITLE 110 35  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(107,32,6,6,r)
VIS 1
PIN(115,35,0.000,0.000)in2
LIG(114,35,115,35)
LIG(106,39,106,31)
LIG(114,39,106,39)
LIG(114,31,114,39)
LIG(106,31,114,31)
LIG(107,38,107,32)
LIG(113,38,107,38)
LIG(113,32,113,38)
LIG(107,32,113,32)
FSYM
SYM  #button3
BB(106,41,115,49)
TITLE 110 45  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(107,42,6,6,r)
VIS 1
PIN(115,45,0.000,0.000)in3
LIG(114,45,115,45)
LIG(106,49,106,41)
LIG(114,49,106,49)
LIG(114,41,114,49)
LIG(106,41,114,41)
LIG(107,48,107,42)
LIG(113,48,107,48)
LIG(113,42,113,48)
LIG(107,42,113,42)
FSYM
SYM  #button4
BB(106,51,115,59)
TITLE 110 55  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(107,52,6,6,r)
VIS 1
PIN(115,55,0.000,0.000)in4
LIG(114,55,115,55)
LIG(106,59,106,51)
LIG(114,59,106,59)
LIG(114,51,114,59)
LIG(106,51,114,51)
LIG(107,58,107,52)
LIG(113,58,107,58)
LIG(113,52,113,58)
LIG(107,52,113,52)
FSYM
SYM  #button5
BB(106,61,115,69)
TITLE 110 65  #button
MODEL 59
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(107,62,6,6,r)
VIS 1
PIN(115,65,0.000,0.000)in5
LIG(114,65,115,65)
LIG(106,69,106,61)
LIG(114,69,106,69)
LIG(114,61,114,69)
LIG(106,61,114,61)
LIG(107,68,107,62)
LIG(113,68,107,68)
LIG(113,62,113,68)
LIG(107,62,113,62)
FSYM
SYM  #Alu1bit
BB(140,15,170,75)
TITLE 150 25  #Alu1bit
MODEL 6000
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(145,20,20,50,r)
VIS 5
PIN(140,65,0.000,0.000)A
PIN(140,55,0.000,0.000)B
PIN(140,45,0.000,0.000)CarryIn
PIN(140,35,0.000,0.000)S1
PIN(140,25,0.000,0.000)S2
PIN(170,35,1.000,0.000)CarrySum
PIN(170,45,1.000,0.000)Borrow
PIN(170,25,1.000,0.000)ResAlu
LIG(140,65,145,65)
LIG(140,55,145,55)
LIG(140,45,145,45)
LIG(140,35,145,35)
LIG(140,25,145,25)
LIG(165,35,170,35)
LIG(165,45,170,45)
LIG(165,25,170,25)
LIG(145,20,145,70)
LIG(145,20,165,20)
LIG(165,20,165,70)
LIG(165,70,145,70)
VLG module fadd( C,B,A,Sum,Carry);
VLG  input C,B,A;
VLG  output Sum,Carry;
VLG  wire w1,w2,w3,w4,w5,w6;
VLG  xor xor21(Sum,w3,C);
VLG  xor xor22(w3,A,B);
VLG  nand nand21(w6,B,A);
VLG  nand nand22(w5,B,C);
VLG  nand nand23(w4,A,C);
VLG  nand nand31(Carry,w6,w5,w4);
VLG endmodule
VLG  
VLG module mux4to1( S1,A,B,S2,C,D,out1);
VLG  input S1,A,B,S2,C,D;
VLG  output out1;
VLG  wire w1,w2,w3,w4,w5,w6;
VLG  nmos nmos1(out1,w6,w5);
VLG  nmos nmos2(out1,w4,S2);
VLG  nmos nmos3(w4,B,w3);
VLG  nmos nmos4(w6,D,w3);
VLG  nmos nmos5(w6,C,S1);
VLG  nmos nmos6(w4,A,S1);
VLG  not not11(w5,S2);
VLG  not not12(w3,S1);
VLG endmodule
VLG  
VLG module Alu1bit( A,B,CarryIn,S1,S2,CarrySum,Borrow,ResAlu);
VLG  input A,B,CarryIn,S1,S2;
VLG  output CarrySum,Borrow,ResAlu;
VLG  wire w1,w2,w3,w4,w5,w6,w7,w8;
VLG  wire w9,w10,w11,w12,w13,w14,w15,w16;
VLG  wire w17,w18,w19;
VLG  not not11(w3,A);
VLG  fadd fadd1( w3,B,CarryIn,w5,Borrow);
VLG  fadd fadd2( CarryIn,B,A,w4,CarrySum);
VLG  and and21(w6,B,A);
VLG  or or21(w7,A,B);
VLG  mux4to1 mux4to11( S1,w7,w6,S2,w5,w4,ResAlu);
VLG endmodule
FSYM
SYM  #light1
BB(193,10,199,24)
TITLE 195 24  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(194,11,4,4,r)
VIS 1
PIN(195,25,0.000,0.000)out1
LIG(198,16,198,11)
LIG(198,11,197,10)
LIG(194,11,194,16)
LIG(197,21,197,18)
LIG(196,21,199,21)
LIG(196,23,198,21)
LIG(197,23,199,21)
LIG(193,18,199,18)
LIG(195,18,195,25)
LIG(193,16,193,18)
LIG(199,16,193,16)
LIG(199,18,199,16)
LIG(195,10,194,11)
LIG(197,10,195,10)
FSYM
SYM  #light2
BB(213,20,219,34)
TITLE 215 34  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(214,21,4,4,r)
VIS 1
PIN(215,35,0.000,0.000)out2
LIG(218,26,218,21)
LIG(218,21,217,20)
LIG(214,21,214,26)
LIG(217,31,217,28)
LIG(216,31,219,31)
LIG(216,33,218,31)
LIG(217,33,219,31)
LIG(213,28,219,28)
LIG(215,28,215,35)
LIG(213,26,213,28)
LIG(219,26,213,26)
LIG(219,28,219,26)
LIG(215,20,214,21)
LIG(217,20,215,20)
FSYM
SYM  #light3
BB(223,30,229,44)
TITLE 225 44  #light
MODEL 49
PROP                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
REC(224,31,4,4,r)
VIS 1
PIN(225,45,0.000,0.000)out3
LIG(228,36,228,31)
LIG(228,31,227,30)
LIG(224,31,224,36)
LIG(227,41,227,38)
LIG(226,41,229,41)
LIG(226,43,228,41)
LIG(227,43,229,41)
LIG(223,38,229,38)
LIG(225,38,225,45)
LIG(223,36,223,38)
LIG(229,36,223,36)
LIG(229,38,229,36)
LIG(225,30,224,31)
LIG(227,30,225,30)
FSYM
LIG(115,25,140,25)
LIG(115,35,140,35)
LIG(115,45,140,45)
LIG(115,55,140,55)
LIG(115,65,140,65)
LIG(170,25,195,25)
LIG(170,35,215,35)
LIG(170,45,225,45)
FFIG C:\Dsch 2.0\Manual uw2\Alu1bitTest.sch
