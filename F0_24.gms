$ontext
Name: Zuo Zeng
ID: zzz0057
model:artificial lifting selection projects
$offtext
**eliminate the cross-reference map use the command
$Offsymxref
**eliminate the alphabetic listing of the symbol table use the command.
$Offsymlist
set i number of methods /1*9/
    T time periods /1*24/
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
        Pg Price of gas /6/
        Po Price of oil /100/
        Png Price of natural gas liquid /50/
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
       /1 1
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
        13 13
        14 14
        15 15
        16 16
        17 17
        18 18
        19 19
        20 20
        21 21
        22 22
        23 23
        24 24
/

;
parameter rr(r)
       /1 1
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
        13 13
        14 14
        15 15
        16 16
        17 17
        18 18
        19 19
        20 20
        21 21
        22 22
        23 23
        24 24

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
       /1  29600
        2  39430
        3  75000
        4  205000
        5  80905
        6  250000
        7  160000
        8  114633
        9  99401/
;
parameter Ce(i) capital cost of method i
       /1  19500
        2  35550
        3  0
        4  155000
        5  37446
        6  170000
        7  110000
        8  80000
        9  66000/
;


parameter Qgbar(i)
       /1  1
        2  1
        3  1
        4  1
        5  0.98
        6  1.05
        7  1.08
        8  1.05
        9  1.05/
;



parameter
MROR /0.01/
LocTax /0.2/
Royalty /0.2/
FedTax /0.3/
b /0.6357/
D /0.0507/
DownholeSeparator /1/
LF /0.55/
FederalTax /0.3/
workinginterest /0.7/
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

Variables
GrossIncome(r),Depreciation(r),Capitalcost,tax(r);

Binary variables
y(i,p),x(r),z(i,t)
;
Equations
a1,a2,a3,a4,
cc1(i),cc2(t)
cc3(i),cc4(i,t,p),c1(i),c2(p),c5(r)
e1(i,t,p,j,k,l)

c7(r), c8(r),
c9(r), c10(r,p), c11(p), c12(p), c13(p), c14(p), c15(p), c16(p),
c17(p), c18(p), c19(p), c20(p), c21(p), c22(p), c23(r,p), c24(p),
c25(p), c26(r,p), c27(r,p), c28(p), c29(p), c30(p), c31(r,p), c32(p),
c33(r,t), c34(p), c35(p), c36(p), c37(p), c38(p), c39(p), c40(p),
c41(r,t), c42(r,p), c43(p), c44(p), c45(p), c46(p), c47(p), c48(r,p),
c49(r,t), c50(p), c51(p), c52(p), c53(p), c54(p), c55(r,p), c56(p),
c57(p), c58(p), c59(p), c60(p), c61(p), c62(p), c63(p), c64(r,t),
c65(r,p), c66(p), c67(p), c68(p), c69(p), c70(p), c71(p), c72(p),
c73(p),

** condition if constraints
b1(p,r), b2(p,r), b3(p,r), b4(p,r), b5(p,r),  b7(p,r),
b9(p), b10(p), b11(p,r), b12(p,r), b13(p,r), b14(t,r), b15(t,r),


g5(r), g4(r),
*d50(r) , d51(r), d52(r), d53(r),

gross(r),Dep(r),Cap,

h(r),
obj
;
obj.. cost =e= sum(r, (GrossIncome(r)-x(r)*tax(r)*FedTax))-Capitalcost*(1-FedTax);

gross(r)..GrossIncome(r) =e= ((30*Qg(r)*Pg + 30*Qo(r)*Po + 30*Qng(r)*Png)*(1-Royalty)*(1-LocTax)*workinginterest
                    -sum((i,t,p)$(ord(t)>=ord(r) and ord(p)<=ord(r)),Cm(i)*z(i,t)*y(i,p))*workinginterest)*1/(1+MROR)**rr(r);

Dep(r)..Depreciation(r) =e= sum((i,t,p)$(ord(p)+4>=ord(r) and ord(p)<=ord(r) and ord(t)>= ord(r)),Ce(i)/5*z(i,t)*y(i,p))*1/(1+MROR)**rr(r);

Cap..Capitalcost =e= sum((i,t,p),Co(i)*z(i,t)*y(i,p)*1/(1+MROR)**pp(p))*workinginterest;


h(r)..GrossIncome(r)-Depreciation(r) =e= tax(r);

** initial value

a1..Qg('1') =e= 800;
a2..Qo('1') =e= 20;
a3..Qng('1')=e= 500;
a4..LFR('1') =e= 520;

** logic constraints
c1(i).. sum((p), y(i,p)) =l= 1;
c2(p).. sum((i), y(i,p)) =l= 1;
c5(r).. LFR(r) =e= Qo(r) + Qng(r);

cc1(i)..sum((t),z(i,t)) =l= 1;
cc2(t)..sum((i),z(i,t)) =l= 1;
cc3(i)..sum((p),y(i,p))-sum((t),z(i,t)) =e= 0;
cc4(i,t,p)..z(i,t)*y(i,p)$(ord(p)+3 gt ord(t)) =e= 0;

e1(i,t,p,j,k,l)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l) and ord(l) <= ord(t))..z(i,t)*y(i,p) + z(j,k)*y(j,l) =l= 1;

** decline curve model
c7(r)$(ord(r)>= 2).. Qg(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2), z(i,t)*y(i,p)*Qg(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b));
c8(r)$(ord(r)>= 2).. Qo(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2), z(i,t)*y(i,p)*Qo(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b));
c9(r)$(ord(r)>= 2).. Qng(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2), z(i,t)*y(i,p)*Qng(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b));

** method 1
c10(r,p).. y('1',p)* LFR(r) =l= 200;
c11(p).. LF*y('1',p) =l= 0.5;
c12(p).. WellDeviation*y('1',p) =l= 70;
c13(p).. DLS*y('1',p) =l= 6;
c14(p).. PTD*y('1',p) =l= 3.5;
c15(p).. Tubinguniformity =g= y('1',p);
c16(p).. y('1',p) =l= 1 - TAC;
c17(p).. WellboreAccess =g= y('1',p);
c18(p).. WellDepth*y('1',p) =l= 19000;
c19(p).. Temp*y('1',p) =l= 550;
c20(p).. y('1',p) =l= 1 - Offshore;


b1(p,r)$(TubingSize < 2.875 and ord(r)>=ord(p))..y('1',p)*LFR(r) =l= 165;
b2(p,r)$(TubingSize < 2.375 and ord(r)>=ord(p))..y('1',p)*LFR(r) =l= 110;
b3(p,r)$(TubingSize < 2.0 and ord(r)>=ord(p))..y('1',p)*LFR(r) =l= 50;
b4(p,r)$(TubingSize < 1.5 and ord(r)>=ord(p))..y('1',p)*LFR(r) =l= 35;
b5(p,r)$(Packer = 1 and ord(r)>=ord(p))..y('1',p)*1000*LFR(r)- Qg(r) =l= 0;
b7(p,r)$(Packer = 0 and ord(r)>=ord(p))..y('1',p)*400*LFR(r)- Qg(r) =l= 0;

** method 2
c21(p).. WaterCut - 0.75*y('2',p) =g= 0;
c22(p).. TDS*y('2',p) - 0.05 =l= 0;
c23(r,p)$(ord(r)>=ord(p)).. LFR(r)*y('2',p) - 500 =l= 0;
c24(p).. WellDepth*y('2',p) - 22000 =l= 0;
c25(p).. Temp*y('2',p) - 400 =l= 0;

b9(p)$(Packer = 1 )..y('2',p)*1.2*FLP - CITHP =l= 0;
b10(p)$(Packer = 0)..y('2',p)*2.5*FLP - CITHP =l= 0;
b11(p,r).. 430*y('2',p)*LFR(r) - Qg(r) =l= 0;


** method 3
c26(r,p)$(ord(r)>=ord(p)).. Qg(r) * y('3',p) - 0.3 =l= 0;
c27(r,p)$(ord(r)>=ord(p)).. LFR(r)*y('3',p) -100 =l= 0;
c28(p).. FTHP*y('3',p) - 175 =l= 0;
c29(p).. FTHP - 30*y('3',p) =g= 0;
c30(p).. CITHP*y('3',p) - 1100 =l= 0;

** method 4
c31(r,p)$(ord(r)>=ord(p)).. LFR(r)*y('4',p) - 300 =l= 0;
c32(p).. BHP - 500*y('4',p) =g= 0;

** method 5
c33(r,t)$(ord(r)<=ord(t)).. LFR(r) - 150*z('5',t) =g= 0;
c34(p).. CGA - y('5',p) =g= 0;
c35(p).. y('5',p) - 1 + MCF =l= 0;
c36(p).. WellDepth*y('5',p) - 18000 =l= 0;
c37(p).. Temp*y('5',p) - 450 =l= 0;

** method 6
c38(p).. y('6',p)*GVF - 0.3 =l= 0;
c39(p).. y('6',p)*WellDepth - 15000 =l= 0;
c40(p).. y('6',p)*Temp - 400 =l= 0;
c41(r,t)$(ord(r)<=ord(t)).. z('6',t)*150 - LFR(r) =l= 0;
c42(r,p)$(ord(r)>=ord(p)).. y('6',p)*LFR(r) - 30000 =l= 0;
c43(p).. y('6',p)*5.5 - CasingDiameter =l= 0;
c44(p).. y('6',p)*DLS - 6 =l= 0;
c45(p).. y('6',p) - EPA - EPEF =l= 0;

** method 7
c46(p).. y('7',p)*WellDepth - 16000 =l= 0;
c47(p).. y('7',p)*Temp - 500 =l= 0;
c48(r,p)$(ord(r)>=ord(p)).. y('7',p)*LFR(r) - 6000 =l= 0;
c49(r,t)$(ord(r)<=ord(t)).. z('7',t)*10 - LFR(r) =l= 0;
c50(p).. y('7',p)*2.375 - PTD =l= 0;
c51(p).. y('7',p)*WellDeviation - 80 =l= 0;
c52(p).. y('7',p)*DLS - 15 =l= 0;
c53(p).. y('7',p) - 1 + Offshore =l= 0;

b12(p,r)$(DownholeSeparator = 0 and ord(r)>=ord(p))..y('7',p)*GVF - 0.4 =l= 0;

** method 8
c54(p).. y('8',p)*WellDepth - 8600 =l= 0;
c55(r,p)$(ord(r)>=ord(p)).. y('8',p)*LFR(r) - 4500 =l= 0;
c56(p).. y('8',p)*4.5 - CasingDiameter =l= 0;
c57(p).. y('8',p)*Temp - 250 =l= 0;
c58(p).. y('8',p)*AromaticContent - 0.03 =l= 0;
c59(p).. y('8',p)*DLS - 15 =l= 0;
c60(p).. y('8',p) - GPA - GPEF =l= 0;
c61(p).. y('8',p) - EPA - EPEF =l= 0;

b13(p,r)$(DownholeSeparator = 0 and ord(r)>=ord(p))..y('8',p)*GVF - 0.5 =l= 0;
b14(t,r)$(WellDepth <= 6000 and ord(r)<=ord(t))..z('8',t)*10 - LFR(r) =l= 0;
b15(t,r)$(WellDepth >= 6000 and ord(r)<=ord(t))..z('8',t)*60 - LFR(r) =l= 0;


** method 9
c62(p).. y('9',p) * DLS - 24 =l= 0;
c63(p).. y('9',p)*WellDepth - 15000 =l= 0;
c64(r,t)$(ord(r)>=ord(t)).. z('9',t)*200 - LFR(r) =l= 0;
c65(r,p)$(ord(r)>=ord(p)).. y('9',p)*LFR(r) - 35000 =l= 0;
c66(p).. y('9',p)*GVF - 0.5 =l= 0;
c67(p).. y('9',p)*2.875 - TubingSize =l= 0;
c68(p).. y('9',p) - 1 + MCF =l= 0;
c69(p).. y('9',p) - 1 + TAC =l= 0;
c70(p).. y('9',p) - WellboreAccess =l= 0;
c71(p).. y('9',p)*Temp - 550 =l= 0;
c72(p).. y('9',p) - 1 + Offshore =l= 0;
c73(p).. y('9',p) - EPA - EPEF =l= 0;
** constraints


*ADDITIONAL CONSTRIANTS
g4(r).. tax(r) - 423166*x(r) =l= 0;
g5(r).. tax(r) - 423166*(x(r)-1) =g= 0;
option limrow = 0,
       limcol = 0,
       iterlim = 1e9,
       reslim = 360000,
       optcr = 0.0001,
*       workmem = 8000,
*       NodeFileInd = 1/2,
     minlp = scip,
*       minlp = sbb,
*       mip = cplex,
*      minlp = alphaecp,
       solprint = off;
Model Horizonwell /all/;
Solve Horizonwell using MINLP max cost;
Display y.l, Qg.l,LFR.l,tax.l,x.l;


