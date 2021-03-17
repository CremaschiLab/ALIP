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
set T time periods /1*12/
    s senarios /1*8/
    i number of methods /5,6,7/
;
alias (i,j);
alias (T,t,p,r,k,l);
alias (s,sp);


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


/
;
parameter ss(s)
       / 1 1
         2 2
         3 3
         4 4
         5 5
         6 6
         7 7
         8 8/
;

parameter Cm(i) operational cost of method i
       /
        5  5000
        6  2000
        7  1200

/
;

parameter Co(i) capital cost of method i
       /
        5  129000
        6  250000
        7  160000

/
;
parameter Ce(i) capital cost of method i
       /
        5  54000
        6  170000
        7  110000
/
;
$ontext
parameter Qgbar(i)
       /1  1
        2  0.1333
        3  1
        4  1
        5  0.912
        6  0.9769
        7  1.0042
        8  0.0333
        9  0.0013/
;
$offtext

* 20%
table Qgbar(i,s)
           1          2         3         4          5          6         7       8
        5  1.176      1.176     1.176     1.176     0.784       0.784     0.784   0.784
        6  1.26       1.26      0.84      0.84      1.26        1.26      0.84    0.84
        7  1.296      0.864     1.296     0.864     1.296       0.864     1.296   0.864

;
$ontext
table Qgbar(i,s)
           1          2         3          4         5          6          7         8
        5  0.1       0.1        0.1        0.1       0.9975     0.9975     0.9975    0.9975
        6  1.0       1.0        0.9975     0.9975    1.029      1.029      0.9975    0.9975
        7  1.134     1.026      1.134      1.026     1.134      1.026      1.134     1.026

;
$offtext
parameter pos(s)
/ 1  0.125
  2  0.125
  3  0.125
  4  0.125
  5  0.125
  6  0.125
  7  0.125
  8  0.125
/;
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

PARAMETER pos(s) Scenario probability;
pos(s) = 1/card(s);

variable
cost
;
Positive Variables
    Qg(r,s)  gas flow rate
    Qo(r,s)  oil flow rate
    Qng(r,s) natural gas liguid flow rate
    LFR(r,s) liquid flow rate
    Gasproduction(r,s) total gas production
    GLR(r,s) gas liquid ratio
;
Positive Variables
yzQgest(i,p,r,t,s), yzQoest(i,p,r,t,s), yzQngest(i,p,r,t,s),
yzQgest1(i,p,r,t,s), yzQoest1(i,p,r,t,s), yzQngest1(i,p,r,t,s),


yQgest(i,p,r,s), yQoest(i,p,r,s), yQngest(i,p,r,s),
yQgest1(i,p,r,s), yQoest1(i,p,r,s), yQngest1(i,p,r,s),
Qgest(i,p,r,s), Qoest(i,p,r,s), Qngest(i,p,r,s),
LFRy(i,p,r,s), LFRy1(i,p,r,s)
zy(i,t,p,s)
Xtax(r,s)
;
Variables
GrossIncome(r,s),Depreciation(r,s),Capitalcost,tax(r,s);

negative variables
Xtax1(r,s)
;

Binary variables
y(i,p,s), x(r,s),z(i,t,s)
;

Equations
** condition if constraints
c1(i,s),c2(p,s),c5(r,s)
e1(i,t,p,j,k,l,s),
f1(s), f2(s), f3(s), f4(s),

*d1(i,s), d2(p,s), d3(t,s),d4(i,t,p,s), d5(r,s),
e1(i,t,p,j,k,l,s),
f1(s), f2(s), f3(s), f4(s),

a1(r,s), a2(i,p,r,s), a3(i,p,r,s), a4(i,p,r,s), a5(i,p,r,s), a6(r,s), a7(i,p,r,s),
a8(i,p,r,s), a9(i,p,r,s), a10(i,p,r,s), a11(r,s), a12(i,p,r,s), a13(i,p,r,s),a14(i,p,r,s), a15(i,p,r,s),
aa1(i,p,r,t,s),aa2(i,p,r,t,s),aa3(i,p,r,t,s),aa4(i,p,r,t,s),aa5(i,p,r,t,s),aa6(i,p,r,t,s),aa7(i,p,r,t,s),aa8(i,p,r,t,s),aa9(i,p,r,t,s)

*c23(r,t,p,s),
d50(r,s)
**extra constraints
bb1(i,t,p,s),bb2(i,t,p,s),bb3(i,t,p,s)
cc1(i,s),cc2(t,s)
cc3(i,s),cc4(i,t,p,s)
*dd1(i,t,p,r),dd21(i,t,p,r)
*dd29(t,p,r,s),dd30(t,p,r,s),dd31(t,p,r)
*ddd31(i,t,p,r)
*d31(i,r),
*d100


**non-anticipativity

b1(t,p,s,sp),
b2(t,p,s,sp),
b3(t,p,s,sp),
b4(t,p,s,sp),
b5(t,p,s,sp),
b6(t,p,s,sp),
b7(t,p,s,sp),
b8(t,p,s,sp),

b9(p,l,s)
b10(p,l,s),
b11(p,l,s),
b12(p,l,s),
b13(p,l,s),
b14(p,l,s),
b15(p,l,s),
b16(p,l,s),
b17(p,l,s),
b18(p,l,s),
b19(p,l,s),
b20(p,l,s),

b29(p,l,s),
b210(p,l,s),
b211(p,l,s),
b212(p,l,s),
b213(p,l,s),
b214(p,l,s),
b215(p,l,s),
b216(p,l,s),
b217(p,l,s),
b218(p,l,s),
b219(p,l,s),
b220(p,l,s),


b113(s,sp),
b114(s,sp),
b115(s,sp),

g1(r,s),g2(r,s),g3(r,s),g4(r,s),g5(r,s)
d51(r,s),d52(r,s),d53(r,s)

gross(r,s), Dep(r,s) ,Cap(s) ,h(r,s)

*limit(r,t,p,s)

obj
*d100(s)
*d101(s)
;

$ontext
** objective function
obj.. cost =e= sum(s, pos(s)*workinginterest*(sum(r,(Qg(r,s)*Pg*30 + 30*Qo(r,s)*Po+30*Qng(r,s)*Png)*(1-Royalty)
                    -sum((i,t,p)$(ord(t)>=ord(r) and ord(p)<=ord(r)),Cm(i)*y(i,t,p,s))
                    -sum((i,t,p)$(ord(p)+4>=ord(r) and ord(p)<=ord(r) and ord(t)>= ord(r)),Ce(i)/5*y(i,t,p,s))*1/(1+MROR)**rr(r))
                    -sum((i,t,p),Co(i)*y(i,t,p,s)*1/(1+MROR)**pp(p))))
;
$offtext
** objective function
obj.. cost =e= sum(s,pos(s)*(sum(r, (GrossIncome(r,s)-Xtax(r,s)*FedTax))-Capitalcost(s)*(1-FedTax)));

gross(r,s)..GrossIncome(r,s) =e= ((30*Qg(r,s)*Pg + 30*Qo(r,s)*Po + 30*Qng(r,s)*Png)*(1-Royalty)*(1-LocTax)*workinginterest
                    -sum((i,t,p)$(ord(t)>=ord(r) and ord(p)<=ord(r)),Cm(i)*zy(i,t,p,s))*workinginterest)*1/(1+MROR)**rr(r);

Dep(r,s)..Depreciation(r,s) =e= sum((i,t,p)$(ord(p)+4>=ord(r) and ord(p)<=ord(r) and ord(t)>= ord(r)),Ce(i)/5*zy(i,t,p,s))*1/(1+MROR)**rr(r);

Cap(s)..Capitalcost(s) =e= sum((i,t,p),Co(i)*zy(i,t,p,s)*1/(1+MROR)**pp(p))*workinginterest;


h(r,s)..GrossIncome(r,s)-Depreciation(r,s) =e= tax(r,s);


** logic constraints
** logic constraints
c1(i,s).. sum((p), y(i,p,s)) =l= 1;
c2(p,s).. sum((i), y(i,p,s)) =l= 1;
c5(r,s).. LFR(r,s) =e= Qo(r,s) + Qng(r,s);

cc1(i,s)..sum((t),z(i,t,s)) =l= 1;
cc2(t,s)..sum((i),z(i,t,s)) =l= 1;
cc3(i,s)..sum((p),y(i,p,s))-sum((t),z(i,t,s)) =e= 0;
cc4(i,t,p,s)..zy(i,t,p,s)$(ord(t)<=ord(p)+3) =e= 0;
e1(i,t,p,j,k,l,s)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l) and ord(l) <= ord(t))..zy(i,t,p,s) + zy(j,k,l,s) =l= 1;
*e1(i,p,j,l)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l)).. y(i,p) + y(j,l) =l= 1;

f1(s)..Qg('1',s) =e= 800;
f2(s)..Qo('1',s) =e= 20;
f3(s)..Qng('1',s)=e= 500;
f4(s)..LFR('1',s) =e= 520;
$ontext
a1(r,s)$(ord(r)>= 2).. Qg(r,s) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2),yQgest(i,t,p,r,s));
a2(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,t,p,r,s) - 931.051*y(i,t,p,s) =l= 0;
a3(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQgest1(i,t,p,r,s) - 931.051*(1-y(i,t,p,s)) =l= 0;
a4(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. Qgest(i,t,p,r,s) - Qg(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a5(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,t,p,r,s) + yQgest1(i,t,p,r,s) - Qgest(i,t,p,r,s) =e= 0;

a6(r,s)$(ord(r)>= 2).. Qo(r,s) =e= sum((i,t,p)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2),yQoest(i,t,p,r,s));
a7(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,t,p,r,s) - 24*y(i,t,p,s) =l= 0;
a8(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQoest1(i,t,p,r,s) - 24*(1-y(i,t,p,s)) =l= 0;
a9(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. Qoest(i,t,p,r,s) - Qo(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a10(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,t,p,r,s) + yQoest1(i,t,p,r,s) - Qoest(i,t,p,r,s) =e= 0;

a11(r,s)$(ord(r)>= 2).. Qng(r,s) =e= sum((i,t,p)$(rr(t)>=rr(r) and ord(r)>=ord(p) and ord(p)>=2),yQngest(i,t,p,r,s));
a12(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,t,p,r,s) - 582.309*y(i,t,p,s) =l= 0;
a13(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQngest1(i,t,p,r,s) - 582.309*(1-y(i,t,p,s)) =l= 0;
a14(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. Qngest(i,t,p,r,s) - Qng(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a15(i,t,p,r,s)$(ord(t)>=ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,t,p,r,s) + yQngest1(i,t,p,r,s) - Qngest(i,t,p,r,s) =e= 0;
$offtext
a1(r,s)$(ord(r)>= 2).. Qg(r,s) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),yzQgest(i,p,r,t,s));

aa1(i,p,r,t,s)$(ord(t)>= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQgest(i,p,r,t,s) - 800*1.296*z(i,t,s) =l= 0;
aa2(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQgest1(i,p,r,t,s) - 800*power(1.296,2)*(1-z(i,t,s)) =l= 0;
aa3(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQgest(i,p,r,t,s) + yzQgest1(i,p,r,t,s) - yQgest(i,p,r,s) =e= 0;
a2(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,p,r,s) - 800*1.296*y(i,p,s) =l= 0;
a3(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest1(i,p,r,s) - 800*power(1.296,2)*(1-y(i,p,s)) =l= 0;
a4(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. Qgest(i,p,r,s) - Qg(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b)=e= 0;
a5(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,p,r,s) + yQgest1(i,p,r,s) - Qgest(i,p,r,s) =e= 0;

a6(r,s)$(ord(r)>= 2).. Qo(r,s) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),yzQoest(i,p,r,t,s));

aa4(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQoest(i,p,r,t,s) - 20*1.296*z(i,t,s) =l= 0;
aa5(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQoest1(i,p,r,t,s) - 20*power(1.296,2)*(1-z(i,t,s)) =l= 0;
aa6(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQoest(i,p,r,t,s) + yzQoest1(i,p,r,t,s) - yQoest(i,p,r,s) =e= 0;
a7(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,p,r,s) - 20*1.296*y(i,p,s) =l= 0;
a8(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest1(i,p,r,s) - 20*power(1.296,2)*(1-y(i,p,s)) =l= 0;
a9(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. Qoest(i,p,r,s) - Qo(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a10(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,p,r,s) + yQoest1(i,p,r,s) - Qoest(i,p,r,s) =e= 0;

a11(r,s)$(ord(r)>= 2).. Qng(r,s) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),yzQngest(i,p,r,t,s));

aa7(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQngest(i,p,r,t,s) - 500*1.296*z(i,t,s) =l= 0;
aa8(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQngest1(i,p,r,t,s) - 500*power(1.296,2)*(1-z(i,t,s)) =l= 0;
aa9(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. yzQngest(i,p,r,t,s) + yzQngest1(i,p,r,t,s) - yQngest(i,p,r,s) =e= 0;
a12(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,p,r,s) - 500*1.296*y(i,p,s) =l= 0;
a13(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest1(i,p,r,s) - 500*power(1.296,2)*(1-y(i,p,s)) =l= 0;
a14(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. Qngest(i,p,r,s) - Qng(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
a15(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,p,r,s) + yQngest1(i,p,r,s) - Qngest(i,p,r,s) =e= 0;



** linearization of two binary variables
bb1(i,t,p,s)..zy(i,t,p,s) =l= y(i,p,s);
bb2(i,t,p,s)..zy(i,t,p,s) =l= z(i,t,s);
bb3(i,t,p,s)..zy(i,t,p,s) =g= y(i,p,s) + z(i,t,s)-1;
** method 5

** method 6

*limit(r,t,p,s)$(ord(t)>=ord(r) and ord(r)>=ord(p))..zy('6',t,p,s)*200-LFR(r,s)=l=0;
** method 7


*c23(r,t,p,s)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. zy('7',t,p,s)*300- LFR(r,s) =l= 0;



* non-anticipativity constraints
* method 5
b1(t,p,s,sp)$(ord(sp)>=5 and ord(s)<=4 and ord(p)>=2 and ord(t)>=ord(p)+1)..y('6',t,s) - y('6',t,sp) =l= 1- y('5',p,s);
b2(t,p,s,sp)$(ord(sp)>=5 and ord(s)<=4 and ord(p)>=2 and ord(t)>=ord(p)+1)..y('6',t,s) - y('6',t,sp) =g= y('5',p,s)-1;
b3(t,p,s,sp)$(ord(sp)>=5 and ord(s)<=4 and ord(p)>=2 and ord(t)>=ord(p)+1)..y('7',t,s) - y('7',t,sp) =l= 1- y('5',p,s);
b4(t,p,s,sp)$(ord(sp)>=5 and ord(s)<=4 and ord(p)>=2 and ord(t)>=ord(p)+1)..y('7',t,s) - y('7',t,sp) =g= y('5',p,s) - 1;

*mehtod 6
b5(t,p,s,sp)$(ord(sp)=1 or ord(sp)=2 or ord(sp)=5 or ord(sp)=6 and ord(s)=3 or ord(s)=4 or ord(s)=7 or ord(s)=8 and ord(t)>=ord(p)+1 and ord(p)>=2)..y('5',t,s) - y('5',t,sp) =l= 1- y('6',p,s);
b6(t,p,s,sp)$(ord(sp)=1 or ord(sp)=2 or ord(sp)=5 or ord(sp)=6 and ord(s)=3 or ord(s)=4 or ord(s)=7 or ord(s)=8 and ord(t)>=ord(p)+1 and ord(p)>=2)..y('5',t,s) - y('5',t,sp) =g= y('6',p,s) - 1;
b7(t,p,s,sp)$(ord(sp)=1 or ord(sp)=2 or ord(sp)=5 or ord(sp)=6 and ord(s)=3 or ord(s)=4 or ord(s)=7 or ord(s)=8 and ord(t)>=ord(p)+1 and ord(p)>=2)..y('7',t,s) - y('7',t,sp) =l= 1- y('6',p,s);
b8(t,p,s,sp)$(ord(sp)=1 or ord(sp)=2 or ord(sp)=5 or ord(sp)=6 and ord(s)=3 or ord(s)=4 or ord(s)=7 or ord(s)=8 and ord(t)>=ord(p)+1 and ord(p)>=2)..y('7',t,s) - y('7',t,sp) =g= y('6',p,s) - 1;

* method 7
b9(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'1') - y('5',l,'3') =l= 1 - z('7',p,s);
b10(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'1') - y('5',l,'3') =g= z('7',p,s) - 1;
b11(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'3') - y('5',l,'5') =l= 1 - z('7',p,s);
b12(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'3') - y('5',l,'5') =g= z('7',p,s) - 1;
b13(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'5') - y('5',l,'7') =l= 1 - z('7',p,s);
b14(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'5') - y('5',l,'7') =g= z('7',p,s) - 1;

b29(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'2') - y('5',l,'4') =l= 1 - z('7',p,s);
b210(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'2') - y('5',l,'4') =g= z('7',p,s) - 1;
b211(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'4') - y('5',l,'6') =l= 1 - z('7',p,s);
b212(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'4') - y('5',l,'6') =g= z('7',p,s) - 1;
b213(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'6') - y('5',l,'8') =l= 1 - z('7',p,s);
b214(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'6') - y('5',l,'8') =g= z('7',p,s) - 1;

b15(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'1') - y('6',l,'3') =l= 1 - z('7',p,s);
b16(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'1') - y('6',l,'3') =g= z('7',p,s) - 1;
b17(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'3') - y('6',l,'5') =l= 1 - z('7',p,s);
b18(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'3') - y('6',l,'5') =g= z('7',p,s) - 1;
b19(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'5') - y('6',l,'7') =l= 1 - z('7',p,s);
b20(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'5') - y('6',l,'7') =g= z('7',p,s) - 1;

b215(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'2') - y('6',l,'4') =l= 1 - z('7',p,s);
b216(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'2') - y('6',l,'4') =g= z('7',p,s) - 1;
b217(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'4') - y('6',l,'6') =l= 1 - z('7',p,s);
b218(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'4') - y('6',l,'6') =g= z('7',p,s) - 1;
b219(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'6') - y('6',l,'8') =l= 1 - z('7',p,s);
b220(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('6',l,'6') - y('6',l,'8') =g= z('7',p,s) - 1;
* first-stage regarding all scenarios as indistinguish
b113(s,sp)..y('5','2',s) =e= y('5','2',sp) ;
b114(s,sp)..y('6','2',s) =e= y('6','2',sp) ;
b115(s,sp)..y('7','2',s) =e= y('7','2',sp) ;


d50(r,s)$(ord(r)>=2)..LFR(r,s) =l= 520*1.296*1.26*(1+b*D*(rr(r)-1))**(-1/b);
d51(r,s)$(ord(r)>=2)..Qg(r,s) =l= 800*1.296*1.26*(1+b*D*(rr(r)-1))**(-1/b);
d52(r,s)$(ord(r)>=2)..Qo(r,s) =l= 20*1.296*1.26*(1+b*D*(rr(r)-1))**(-1/b);
d53(r,s)$(ord(r)>=2)..Qng(r,s) =l= 500*1.296*1.26*(1+b*D*(rr(r)-1))**(-1/b);

g1(r,s)..tax(r,s) =e= Xtax(r,s) + Xtax1(r,s);
g2(r,s)..Xtax(r,s) - x(r,s)*4231650 =l= 0;
g3(r,s)..Xtax1(r,s) + (1-x(r,s))*4231650 =g= 0;
g4(r,s).. tax(r,s) - 4231650*x(r,s) =l= 0;
g5(r,s).. tax(r,s) - 4231650*(x(r,s)-1) =g= 0;

*d100(s)..y('7','2',s)=e=1;
*d101(s)$(ord(s) = 1 or ord(s) =3 or ord(s) =5 or ord(s) =7)..z('7','16',s)=e=1;

option limrow = 0,
       limcol = 0,
       iterlim = 1e9,
       reslim = 72000,
*     minlp = sbb,
*       minlp = sbb,
       mip = cplex,
*      minlp = alphaecp,
       solprint = on;
option optcr=0.001;
Model Horizonwell /all/;
Horizonwell.optfile=1;
Solve Horizonwell using MIP max cost;
Display y.l, z.l, Qg.l,LFR.l,tax.l,x.l,Qgbar;
