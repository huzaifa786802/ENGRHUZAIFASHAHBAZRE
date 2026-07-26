DSCH 2.4c
VERSION 13/03/02 08:58:07
BB(31,-5,209,125)
SYM  #buf1
BB(40,10,60,45)
TITLE 50 25  #1
MODEL 111
PROP                                                                                                                                                                                                            
REC(60,10,0,0,P)
VIS 4
PIN(50,10,0.000,0.070)in
PIN(50,45,0.040,0.350)out
LIG(50,10,50,20)
LIG(60,20,40,20)
LIG(40,20,40,35)
LIG(40,35,60,35)
LIG(60,35,60,20)
LIG(50,35,50,45)
VLG   buf buf1(out,in);
FSYM
SYM  #buf1
BB(165,50,200,70)
TITLE 180 60  #1
MODEL 111
PROP                                                                                                                                                                                                            
REC(165,50,0,0,P)
VIS 4
PIN(165,60,0.000,0.350)in
PIN(200,60,0.000,0.280)out
LIG(165,60,175,60)
LIG(175,50,175,70)
LIG(175,70,190,70)
LIG(190,70,190,50)
LIG(190,50,175,50)
LIG(190,60,200,60)
VLG    buf buf1(out,in);
FSYM
SYM  #button1
BB(31,56,40,64)
TITLE 35 60  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(32,57,6,6,r)
VIS 1
PIN(40,60,0.000,0.210)d
LIG(39,60,40,60)
LIG(31,64,31,56)
LIG(39,64,31,64)
LIG(39,56,39,64)
LIG(31,56,39,56)
LIG(32,63,32,57)
LIG(38,63,32,63)
LIG(38,57,38,63)
LIG(32,57,38,57)
FSYM
SYM  #tgate
BB(110,100,130,120)
TITLE 115 115  #tgate
MODEL 6000
PROP   2.4 1.2                                                                                                                                                                                                       
REC(240,0,0,0,)
VIS 5
PIN(130,110,0.000,0.000)in
PIN(120,100,0.000,0.000)en
PIN(110,110,0.040,0.140)out
LIG(130,110,125,110)
LIG(120,100,120,110)
LIG(115,110,110,110)
LIG(125,115,125,105)
LIG(115,115,115,105)
LIG(125,115,115,105)
LIG(125,105,115,115)
VLG  // transmission gate description
VLG  module tgate(in,en,out);
VLG   input in,en;
VLG   output out;
VLG   wire nEn;
VLG   not  not1(nEn,en);
VLG   nmos nmos1(out,in,en);
VLG   pmos pmos1(out,in,nEn);
VLG  endmodule
FSYM
SYM  #button2
BB(31,1,40,9)
TITLE 35 5  #button
MODEL 59
PROP                                                                                                                                                                                                            
REC(32,2,6,6,r)
VIS 1
PIN(40,5,0.000,0.210)cp
LIG(39,5,40,5)
LIG(31,9,31,1)
LIG(39,9,31,9)
LIG(39,1,39,9)
LIG(31,1,39,1)
LIG(32,8,32,2)
LIG(38,8,32,8)
LIG(38,2,38,8)
LIG(32,2,38,2)
FSYM
SYM  #not
BB(50,-5,85,15)
TITLE 65 5  #1
MODEL 101
PROP                                                                                                                                                                                                            
REC(-5,-5,0,0,)
VIS 4
PIN(50,5,0.000,0.210)in
PIN(85,5,0.000,0.350)out
LIG(75,3,79,5)
LIG(50,5,60,5)
LIG(60,-5,60,15)
LIG(60,15,75,15)
LIG(75,15,75,-5)
LIG(75,-5,60,-5)
LIG(75,5,85,5)
VLG    not not1(out,in);
FSYM
SYM  #light1
BB(203,45,209,59)
TITLE 205 59  #light
MODEL 49
PROP                                                                                                                                                                                                            
REC(204,46,4,4,r)
VIS 1
PIN(205,60,0.000,0.280)q
LIG(208,51,208,46)
LIG(208,46,207,45)
LIG(204,46,204,51)
LIG(207,56,207,53)
LIG(206,56,209,56)
LIG(206,58,208,56)
LIG(207,58,209,56)
LIG(203,53,209,53)
LIG(205,53,205,60)
LIG(203,51,203,53)
LIG(209,51,203,51)
LIG(209,53,209,51)
LIG(205,45,204,46)
LIG(207,45,205,45)
FSYM
SYM  #buf1
BB(100,50,135,70)
TITLE 115 60  #1
MODEL 111
PROP                                                                                                                                                                                                            
REC(100,50,0,0,P)
VIS 4
PIN(100,60,0.000,0.350)in
PIN(135,60,0.000,0.350)out
LIG(100,60,110,60)
LIG(110,50,110,70)
LIG(110,70,125,70)
LIG(125,70,125,50)
LIG(125,50,110,50)
LIG(125,60,135,60)
VLG    buf buf1(out,in);
FSYM
SYM  #tgate
BB(75,50,95,70)
TITLE 90 65  #tgate
MODEL 6000
PROP   2.4 1.2                                                                                                                                                                                                       
REC(0,0,0,0,)
VIS 5
PIN(75,60,0.000,0.000)in
PIN(85,50,0.000,0.000)en
PIN(95,60,0.040,0.140)out
LIG(75,60,80,60)
LIG(85,50,85,60)
LIG(90,60,95,60)
LIG(80,65,80,55)
LIG(90,65,90,55)
LIG(80,65,90,55)
LIG(80,55,90,65)
VLG  // transmission gate description
VLG  module tgate(in,en,out);
VLG   input in,en;
VLG   output out;
VLG   wire nEn;
VLG   not  not1(nEn,en);
VLG   nmos nmos1(out,in,en);
VLG   pmos pmos1(out,in,nEn);
VLG  endmodule
FSYM
SYM  #tgate
BB(140,50,160,70)
TITLE 155 65  #tgate
MODEL 6000
PROP   2.4 1.2                                                                                                                                                                                                       
REC(0,0,0,0,)
VIS 5
PIN(140,60,0.000,0.000)in
PIN(150,50,0.000,0.000)en
PIN(160,60,0.040,0.140)out
LIG(140,60,145,60)
LIG(150,50,150,60)
LIG(155,60,160,60)
LIG(145,65,145,55)
LIG(155,65,155,55)
LIG(145,65,155,55)
LIG(145,55,155,65)
VLG  // transmission gate description
VLG  module tgate(in,en,out);
VLG   input in,en;
VLG   output out;
VLG   wire nEn;
VLG   not  not1(nEn,en);
VLG   nmos nmos1(out,in,en);
VLG   pmos pmos1(out,in,nEn);
VLG  endmodule
FSYM
SYM  #tgate
BB(175,105,195,125)
TITLE 180 120  #tgate
MODEL 6000
PROP   2.4 1.2                                                                                                                                                                                                       
REC(405,20,0,0,)
VIS 5
PIN(195,115,0.000,0.000)in
PIN(185,105,0.000,0.000)en
PIN(175,115,0.040,0.140)out
LIG(195,115,190,115)
LIG(185,105,185,115)
LIG(180,115,175,115)
LIG(190,120,190,110)
LIG(180,120,180,110)
LIG(190,120,180,110)
LIG(190,110,180,120)
VLG  // transmission gate description
VLG  module tgate(in,en,out);
VLG   input in,en;
VLG   output out;
VLG   wire nEn;
VLG   not  not1(nEn,en);
VLG   nmos nmos1(out,in,en);
VLG   pmos pmos1(out,in,nEn);
VLG  endmodule
FSYM
LIG(40,5,50,5)
LIG(85,5,85,50)
LIG(95,60,100,60)
LIG(135,60,140,60)
LIG(200,60,200,115)
LIG(100,110,110,110)
LIG(50,100,120,100)
LIG(100,60,100,110)
LIG(50,5,50,10)
LIG(135,110,130,110)
LIG(160,60,165,60)
LIG(40,60,75,60)
LIG(50,45,150,45)
LIG(50,45,50,100)
LIG(150,45,150,50)
LIG(165,115,175,115)
LIG(135,60,135,110)
LIG(165,60,165,115)
LIG(170,105,185,105)
LIG(200,60,205,60)
LIG(85,5,170,5)
LIG(170,5,170,105)
LIG(195,115,200,115)
FFIG C:\Dsch2\Book on CMOS\Dff.sch
