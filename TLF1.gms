$ontext
Name: Zuo Zeng
ID: zzz0057
model:artificial lifting selection projects
$offtext
$onecho > cplex.opt
   nodefileind 2
   solvefinal 0
   names 0
   lpmethod 1
   nodesel 2
$offecho
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


parameter Qngbar(i)
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
Positive Variables
yQgest(i,t,p,r), yQoest(i,t,p,r), yQngest(i,t,p,r),
Qgmax(i,p), Qomax(i,p), Qngmax(i,p)
yQgest1(i,t,p,r), yQoest1(i,t,p,r), yQngest1(i,t,p,r),
Qgest(i,t,p,r), Qoest(i,t,p,r), Qngest(i,t,p,r),
LFRy(i,t,p,r), LFRy1(i,t,p,r), GPy(i,t,p,r), GPy1(i,t,p,r)

Xtax(r)
;

Variables
GrossIncome(r),Depreciation(r),Capitalcost,tax(r);

negative variables
Xtax1(r)

Binary variables
y(i,t,p),x(r)
;

Equations
c1(i), c2(p), c3(t), c5(r),
*c4(i,t,p),
c11(t,p), c12(t,p), c13(t,p), c14(t,p), c15(t,p), c16(t,p),
c17(t,p), c18(t,p), c19(t,p), c20(t,p), c21(t,p), c22(t,p),  c24(t,p),
c25(t,p), c28(t,p), c29(t,p), c30(t,p),  c32(t,p),
c33(r,t,p), c34(t,p), c35(t,p), c36(t,p), c37(t,p), c38(t,p), c39(t,p), c40(t,p),
c41(r,t,p), c43(t,p), c44(t,p), c45(t,p), c46(t,p), c47(t,p),
c49(r,t,p), c50(t,p), c51(t,p), c52(t,p), c53(t,p), c54(t,p), c56(t,p),
c57(t,p), c58(t,p), c59(t,p), c60(t,p), c61(t,p), c62(t,p), c63(t,p), c64(r,t,p),
c66(t,p), c67(t,p), c68(t,p), c69(t,p), c70(t,p), c71(t,p), c72(t,p),
c73(t,p),

a1(r), a2(i,t,p,r), a3(i,t,p,r), a4(i,t,p,r), a5(i,t,p,r), a6(r), a7(i,t,p,r),
a8(i,t,p,r), a9(i,t,p,r), a10(i,t,p,r), a11(r), a12(i,t,p,r), a13(i,t,p,r),a14(i,t,p,r), a15(i,t,p,r),

** condition if constraints
b5(t,p,r),  b7(t,p,r),
b9(t,p,r), b10(t,p,r), b11(t,p,r), b12(t,p,r), b13(t,p,r), b14(t,p,r), b15(t,p,r),
e1(i,t,p,j,k,l),
f1, f2, f3, f4,

**linearization constraints
d1(i,t,p,r), d2(t,p,r), d5(t,p,r), d8(t,p,r),
d11(t,p,r), d14(t,p,r),
d21(i,t,p,r), d23(t,p,r), d28(t,p,r), d29(t,p,r), d30(t,p,r),
d32(t,p,r), d35(t,p,r), d38(t,p,r),
d41(t,p,r), d44(t,p,r), d47(t,p,r),

d50(i,t,p,r) , d51(r), d52(r), d53(r),


g1(r),g2(r),g3(r),g4(r),g5(r)

gross(r),Dep(r),Cap,

h(r),

obj
;

** objective function
obj.. cost =e= sum(r, (GrossIncome(r)-Xtax(r)*FedTax))-Capitalcost*(1-FedTax);

gross(r)..GrossIncome(r) =e= ((30*Qg(r)*Pg + 30*Qo(r)*Po + 30*Qng(r)*Png)*(1-Royalty)*(1-LocTax)*workinginterest
                    -sum((i,t,p)$(ord(t)>=ord(r) and ord(p)<=ord(r)),Cm(i)*y(i,t,p))*workinginterest)*1/(1+MROR)**rr(r);

Dep(r)..Depreciation(r) =e= sum((i,t,p)$(ord(p)+4>=ord(r) and ord(p)<=ord(r) and ord(t)>= ord(r)),Ce(i)/5*y(i,t,p))*1/(1+MROR)**rr(r);

Cap..Capitalcost =e= sum((i,t,p)$(ord(t)>=ord(p)),Co(i)*y(i,t,p)*1/(1+MROR)**pp(p))*workinginterest;


h(r)..GrossIncome(r)-Depreciation(r) =e= tax(r);


** logic constraints
c1(i).. sum((t,p), y(i,t,p)) =l= 1;
c2(p).. sum((i,t), y(i,t,p)) =l= 1;
c3(t).. sum((i,p), y(i,t,p)) =l= 1;
*c4(i,t,p).. y(i,t,p)$(ord(t)<=ord(p)) =e= 0;
c5(r).. LFR(r) =e= Qo(r) + Qng(r);

e1(i,t,p,j,k,l)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l) and ord(l) <= ord(t)).. y(i,t,p) + y(j,k,l) =l= 1;

f1..Qg('1') =e= 800;
f2..Qo('1') =e= 20;
f3..Qng('1')=e= 500;
f4..LFR('1') =e= 520;

a1(r)$(ord(r)>= 2).. Qg(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2),yQgest(i,t,p,r));
a2(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,t,p,r) - 864*y(i,t,p) =l= 0;
a3(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQgest1(i,t,p,r) - 864*(1-y(i,t,p)) =l= 0;
a4(i,t,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. Qgest(i,t,p,r) - Qg(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b)=e= 0;
a5(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,t,p,r) + yQgest1(i,t,p,r) - Qgest(i,t,p,r) =e= 0;

a6(r)$(ord(r)>= 2).. Qo(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2),yQoest(i,t,p,r));
a7(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,t,p,r) - 21.6*y(i,t,p) =l= 0;
a8(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQoest1(i,t,p,r) - 21.6*(1-y(i,t,p)) =l= 0;
a9(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. Qoest(i,t,p,r) - Qo(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a10(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,t,p,r) + yQoest1(i,t,p,r) - Qoest(i,t,p,r) =e= 0;

a11(r)$(ord(r)>= 2).. Qng(r) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2),yQngest(i,t,p,r));
a12(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,t,p,r) - 540*y(i,t,p) =l= 0;
a13(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQngest1(i,t,p,r) - 540*(1-y(i,t,p)) =l= 0;
a14(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. Qngest(i,t,p,r) - Qng(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a15(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,t,p,r) + yQngest1(i,t,p,r) - Qngest(i,t,p,r) =e= 0;

** method 1
d2(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('1',t,p,r) - 200 =l= 0;

c11(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. LF*y('1',t,p) =l= 0.5;
c12(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. WellDeviation*y('1',t,p) =l= 70;
c13(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. DLS*y('1',t,p) =l= 6;
c14(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. PTD*y('1',t,p) =l= 3.5;
c15(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. Tubinguniformity =g= y('1',t,p);
c16(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('1',t,p) =l= 1 - TAC;
c17(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. WellboreAccess =g= y('1',t,p);
c18(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. WellDepth*y('1',t,p) =l= 19000;
c19(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. Temp*y('1',t,p) =l= 550;
c20(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('1',t,p) =l= 1 - Offshore;

d5(t,p,r)$(TubingSize < 2.875 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('1',t,p,r) - 165 =l= 0;

d8(t,p,r)$(TubingSize < 2.375 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('1',t,p,r) - 110 =l= 0;

d11(t,p,r)$(TubingSize < 2.0 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('1',t,p,r) - 50 =l= 0;

d14(t,p,r)$(TubingSize < 1.5 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('1',t,p,r) - 35 =l= 0;


b5(t,p,r)$(Packer = 1 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('1',t,p,r)*1000- Qg(r)*1000 =l= 0;
b7(t,p,r)$(Packer = 0 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('1',t,p,r)*400 - Qg(r)*1000 =l= 0;


** important change
** method 2
c21(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. WaterCut - 0.75*y('2',t,p) =g= 0;
c22(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. TDS*y('2',t,p) - 0.05 =l= 0;


d23(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('2',t,p,r) - 500 =l= 0;


c24(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. WellDepth*y('2',t,p) - 22000 =l= 0;
c25(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. Temp*y('2',t,p) - 400 =l= 0;

b9(t,p,r)$(Packer = 1 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..y('2',t,p)*1.2*FLP - CITHP =l= 0;
b10(t,p,r)$(Packer = 0 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..y('2',t,p)*2.5*FLP - CITHP =l= 0;

b11(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2).. 430*LFRy('2',t,p,r) - Qg(r)*1000 =l= 0;

** method 3
d28(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..GPy('3',t,p,r) + GPy1('3',t,p,r) =e= Qg(r);
d29(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..GPy('3',t,p,r) - 0.0003*y('3',t,p) =l= 0;
d30(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..GPy('3',t,p,r) - 0.0003*(1-y('3',t,p)) =l= 0;


d32(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('3',t,p,r) - 100 =l= 0;

c28(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. FTHP*y('3',t,p) - 175 =l= 0;
c29(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. FTHP - 30*y('3',t,p) =g= 0;
c30(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. CITHP*y('3',t,p) - 1100 =l= 0;

** method 4

d35(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('4',t,p,r) - 300 =l= 0;

c32(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. BHP - 500*y('4',t,p) =g= 0;

** method 5
c33(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2).. LFR(r) - 150*y('5',t,p) =g= 0;
c34(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. CGA - y('5',t,p) =g= 0;
c35(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('5',t,p) - 1 + MCF =l= 0;
c36(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. WellDepth*y('5',t,p) - 18000 =l= 0;
c37(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. Temp*y('5',t,p) - 450 =l= 0;

** method 6
c38(t,p)$(DownholeSeparator = 0 and ord(t)>=ord(p) and ord(p)>=2).. y('6',t,p)*GVF - 0.3 =l= 0;
c39(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('6',t,p)*WellDepth - 15000 =l= 0;
c40(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('6',t,p)*Temp - 400 =l= 0;
c41(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2).. y('6',t,p)*150 - LFR(r) =l= 0;


** gai bound 30000
d38(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('6',t,p,r) - 30000=l= 0;


c43(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('6',t,p)*5.5 - CasingDiameter =l= 0;
c44(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('6',t,p)*DLS - 6 =l= 0;
c45(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('6',t,p) - EPA - EPEF =l= 0;

** method 7
c46(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('7',t,p)*WellDepth - 16000 =l= 0;
c47(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('7',t,p)*Temp - 550 =l= 0;

** gai bound  6000
d41(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('7',t,p,r) - 6000 =l= 0;


*** gai
c49(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2).. y('7',t,p)*10 - LFR(r) =l= 0;
*** gai

c50(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('7',t,p)*2.375 - PTD =l= 0;
c51(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('7',t,p)*WellDeviation - 80 =l= 0;
c52(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('7',t,p)*DLS - 15 =l= 0;
c53(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('7',t,p) - 1 + Offshore =l= 0;

b12(t,p,r)$(DownholeSeparator = 0 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..y('7',t,p)*GVF - 0.4 =l= 0;

** method 8
c54(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('8',t,p)*WellDepth - 8600 =l= 0;

** gai bound 4500
d44(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('8',t,p,r) - 4500 =l= 0;

c56(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('8',t,p)*4.5 - CasingDiameter =l= 0;
c57(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('8',t,p)*Temp - 250 =l= 0;
c58(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('8',t,p)*AromaticContent - 0.03 =l= 0;
c59(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('8',t,p)*DLS - 15 =l= 0;
c60(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('8',t,p) - GPA - GPEF =l= 0;
c61(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('8',t,p) - EPA - EPEF =l= 0;

b13(t,p,r)$(DownholeSeparator = 0 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..y('8',t,p)*GVF - 0.5 =l= 0;
b14(t,p,r)$(WellDepth <= 6000 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..y('8',t,p)*10 - LFR(r) =l= 0;
b15(t,p,r)$(WellDepth >= 6000 and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..y('8',t,p)*60 - LFR(r) =l= 0;


** method 9
c62(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p) * DLS - 24 =l= 0;
c63(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p)*WellDepth - 15000 =l= 0;
c64(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2).. y('9',t,p)*200 - LFR(r) =l= 0;

**gai bound
d47(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy('9',t,p,r) - 35000 =l= 0;

c66(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p)*GVF - 0.5 =l= 0;
c67(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p)*2.875 - TubingSize =l= 0;
c68(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p) - 1 + MCF =l= 0;
c69(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p) - 1 + TAC =l= 0;
c70(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p) - WellboreAccess =l= 0;
c71(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p)*Temp - 550 =l= 0;
c72(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p) - 1 + Offshore =l= 0;
c73(t,p)$(ord(t)>=ord(p) and ord(p)>=2).. y('9',t,p) - EPA - EPEF =l= 0;

** relaxation
d1(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy(i,t,p,r) + LFRy1(i,t,p,r) =e= LFR(r);
*d22(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p))..LFRy('2',t,p,r) + LFRy1('2',t,p,r) =e= LFR(r);
*d31(t,p,r)..LFRy('3',t,p,r) + LFRy1('3',t,p,r) =e= LFR(r);
*d34(t,p,r)..LFRy('4',t,p,r) + LFRy1('4',t,p,r) =e= LFR(r);
*d37(t,p,r)..LFRy('6',t,p,r) + LFRy1('6',t,p,r) =e= LFR(r);
*d40(t,p,r)..LFRy('7',t,p,r) + LFRy1('7',t,p,r) =e= LFR(r);
*d43(t,p,r)..LFRy('8',t,p,r) + LFRy1('8',t,p,r) =e= LFR(r);
*d46(t,p,r)..LFRy('9',t,p,r) + LFRy1('9',t,p,r) =e= LFR(r);

d21(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>= 2)..LFRy1(i,t,p,r) - (1-y(i,t,p))*561.6 =l= 0;
*d27(t,p,r)..LFRy1('2',t,p,r) - (1-y('2',t,p))*520 =l= 0;
*d33(t,p,r)..LFRy1('3',t,p,r) - (1-y('3',t,p))*520 =l= 0;
*d36(t,p,r)..LFRy1('4',t,p,r) - (1-y('4',t,p))*520 =l= 0;
*d39(t,p,r)..LFRy1('6',t,p,r) - (1-y('6',t,p))*520 =l= 0;
*d42(t,p,r)..LFRy1('7',t,p,r) - (1-y('7',t,p))*520 =l= 0;
*d45(t,p,r)..LFRy1('8',t,p,r) - (1-y('8',t,p))*520 =l= 0;
*d48(t,p,r)..LFRy1('9',t,p,r) - (1-y('9',t,p))*520 =l= 0;

d50(i,t,p,r)$(ord(r)>=2)..LFRy(i,t,p,r) =l= 561.6*(1+b*D*(rr(r)-1))**(-1/b);
d51(r)$(ord(r)>=2)..Qg(r) =l= 864*(1+b*D*(rr(r)-1))**(-1/b);
d52(r)$(ord(r)>=2)..Qo(r) =l= 21.6*(1+b*D*(rr(r)-1))**(-1/b);
d53(r)$(ord(r)>=2)..Qng(r) =l= 540*(1+b*D*(rr(r)-1))**(-1/b);

g1(r)..tax(r) =e= Xtax(r) + Xtax1(r);
g2(r)..Xtax(r) - x(r)*423166 =l= 0;
g3(r)..Xtax1(r) + (1-x(r))*423166 =g= 0;
g4(r).. tax(r) - 423166*x(r) =l= 0;
g5(r).. tax(r) - 423166*(x(r)-1) =g= 0;


option limrow = 0,
       limcol = 0,
       iterlim = 1e9,
       reslim = 60,
       optcr = 0.0001,
*       workmem = 8000,
*       NodeFileInd = 1/2,
*     minlp = sbb,
*       minlp = sbb,
       mip = cplex,
*      minlp = alphaecp,
       solprint = off;
Model Horizonwell /all/;
Horizonwell.optfile=1;
Solve Horizonwell using MIP max cost;
Display y.l, Qg.l,LFR.l,tax.l,x.l;

