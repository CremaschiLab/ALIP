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
zy(i,t,p)
yQgest(i,p,r), yQoest(i,p,r), yQngest(i,p,r),

yzQgest(i,p,r,t), yzQoest(i,p,r,t), yzQngest(i,p,r,t),
yzQgest1(i,p,r,t), yzQoest1(i,p,r,t), yzQngest1(i,p,r,t),

Qgmax(i,p), Qomax(i,p), Qngmax(i,p)
yQgest1(i,p,r), yQoest1(i,p,r), yQngest1(i,p,r),
Qgest(i,p,r), Qoest(i,p,r), Qngest(i,p,r),
LFRy(i,p,r), LFRy1(i,p,r), GPy(i,p,r), GPy1(i,p,r)
LFRz(i,t,r), LFRz1(i,t,r), GPyz(i,t,p,r), GPyz1(i,t,p,r)
Xtax(r)
;

Variables
GrossIncome(r),Depreciation(r),Capitalcost,tax(r);

negative variables
Xtax1(r)

Binary variables
y(i,p),x(r),z(i,t)
;
Equations
c1(i),c2(p),c5(r)
c11(p), c12(p), c13(p), c14(p), c15(p), c16(p),
c17(p), c18(p), c19(p), c20(p), c21(p), c22(p),  c24(p),
c25(p), c28(p), c29(p), c30(p),  c32(p),
*constraints for method 5,6,7
c33(r,t,p), c34(p), c35(p), c36(p), c37(p), c38(p), c39(p), c40(p),
c41(r,p), c43(p), c44(p), c45(p), c46(p), c47(p),c49(r,t,p)
c50(p), c51(p), c52(p), c53(p)

c54(p), c56(p),
c57(p), c58(p), c59(p), c60(p), c61(p), c62(p), c63(p), c64(r,t,p),
c66(p), c67(p), c68(p), c69(p), c70(p), c71(p), c72(p),
c73(p),

a1(r), a2(i,p,r), a3(i,p,r), a4(i,p,r), a5(i,p,r), a6(r), a7(i,p,r),
a8(i,p,r), a9(i,p,r), a10(i,p,r), a11(r), a12(i,p,r), a13(i,p,r),a14(i,p,r), a15(i,p,r),
aa1(i,p,r,t),aa2(i,p,r,t),aa3(i,p,r,t),aa4(i,p,r,t),aa5(i,p,r,t),aa6(i,p,r,t),aa7(i,p,r,t),aa8(i,p,r,t),aa9(i,p,r,t)
** condition if constraints
b5(t,r),  b7(t,r),
b9(p,r), b10(p,r), b11(t,r), b12(p), b13(p,r), b14(t,p,r), b15(t,p,r),
e1(i,t,p,j,k,l),
f1, f2, f3, f4,


**linearization constraints
d1(i,p,r), d2(p,r), d5(p,r), d8(p,r),
d11(p,r), d14(p,r),
d21(i,p,r), d23(p,r), d28(p,r), d29(p,r), d30(p,r),
d32(p,r), d35(p,r), d38(p,r),
d41(p,r),
d44(p,r), d47(p,r),


g1(r),g2(r),g3(r),g4(r),g5(r)

gross(r),Dep(r),Cap,

h(r),

obj
**extra constraints
bb1(i,t,p),bb2(i,t,p),bb3(i,t,p)
e1(i,t,p,j,k,l)
cc1(i),cc2(t)
cc3(i),cc4(i,t,p)
*dd1(i,t,p,r),dd21(i,t,p,r)
dd29(t,p,r),dd30(t,p,r),dd31(t,p,r)
*ddd31(i,t,p,r)
*d31(i,r),
*d100
;

** objective function
obj.. cost =e= sum(r, (GrossIncome(r)-Xtax(r)*FedTax))-Capitalcost*(1-FedTax);

gross(r)..GrossIncome(r) =e= ((30*Qg(r)*Pg + 30*Qo(r)*Po + 30*Qng(r)*Png)*(1-Royalty)*(1-LocTax)*workinginterest
                    -sum((i,p,t)$(ord(p)<=ord(r) and ord(r)<=ord(t)),Cm(i)*zy(i,t,p))*workinginterest)*1/(1+MROR)**rr(r);

Dep(r)..Depreciation(r) =e= sum((i,t,p)$(ord(p)+4>=ord(r) and ord(p)<=ord(r) and ord(t)>= ord(r)),Ce(i)/5*zy(i,t,p))*1/(1+MROR)**rr(r);

Cap..Capitalcost =e= sum((i,t,p),Co(i)*zy(i,t,p)*1/(1+MROR)**pp(p))*workinginterest;


h(r)..GrossIncome(r)-Depreciation(r) =e= tax(r);


** logic constraints
c1(i).. sum((p), y(i,p)) =l= 1;
c2(p).. sum((i), y(i,p)) =l= 1;
c5(r).. LFR(r) =e= Qo(r) + Qng(r);

cc1(i)..sum((t),z(i,t)) =l= 1;
cc2(t)..sum((i),z(i,t)) =l= 1;
cc3(i)..sum((p),y(i,p))-sum((t),z(i,t)) =e= 0;
cc4(i,t,p)..zy(i,t,p)$(ord(p)+3 gt ord(t)) =e= 0;
e1(i,t,p,j,k,l)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l) and ord(l) <= ord(t))..zy(i,t,p) + zy(j,k,l) =l= 1;
*e1(i,p,j,l)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l)).. y(i,p) + y(j,l) =l= 1;

f1..Qg('1') =e= 800;
f2..Qo('1') =e= 20;
f3..Qng('1')=e= 500;
f4..LFR('1') =e= 520;

a1(r)$(ord(r)>= 2).. Qg(r) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),yzQgest(i,p,r,t));

aa1(i,p,r,t)$(ord(t)>= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQgest(i,p,r,t) - 800*1.08*z(i,t) =l= 0;
aa2(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQgest1(i,p,r,t) - 800*1.08*(1-z(i,t)) =l= 0;
aa3(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQgest(i,p,r,t) + yzQgest1(i,p,r,t) - yQgest(i,p,r) =e= 0;
a2(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,p,r) - 800*1.08*y(i,p) =l= 0;
a3(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest1(i,p,r) - 800*1.08*(1-y(i,p)) =l= 0;
a4(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. Qgest(i,p,r) - Qg(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b)=e= 0;
a5(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,p,r) + yQgest1(i,p,r) - Qgest(i,p,r) =e= 0;

a6(r)$(ord(r)>= 2).. Qo(r) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),yzQoest(i,p,r,t));

aa4(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQoest(i,p,r,t) - 20*1.08*z(i,t) =l= 0;
aa5(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQoest1(i,p,r,t) -20*1.08*(1-z(i,t)) =l= 0;
aa6(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQoest(i,p,r,t) + yzQoest1(i,p,r,t) - yQoest(i,p,r) =e= 0;
a7(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,p,r) - 20*1.08*y(i,p) =l= 0;
a8(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest1(i,p,r) - 20*1.08*(1-y(i,p)) =l= 0;
a9(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. Qoest(i,p,r) - Qo(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a10(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,p,r) + yQoest1(i,p,r) - Qoest(i,p,r) =e= 0;

a11(r)$(ord(r)>= 2).. Qng(r) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),yzQngest(i,p,r,t));

aa7(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQngest(i,p,r,t) - 520*1.08*z(i,t) =l= 0;
aa8(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQngest1(i,p,r,t) - 520*1.08*(1-z(i,t)) =l= 0;
aa9(i,p,r,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQngest(i,p,r,t) + yzQngest1(i,p,r,t) - yQngest(i,p,r) =e= 0;
a12(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,p,r) - 520*1.08*y(i,p) =l= 0;
a13(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest1(i,p,r) - 520*1.08*(1-y(i,p)) =l= 0;
a14(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. Qngest(i,p,r) - Qng(p-1)*Qgbar(i)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a15(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,p,r) + yQngest1(i,p,r) - Qngest(i,p,r) =e= 0;

** important change
** linearization of two binary variables
bb1(i,t,p)..zy(i,t,p) =l= y(i,p);
bb2(i,t,p)..zy(i,t,p) =l= z(i,t);
bb3(i,t,p)..zy(i,t,p) =g= y(i,p) + z(i,t)-1;
** method 1
d2(p,r)$(ord(r)>=ord(p))..LFRy('1',p,r) - 200 =l= 0;

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

d5(p,r)$(TubingSize < 2.875  and ord(r)>=ord(p))..LFRy('1',p,r) - 165 =l= 0;

d8(p,r)$(TubingSize < 2.375  and ord(r)>=ord(p))..LFRy('1',p,r) - 110 =l= 0;

d11(p,r)$(TubingSize < 2.0  and ord(r)>=ord(p))..LFRy('1',p,r) - 50 =l= 0;

d14(p,r)$(TubingSize < 1.5  and ord(r)>=ord(p))..LFRy('1',p,r) - 35 =l= 0;


b5(p,r)$(Packer = 1  and ord(r)>=ord(p))..LFRy('1',p,r)*1000- Qg(r)*1000 =l= 0;
b7(p,r)$(Packer = 0  and ord(r)>=ord(p))..LFRy('1',p,r)*400 - Qg(r)*1000 =l= 0;


** important change
** method 2
c21(p).. WaterCut - 0.75*y('2',p) =g= 0;
c22(p).. TDS*y('2',p) - 0.05 =l= 0;


d23(p,r)..LFRy('2',p,r) - 500 =l= 0;


c24(p).. WellDepth*y('2',p) - 22000 =l= 0;
c25(p).. Temp*y('2',p) - 400 =l= 0;

b9(p,r)$(Packer = 1  and ord(r)>=ord(p) and ord(p)>=2)..y('2',p)*1.2*FLP - CITHP =l= 0;
b10(p,r)$(Packer = 0 and ord(r)>=ord(p) and ord(p)>=2)..y('2',p)*2.5*FLP - CITHP =l= 0;

b11(p,r)$(ord(r)>=ord(p)).. 430*LFRy('2',p,r) - Qg(r)*1000 =l= 0;

** method 3
*********important
d28(p,r)$(ord(r)>=ord(p) and ord(p)>=2)..GPy('3',p,r) + GPy1('3',p,r) =e= Qg(r);
d29(p,r)$(ord(r)>=ord(p) and ord(p)>=2)..GPy('3',p,r) - 0.0003*y('3',p) =l= 0;
d30(p,r)$(ord(r)>=ord(p) and ord(p)>=2)..GPy('3',p,r) - 0.0003*(1-y('3',p)) =l= 0;

dd31(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..GPyz('3',t,p,r) + GPyz1('3',t,p,r) =e= GPy('3',p,r);
dd29(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..GPyz('3',t,p,r) - 0.0003*z('3',t) =l= 0;
dd30(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..GPyz('3',t,p,r) - 0.0003*(1-z('3',t)) =l= 0;
*********important
d32(p,r)$(ord(r)>=ord(p))..LFRy('3',p,r) - 100 =l= 0;

c28(p).. FTHP*y('3',p) - 175 =l= 0;
c29(p).. FTHP - 30*y('3',p) =g= 0;
c30(p).. CITHP*y('3',p) - 1100 =l= 0;

** method 4

d35(p,r)$(ord(r)>=ord(p))..LFRy('4',p,r) - 300 =l= 0;

c32(p).. BHP - 500*y('4',p) =g= 0;

$ontext
** method 5
c33(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. LFR(r) - 150*y('5',t,p) =g= 0;
c34(t,p).. CGA - y('5',t,p) =g= 0;
c35(t,p).. y('5',t,p) - 1 + MCF =l= 0;
c36(t,p).. WellDepth*y('5',t,p) - 18000 =l= 0;
c37(t,p).. Temp*y('5',t,p) - 450 =l= 0;

** method 6
c38(t,p)$(DownholeSeparator = 0).. y('6',t,p)*GVF - 0.3 =l= 0;
c39(t,p).. y('6',t,p)*WellDepth - 15000 =l= 0;
c40(t,p).. y('6',t,p)*Temp - 400 =l= 0;
c41(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. y('6',t,p)*150 - LFR(r) =l= 0;


** gai bound 30000
d38(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..LFRy('6',t,p,r) - 30000=l= 0;


c43(t,p).. y('6',t,p)*5.5 - CasingDiameter =l= 0;
c44(t,p).. y('6',t,p)*DLS - 6 =l= 0;
c45(t,p).. y('6',t,p) - EPA - EPEF =l= 0;

** method 7
c46(t,p).. y('7',t,p)*WellDepth - 16000 =l= 0;
c47(t,p).. y('7',t,p)*Temp - 550 =l= 0;

** gai bound  6000
d41(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..LFRy('7',t,p,r) - 6000 =l= 0;


*** gai
c49(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. y('7',t,p)*350 - LFR(r) =l= 0;
*** gai

c50(t,p).. y('7',t,p)*2.375 - PTD =l= 0;
c51(t,p).. y('7',t,p)*WellDeviation - 80 =l= 0;
c52(t,p).. y('7',t,p)*DLS - 15 =l= 0;
c53(t,p).. y('7',t,p) - 1 + Offshore =l= 0;

b12(t,p,r)$(DownholeSeparator = 0  and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..y('7',t,p)*GVF - 0.4 =l= 0;
$offtext
** method 5
c33(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. LFR(r) - 150*zy('5',t,p) =g= 0;
c34(p).. CGA - y('5',p) =g= 0;
c35(p).. y('5',p) - 1 + MCF =l= 0;
c36(p).. WellDepth*y('5',p) - 18000 =l= 0;
c37(p).. Temp*y('5',p) - 450 =l= 0;

** method 6
c38(p)$(DownholeSeparator = 0).. y('6',p)*GVF - 0.3 =l= 0;
c39(p).. y('6',p)*WellDepth - 15000 =l= 0;
c40(p).. y('6',p)*Temp - 400 =l= 0;

*gai original bound is 150*
c41(r,p)$(ord(r)>=ord(p) and ord(p)>=2).. y('6',p)*10 - LFR(r) =l= 0;


** gai bound 30000
d38(p,r)$(ord(r)>=ord(p))..LFRy('6',p,r) - 30000=l= 0;


c43(p).. y('6',p)*5.5 - CasingDiameter =l= 0;
c44(p).. y('6',p)*DLS - 6 =l= 0;
c45(p).. y('6',p) - EPA - EPEF =l= 0;

** method 7
c46(p).. y('7',p)*WellDepth - 16000 =l= 0;
c47(p).. y('7',p)*Temp - 550 =l= 0;

** gai bound  6000
d41(p,r)$(ord(r)>=ord(p))..LFRy('7',p,r) - 6000 =l= 0;


*** gai
c49(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. zy('7',t,p)*10 - LFR(r) =l= 0;
*** gai

c50(p).. y('7',p)*2.375 - PTD =l= 0;
c51(p).. y('7',p)*WellDeviation - 80 =l= 0;
c52(p).. y('7',p)*DLS - 15 =l= 0;
c53(p).. y('7',p) - 1 + Offshore =l= 0;

b12(p)$(DownholeSeparator = 0 and ord(p)>=2)..y('7',p)*GVF - 0.4 =l= 0;

** method 8
c54(p).. y('8',p)*WellDepth - 8600 =l= 0;

** gai bound 4500
d44(p,r)$(ord(r)>=ord(p))..LFRy('8',p,r) - 4500 =l= 0;

c56(p).. y('8',p)*4.5 - CasingDiameter =l= 0;
c57(p).. y('8',p)*Temp - 250 =l= 0;
c58(p).. y('8',p)*AromaticContent - 0.03 =l= 0;
c59(p).. y('8',p)*DLS - 15 =l= 0;
c60(p).. y('8',p) - GPA - GPEF =l= 0;
c61(p).. y('8',p) - EPA - EPEF =l= 0;

b13(p,r)$(DownholeSeparator = 0 and ord(r)>=ord(p) and ord(p)>=2)..y('8',p)*GVF - 0.5 =l= 0;
b14(t,p,r)$(WellDepth <= 6000  and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..zy('8',t,p)*10 - LFR(r) =l= 0;
b15(t,p,r)$(WellDepth >= 6000  and ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..zy('8',t,p)*60 - LFR(r) =l= 0;


** method 9
c62(p).. y('9',p) * DLS - 24 =l= 0;
c63(p).. y('9',p)*WellDepth - 15000 =l= 0;
c64(r,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. zy('9',t,p)*200 - LFR(r) =l= 0;

**gai bound
d47(p,r)$(ord(r)>=ord(p))..LFRy('9',p,r) - 35000 =l= 0;

c66(p).. y('9',p)*GVF - 0.5 =l= 0;
c67(p).. y('9',p)*2.875 - TubingSize =l= 0;
c68(p).. y('9',p) - 1 + MCF =l= 0;
c69(p).. y('9',p) - 1 + TAC =l= 0;
c70(p).. y('9',p) - WellboreAccess =l= 0;
c71(p).. y('9',p)*Temp - 550 =l= 0;
c72(p).. y('9',p) - 1 + Offshore =l= 0;
c73(p).. y('9',p) - EPA - EPEF =l= 0;

** relaxation
d1(i,p,r)$(ord(r)>=ord(p))..LFRy(i,p,r) + LFRy1(i,p,r) =e= LFR(r);
*dd1(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..LFRyz(i,t,p,r) + LFRyz1(i,t,p,r) =e= LFRy(i,p,r);
*d22(t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p))..LFRy('2',t,p,r) + LFRy1('2',t,p,r) =e= LFR(r);
*d31(t,p,r)..LFRy('3',t,p,r) + LFRy1('3',t,p,r) =e= LFR(r);
*d34(t,p,r)..LFRy('4',t,p,r) + LFRy1('4',t,p,r) =e= LFR(r);
*d37(t,p,r)..LFRy('6',t,p,r) + LFRy1('6',t,p,r) =e= LFR(r);
*d40(t,p,r)..LFRy('7',t,p,r) + LFRy1('7',t,p,r) =e= LFR(r);
*d43(t,p,r)..LFRy('8',t,p,r) + LFRy1('8',t,p,r) =e= LFR(r);
*d46(t,p,r)..LFRy('9',t,p,r) + LFRy1('9',t,p,r) =e= LFR(r);

d21(i,p,r)$(ord(r)>=ord(p))..LFRy1(i,p,r) - (1-y(i,p))*520*1.08 =l= 0;
*dd21(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..LFRyz1(i,t,p,r) - (1-z(i,t))*520*1.08 =l= 0;

*d31(i,p,r)$(ord(r)>=ord(p) and ord(p)>=2)..LFRy(i,p,r) - y(i,p)*520*1.08 =l= 0;
*ddd31(i,t,p,r)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2)..LFRyz(i,t,p,r) - z(i,t)*520*1.08 =l= 0;
*d27(t,p,r)..LFRy1('2',t,p,r) - (1-y('2',t,p))*520 =l= 0;
*d33(t,p,r)..LFRy1('3',t,p,r) - (1-y('3',t,p))*520 =l= 0;
*d36(t,p,r)..LFRy1('4',t,p,r) - (1-y('4',t,p))*520 =l= 0;
*d39(t,p,r)..LFRy1('6',t,p,r) - (1-y('6',t,p))*520 =l= 0;
*d42(t,p,r)..LFRy1('7',t,p,r) - (1-y('7',t,p))*520 =l= 0;
*d45(t,p,r)..LFRy1('8',t,p,r) - (1-y('8',t,p))*520 =l= 0;
*d48(t,p,r)..LFRy1('9',t,p,r) - (1-y('9',t,p))*520 =l= 0;


g1(r)..tax(r) =e= Xtax(r) + Xtax1(r);
g2(r)..Xtax(r) - x(r)*423166 =l= 0;
g3(r)..Xtax1(r) + (1-x(r))*423166 =g= 0;
g4(r).. tax(r) - 423166*x(r) =l= 0;
g5(r).. tax(r) - 423166*(x(r)-1) =g= 0;

*d100..y('7','2')=e=1;

option limrow = 0,
       limcol = 0,
       iterlim = 1e9,
       reslim = 72000,
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
Display y.l, z.l,Qg.l,LFR.l,tax.l,x.l;

