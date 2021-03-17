$ontext
Name: Zuo Zeng
ID: zzz0057
model:artificial lifting selection projects
$offtext
set i number of methods /1*9/
    T time periods /1*12/
;
alias (i,j);
alias (T,t,p,r,k,l);


parameter
        TubingSize Tubing Size continuous  /2.875/
        CICHP Closed in casing head pressure /2500/
        CITHP Closed in tubing head pressure /1200/
        FLP flowline pressure continuous /150/
        FTHP flowing tubing head pressure /300/
        WellDeviation well deviation above end of tubing /60/
        DLS Dogleg Severity /6/
        PTD Production Tubing Diameter/2.875/
        WellDepth  Depth of well /11990/
        Temp  Temperature of well /220/
        WaterCut  Water Cut/0.96/
        TDS Total Dissolved Solids/0.1278/
        BHP Bottomhole Pressure/6300/
        GVF Gas Void Fraction /0.612/
        CasingDiameter Casing diameter /5.5/
        AromaticContent Aromatic content/0.03/
        Pg Price of gas /180/
        Po Price of oil /3000/
        Png Price of natural gas liquid /1500/
        packer /0/
        Tubinguniformity /1/
        TAC /0/
        MCF /0/
        WellboreAccess /1/
        Offshore /0/
        CGA /1/
        EPA /1/
        EPEF /0/
        GPA /1/
        GPEF /0/

;

parameter pp(p)
       /
        1 1
        2 2
        3 3
        4 4
        5 5
        6 6
        7 7
        8 8
        9 9
        10 10
        11 11
        12 12
/
;
parameter rr(r)
       /
        1 1
        2 2
        3 3
        4 4
        5 5
        6 6
        7 7
        8 8
        9 9
        10 10
        11 11
        12 12
/
;
parameter Cm(i) operational cost of method i
       /1  750
        2  208
        3  2500
        4  100
        5  5000
        6  2000
        7  1200
        8  565
        9  600/
;

parameter Co(i) capital cost of method i
       /1  10100
        2  3880
        3  75000
        4  50000
        5  75000
        6  80000
        7  50000
        8  34633
        9  33041/
;

parameter Qgbar(i)
       /1  0.2027
        2  0.1333
        3  0.2027
        4  0.2027
        5  0.912
        6  0.9769
        7  1.0042
        8  0.0333
        9  0.0013/
;

parameter Qobar(i)
       /1  0.2027
        2  0.1333
        3  0.2027
        4  0.2027
        5  0.912
        6  0.9769
        7  1.0042
        8  0.0333
        9  0.0013/
;

parameter Qngbar(i)
       /1  0.2027
        2  0.1333
        3  0.2027
        4  0.2027
        5  0.912
        6  0.9769
        7  1.0042
        8  0.0333
        9  0.0013/
;



parameter
MROR /0.0001/
LocTax /0.002/
Royalty /0.002/
b /0.6357/
D /0.05/
DownholeSeparator /1/
LF /0.55/
;

variable
cost
;
Positive Variables
    Qg(r)  gas flow rate
    Qo(r)  oil flow rate
    Qng(r) natural gas liguid flow rate
    LFR(r) liquid flow rate
    Gasproduction(r) total gas production
    GLR(r) gas liquid ratio
;


Binary variables
y(i,t,p)
;

Equations
a1,a2,a3,a4,

c1(i), c2(p), c3(t),c4(i,t,p), c5(r), c7(r), c8(r),
c9(r), c10(r,t,p), c11(t,p), c12(t,p), c13(t,p), c14(t,p), c15(t,p), c16(t,p),
c17(t,p), c18(t,p), c19(t,p), c20(t,p), c21(t,p), c22(t,p), c23(r,t,p), c24(t,p),
c25(t,p), c26(r,t,p), c27(r,t,p), c28(t,p), c29(t,p), c30(t,p), c31(r,t,p), c32(t,p),
c33(r,t,p), c34(t,p), c35(t,p), c36(t,p), c37(t,p), c38(t,p), c39(t,p), c40(t,p),
c41(r,t,p), c42(r,t,p), c43(t,p), c44(t,p), c45(t,p), c46(t,p), c47(t,p), c48(r,t,p),
c49(r,t,p), c50(t,p), c51(t,p), c52(t,p), c53(t,p), c54(t,p), c55(r,t,p), c56(t,p),
c57(t,p), c58(t,p), c59(t,p), c60(t,p), c61(t,p), c62(t,p), c63(t,p), c64(r,t,p),
c65(r,t,p), c66(t,p), c67(t,p), c68(t,p), c69(t,p), c70(t,p), c71(t,p), c72(t,p),
c73(t,p),

** condition if constraints
b1(t,p,r), b2(t,p,r), b3(t,p,r), b4(t,p,r), b5(t,p,r),  b7(t,p,r),
b9(t,p,r), b10(t,p,r), b11(t,p,r), b12(t,p,r), b13(t,p,r), b14(t,p,r), b15(t,p,r),
e1,
obj
;

obj.. cost=e= sum(r,(Qg(r)*Pg + Qo(r)*Po+Qng(r)*Png)*(1/(1+MROR)**ord(r))*(1-LocTax)*(1-Royalty)
                    -sum((i,t,p)$(ord(t)>=ord(r) and ord(p)<=ord(r)),Cm(i)*y(i,t,p))*(1/(1+MROR)**ord(r))
                    -sum((i,t,p),Co(i)*y(i,t,p))*(1/(1+MROR)**ord(r)))
;

** initial value

a1..Qg('1') =e= 800;
a2..Qo('1') =e= 20;
a3..Qng('1')=e= 500;
a4..LFR('1') =e= 520;
** logic constraints
c1(i).. sum((t,p), y(i,t,p)) =l= 1;
c2(p).. sum((i,t), y(i,t,p)) =l= 1;
c3(t).. sum((i,p), y(i,t,p)) =l= 1;
c4(i,t,p).. y(i,t,p)$(ord(t)<ord(p)) =e= 0;
c5(r).. LFR(r) =e= Qo(r) + Qng(r);


e1(i,t,p,j,k,l)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l) and ord(l) <= ord(t)).. y(i,t,p) + y(j,k,l) =l= 1;


** decline curve model
c7(r)$(ord(r)>= 2).. Qg(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2), y(i,t,p)*Qg(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b));
c8(r)$(ord(r)>= 2).. Qo(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2), y(i,t,p)*Qo(p-1)*Qobar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b));
c9(r)$(ord(r)>= 2).. Qng(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2), y(i,t,p)*Qng(p-1)*Qngbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b));

** method 1
c10(r,t,p).. y('1',t,p)* LFR(r) =l= 200;
c11(t,p).. LF*y('1',t,p) =l= 0.5;
c12(t,p).. WellDeviation*y('1',t,p) =l= 70;
c13(t,p).. DLS*y('1',t,p) =l= 6;
c14(t,p).. PTD*y('1',t,p) =l= 3.5;
c15(t,p).. Tubinguniformity =g= y('1',t,p);
c16(t,p).. y('1',t,p) =l= 1 - TAC;
c17(t,p).. WellboreAccess =g= y('1',t,p);
c18(t,p).. WellDepth*y('1',t,p) =l= 19000;
c19(t,p).. Temp*y('1',t,p) =l= 110;
c20(t,p).. y('1',t,p) =l= 1 - Offshore;

b1(t,p,r)$(TubingSize < 2.875 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('1',t,p)*LFR(r) =l= 165;
b2(t,p,r)$(TubingSize < 2.375 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('1',t,p)*LFR(r) =l= 110;
b3(t,p,r)$(TubingSize < 2.0 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('1',t,p)*LFR(r) =l= 50;
b4(t,p,r)$(TubingSize < 1.5 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('1',t,p)*LFR(r) =l= 35;
b5(t,p,r)$(Packer = 1 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('1',t,p)*1000*LFR(r)- Qg(r) =l= 0;
b7(t,p,r)$(Packer = 0 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('1',t,p)*400*LFR(r)- Qg(r) =l= 0;

** method 2
c21(t,p).. WaterCut - 0.75*y('2',t,p) =g= 0;
c22(t,p).. TDS*y('2',t,p) - 0.05 =l= 0;
c23(r,t,p).. LFR(r)*y('2',t,p) - 500 =l= 0;
c24(t,p).. WellDepth*y('2',t,p) - 22000 =l= 0;
c25(t,p).. Temp*y('2',t,p) - 400 =l= 0;

b9(t,p,r)$(Packer = 1 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('2',t,p)*1.2*FLP - CITHP =l= 0;
b10(t,p,r)$(Packer = 0 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('2',t,p)*2.5*FLP - CITHP =l= 0;
b11(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. 430*y('2',t,p)*LFR(r) - Qg(r) =l= 0;


** method 3
c26(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. Qg(r) * y('3',t,p) - 0.3 =l= 0;
c27(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. LFR(r)*y('3',t,p) -100 =l= 0;
c28(t,p).. FTHP*y('3',t,p) - 175 =l= 0;
c29(t,p).. FTHP - 30*y('3',t,p) =g= 0;
c30(t,p).. CITHP*y('3',t,p) - 1100 =l= 0;

** method 4
c31(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. LFR(r)*y('4',t,p) - 300 =l= 0;
c32(t,p).. BHP - 500*y('4',t,p) =g= 0;

** method 5
c33(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. LFR(r) - 150*y('5',t,p) =g= 0;
c34(t,p).. CGA - y('5',t,p) =g= 0;
c35(t,p).. y('5',t,p) - 1 + MCF =l= 0;
c36(t,p).. WellDepth*y('5',t,p) - 18000 =l= 0;
c37(t,p).. Temp*y('5',t,p) - 450 =l= 0;

** method 6
c38(t,p).. y('6',t,p)*GVF - 0.3 =l= 0;
c39(t,p).. y('6',t,p)*WellDepth - 15000 =l= 0;
c40(t,p).. y('6',t,p)*Temp - 400 =l= 0;
c41(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. y('6',t,p)*150 - LFR(r) =l= 0;
c42(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. y('6',t,p)*LFR(r) - 30000 =l= 0;
c43(t,p).. y('6',t,p)*5.5 - CasingDiameter =l= 0;
c44(t,p).. y('6',t,p)*DLS - 6 =l= 0;
c45(t,p).. y('6',t,p) - EPA - EPEF =l= 0;

** method 7
c46(t,p).. y('7',t,p)*WellDepth - 16000 =l= 0;
c47(t,p).. y('7',t,p)*Temp - 500 =l= 0;
c48(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. y('7',t,p)*LFR(r) - 6000 =l= 0;
c49(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. y('7',t,p)*10 - LFR(r) =l= 0;
c50(t,p).. y('7',t,p)*2.375 - PTD =l= 0;
c51(t,p).. y('7',t,p)*WellDeviation - 80 =l= 0;
c52(t,p).. y('7',t,p)*DLS - 15 =l= 0;
c53(t,p).. y('7',t,p) - 1 + Offshore =l= 0;

b12(t,p,r)$(DownholeSeparator = 0 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('7',t,p)*GVF - 0.4 =l= 0;

** method 8
c54(t,p).. y('8',t,p)*WellDepth - 8600 =l= 0;
c55(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. y('8',t,p)*LFR(r) - 4500 =l= 0;
c56(t,p).. y('8',t,p)*4.5 - CasingDiameter =l= 0;
c57(t,p).. y('8',t,p)*Temp - 250 =l= 0;
c58(t,p).. y('8',t,p)*AromaticContent - 0.03 =l= 0;
c59(t,p).. y('8',t,p)*DLS - 15 =l= 0;
c60(t,p).. y('8',t,p) - GPA - GPEF =l= 0;
c61(t,p).. y('8',t,p) - EPA - EPEF =l= 0;

b13(t,p,r)$(DownholeSeparator = 0 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('8',t,p)*GVF - 0.5 =l= 0;
b14(t,p,r)$(WellDepth <= 6000 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('8',t,p)*10 - LFR(r) =l= 0;
b15(t,p,r)$(WellDepth >= 6000 and ord(t)>=ord(r) and ord(r)>=ord(p))..y('8',t,p)*60 - LFR(r) =l= 0;


** method 9
c62(t,p).. y('9',t,p) * DLS - 24 =l= 0;
c63(t,p).. y('9',t,p)*WellDepth - 15000 =l= 0;
c64(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. y('9',t,p)*200 - LFR(r) =l= 0;
c65(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. y('9',t,p)*LFR(r) - 35000 =l= 0;
c66(t,p).. y('9',t,p)*GVF - 0.5 =l= 0;
c67(t,p).. y('9',t,p)*2.875 - TubingSize =l= 0;
c68(t,p).. y('9',t,p) - 1 + MCF =l= 0;
c69(t,p).. y('9',t,p) - 1 + TAC =l= 0;
c70(t,p).. y('9',t,p) - WellboreAccess =l= 0;
c71(t,p).. y('9',t,p)*Temp - 550 =l= 0;
c72(t,p).. y('9',t,p) - 1 + Offshore =l= 0;
c73(t,p).. y('9',t,p) - EPA - EPEF =l= 0;


option limrow = 0,
       limcol = 0,
       iterlim = 1e9,
       reslim = 36000,
*     minlp = sbb,
*       minlp = sbb,
       minlp = baron,
*      minlp = alphaecp,
       solprint = on;
Model Horizonwell /all/;
Solve Horizonwell using MINLP max cost;


