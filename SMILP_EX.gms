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
set T time periods /1*16/
    s senarios /1*256/
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
* Pg Price of gas /6/
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
/
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
           1*8        9*16      17*24     25*32     33*40       41*48     49*56   57*64
        5  1.176      1.176     1.176     1.176     0.784       0.784     0.784   0.784
        6  1.26       1.26      0.84      0.84      1.26        1.26      0.84    0.84
        7  1.296      0.864     1.296     0.864     1.296       0.864     1.296   0.864

;

table Pg(t,s)
             1    2    3    4    5    6    7    8    9   10   11   12    13   14   15   16   17   18   19   20   21   22   23   24   25   26   27   28   29   30   31   32   33   34   35   36   37   38   39   40   41   42   43   44   45   46   47   48   49   50   51   52   53   54   55   56   57   58   59   60   61   62   63   64
         1   6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6
         2   6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6
         3   6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6    6
         4   6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4
         5   6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4
         6   6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4
         7   6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4  6.6  6.6  6.6  6.6  5.4  5.4  5.4  5.4
         8   7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68
         9   7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68
         10  7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68
         11  7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68 7.26 7.26 5.94 5.94 5.94 5.94 4.68 4.68
         12  7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37
         13  7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37
         14  7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37
         15  7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37
         16  7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37 7.99 6.53 6.53 5.35 6.53 5.35 5.35 4.37
;

Parameter ESPH(s)
/
1*16 1
17*32 0
33*48 1
49*64 0/;

Parameter ESPL(s)
/
1*16 0
17*32 1
33*48 0
49*64 1/;

Parameter SRPH(s)
/
1*8 1
9*16 0
17*24 1
25*32 0
33*40 1
41*48 0
49*56 1
57*64 0
/;

Parameter SRPL(s)
/
1*8 0
9*16 1
17*24 0
25*32 1
33*40 0
41*48 1
49*56 0
57*64 1
/;

Parameter GASH(s)
/
1*32 1
33*64 0/;

Parameter GASL(s)
/
1*32 0
33*64 1/;

Parameter t_fourH(s)
/
1*4 1
5*8 0
9*12 1
13*16 0
17*20 1
21*24 0
25*28 1
29*32 0
33*36 1
37*40 0
41*44 1
45*48 0
49*52 1
53*56 0
57*60 1
61*64 0
/
;

Parameter t_fourL(s)
/
1*4 0
5*8 1
9*12 0
13*16 1
17*20 0
21*24 1
25*28 0
29*32 1
33*36 0
37*40 1
41*44 0
45*48 1
49*52 0
53*56 1
57*60 0
61*64 1
/
;

Parameter t_eightH(s)
/
1*2 1
3*4 0
5*6 1
7*8 0
9*10  1
11*12 0
13*14 1
15*16 0
17*18 1
19*20 0
21*22 1
23*24 0
25*26 1
27*28 0
29*30 1
31*32 0
33*34 1
35*36 0
37*38 1
39*40 0
41*42 1
43*44 0
45*46 1
47*48 0
49*50 1
51*52 0
53*54 1
55*56 0
57*58 1
59*60 0
61*62 1
63*64 0
/
;

Parameter t_eightL(s)
/
1*2   0
3*4   1
5*6   0
7*8   1
9*10  0
11*12 1
13*14 0
15*16 1
17*18 0
19*20 1
21*22 0
23*24 1
25*26 0
27*28 1
29*30 0
31*32 1
33*34 0
35*36 1
37*38 0
39*40 1
41*42 0
43*44 1
45*46 0
47*48 1
49*50 0
51*52 1
53*54 0
55*56 1
57*58 0
59*60 1
61*62 0
63*64 1
/
;
*-------------------------------------------------------------------------------



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

wQgest(i,p,r,t,s),wQgest1(i,p,r,t,s)
wQoest(i,p,r,t,s),wQoest1(i,p,r,t,s)
wQngest(i,p,r,t,s),wQngest1(i,p,r,t,s)
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
y(i,p,s), x(r,s),z(i,t,s),w(i,t,p,s)
;

Equations
** condition if constraints
c5(r,s)
e1(i,t,p,j,k,l,s),
f1(s), f2(s), f3(s), f4(s),

*d1(i,s), d2(p,s), d3(t,s),d4(i,t,p,s), d5(r,s),
e1(i,t,p,j,k,l,s),
f1(s), f2(s), f3(s), f4(s),

a1(r,s),a4(i,p,r,s),  a6(r,s), a9(i,p,r,s),  a11(r,s), a14(i,p,r,s)
aa1(i,p,r,t,s),aa2(i,p,r,t,s),aa3(i,p,r,t,s),aa4(i,p,r,t,s),aa5(i,p,r,t,s),aa6(i,p,r,t,s),aa7(i,p,r,t,s),aa8(i,p,r,t,s),aa9(i,p,r,t,s)

c23(r,t,p,s),
d50(r,s)
**extra constraints
*bb1(i,t,p,s),bb2(i,t,p,s),bb3(i,t,p,s)
cc4(i,t,p,s)
*dd1(i,t,p,r),dd21(i,t,p,r)
*dd29(t,p,r,s),dd30(t,p,r,s),dd31(t,p,r)
*ddd31(i,t,p,r)
*d31(i,r),
*d100

*a2(i,p,r,s), a3(i,p,r,s),a5(i,p,r,s), a7(i,p,r,s), a10(i,p,r,s),a8(i,p,r,s),a12(i,p,r,s), a13(i,p,r,s), a15(i,p,r,s),
**non-anticipativity

b1(t,p,s,sp),
b2(t,p,s,sp),
b3(t,p,s,sp),
b4(t,p,s,sp),
b5(t,p,s,sp),
b6(t,p,s,sp),
b7(t,p,s,sp),
b8(t,p,s,sp),

b9(t,p,s,sp)
b10(t,p,s,sp),
b11(t,p,s,sp),
b12(t,p,s,sp),


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
relation(i,t,p,s),relation1(i,t,p,s),relation2(i,t,p,s)
ccc1(i,s),ccc2(t,s),ccc3(p,s)
*c1(i,s),c2(p,s),cc1(i,s),cc2(t,s),cc3(i,s),
*cc1(i,s),cc2(t,s),c1(i,s),c2(p,s),
cc3(i,s)


exo1(i,t,s,sp)
exo2(i,t,s,sp)
exo11(i,t,s,sp)
exo22(i,t,s,sp)
*e3(i,t,s,sp)
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

gross(r,s)..GrossIncome(r,s) =e= ((30*Qg(r,s)*Pg(r,s) + 30*Qo(r,s)*Po + 30*Qng(r,s)*Png)*(1-Royalty)*(1-LocTax)*workinginterest
                    -sum((i,t,p)$(ord(t)>=ord(r) and ord(p)<=ord(r)),Cm(i)*w(i,t,p,s))*workinginterest)*1/(1+MROR)**rr(r);

Dep(r,s)..Depreciation(r,s) =e= sum((i,t,p)$(ord(p)+4>=ord(r) and ord(p)<=ord(r) and ord(t)>= ord(r)),Ce(i)/5*w(i,t,p,s))*1/(1+MROR)**rr(r);

Cap(s)..Capitalcost(s) =e= sum((i,t,p),Co(i)*w(i,t,p,s)*1/(1+MROR)**pp(p))*workinginterest;


h(r,s)..GrossIncome(r,s)-Depreciation(r,s) =e= tax(r,s);


** logic constraints
** logic constraints
*c1(i,s).. sum((p), y(i,p,s)) =l= 1;
*c2(p,s).. sum((i), y(i,p,s)) =l= 1;
c5(r,s).. LFR(r,s) =e= Qo(r,s) + Qng(r,s);

ccc1(i,s)..sum((t,p),w(i,t,p,s))=l=1;
ccc2(t,s)..sum((i,p),w(i,t,p,s))=l=1;
ccc3(p,s)..sum((i,t),w(i,t,p,s))=l=1;
*cc1(i,s)..sum((t),z(i,t,s)) =l= 1;
*cc2(t,s)..sum((i),z(i,t,s)) =l= 1;
*cc3(i,t,p,s)$(ord(t) gt ord(p)+3)..z(i,t,s) - y(i,p,s)=g=0;
cc3(i,s)..sum((p),y(i,p,s))-sum((t),z(i,t,s)) =e= 0;
cc4(i,t,p,s)..w(i,t,p,s)$(ord(t)<=ord(p)+3) =e= 0;
e1(i,t,p,j,k,l,s)$(ord(i) ne ord(j) and ord(p)+1 <= ord(l) and ord(l) <= ord(t))..w(i,t,p,s) + w(j,k,l,s) =l= 1;
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
a1(r,s)$(ord(r)>= 2).. Qg(r,s) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),wQgest(i,p,r,t,s));

aa1(i,p,r,t,s)$(ord(t)>= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQgest(i,p,r,t,s) - 800*1.296*w(i,t,p,s) =l= 0;
aa2(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQgest1(i,p,r,t,s) - 800*power(1.296,2)*(1-w(i,t,p,s)) =l= 0;
aa3(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQgest(i,p,r,t,s) + wQgest1(i,p,r,t,s) - Qgest(i,p,r,s) =e= 0;
*a2(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest(i,p,r,s) - 800*1.296*y(i,p,s) =l= 0;
*a3(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQgest1(i,p,r,s) - 800*power(1.296,2)*(1-y(i,p,s)) =l= 0;
a4(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. Qgest(i,p,r,s) - Qg(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b)=e= 0;
*a5(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. wQgest(i,p,r,s) + wQgest1(i,p,r,s) - Qgest(i,p,r,s) =e= 0;

a6(r,s)$(ord(r)>= 2).. Qo(r,s) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),wQoest(i,p,r,t,s));

aa4(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQoest(i,p,r,t,s) - 20*1.296*w(i,t,p,s) =l= 0;
aa5(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQoest1(i,p,r,t,s) - 20*power(1.296,2)*(1-w(i,t,p,s)) =l= 0;
aa6(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQoest(i,p,r,t,s) + wQoest1(i,p,r,t,s) - Qoest(i,p,r,s) =e= 0;
*a7(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,p,r,s) - 20*1.296*y(i,p,s) =l= 0;
*a8(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest1(i,p,r,s) - 20*power(1.296,2)*(1-y(i,p,s)) =l= 0;
a9(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. Qoest(i,p,r,s) - Qo(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
*a10(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQoest(i,p,r,s) + yQoest1(i,p,r,s) - Qoest(i,p,r,s) =e= 0;

a11(r,s)$(ord(r)>= 2).. Qng(r,s) =e= sum((i,p,t)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2),wQngest(i,p,r,t,s));

aa7(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQngest(i,p,r,t,s) - 500*1.296*w(i,t,p,s) =l= 0;
aa8(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQngest1(i,p,r,t,s) - 500*power(1.296,2)*(1-w(i,t,p,s)) =l= 0;
aa9(i,p,r,t,s)$(ord(t) >= ord(r) and ord(r)>=ord(p) and ord(p)>=2).. wQngest(i,p,r,t,s) + wQngest1(i,p,r,t,s) - Qngest(i,p,r,s) =e= 0;
*a12(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,p,r,s) - 500*1.296*y(i,p,s) =l= 0;
*a13(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest1(i,p,r,s) - 500*power(1.296,2)*(1-y(i,p,s)) =l= 0;
a14(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. Qngest(i,p,r,s) - Qng(p-1,s)*Qgbar(i,s)*(1 + b*D*(rr(r)-pp(p)+1))**(-1/b) =e= 0;
*a15(i,p,r,s)$(ord(r)>=ord(p) and ord(p)>=2).. yQngest(i,p,r,s) + yQngest1(i,p,r,s) - Qngest(i,p,r,s) =e= 0;


*relation between y,z,w
relation(i,t,p,s)..1-z(i,t,s)-y(i,p,s)+w(i,t,p,s)=g=0;
relation1(i,t,p,s)..y(i,p,s) - w(i,t,p,s) =g=0;
relation2(i,t,p,s)..z(i,t,s) - w(i,t,p,s) =g=0;
** linearization of two binary variables
**bb1(i,t,p,s)..zy(i,t,p,s) =l= y(i,p,s);
*bb2(i,t,p,s)..zy(i,t,p,s) =l= z(i,t,s);
*bb3(i,t,p,s)..zy(i,t,p,s) =g= y(i,p,s) + z(i,t,s)-1;
** method 5

** method 6

*limit(r,t,p,s)$(ord(t)>=ord(r) and ord(r)>=ord(p))..zy('6',t,p,s)*200-LFR(r,s)=l=0;
** method 7


c23(r,t,p,s)$(ord(t)>=ord(r) and ord(r)>=ord(p)).. w('7',t,p,s)*300- LFR(r,s) =l= 0;



* non-anticipativity constraints

* method 5
b1(t,p,s,sp)$( GASH(sp) and GASH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or GASL(sp) and GASL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('6',t,s) - y('6',t,sp) =l= 1- y('5',p,s);
b2(t,p,s,sp)$( GASH(sp) and GASH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or GASL(sp) and GASL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('6',t,s) - y('6',t,sp) =g= y('5',p,s)-1;
b3(t,p,s,sp)$( GASH(sp) and GASH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or GASL(sp) and GASL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('7',t,s) - y('7',t,sp) =l= 1- y('5',p,s);
b4(t,p,s,sp)$( GASH(sp) and GASH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or GASL(sp) and GASL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('7',t,s) - y('7',t,sp) =g= y('5',p,s) - 1;

*mehtod 6
b5(t,p,s,sp)$( ESPH(sp) and ESPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or ESPL(sp) and ESPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('5',t,s) - y('5',t,sp) =l= 1- y('6',p,s);
b6(t,p,s,sp)$( ESPH(sp) and ESPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or ESPL(sp) and ESPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('5',t,s) - y('5',t,sp) =g= y('6',p,s) - 1;
b7(t,p,s,sp)$( ESPH(sp) and ESPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or ESPL(sp) and ESPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('7',t,s) - y('7',t,sp) =l= 1- y('6',p,s);
b8(t,p,s,sp)$( ESPH(sp) and ESPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or ESPL(sp) and ESPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('7',t,s) - y('7',t,sp) =g= y('6',p,s) - 1;

* method 7
*b9(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'1') - y('5',l,'3') =l= 1 - z('7',p,s);
*b10(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'1') - y('5',l,'3') =g= z('7',p,s) - 1;
*b11(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'3') - y('5',l,'5') =l= 1 - z('7',p,s);
*b12(p,l,s)$(ord(l)>=ord(p)+1 and ord(p)>=2)..y('5',l,'3') - y('5',l,'5') =g= z('7',p,s) - 1;

b9(t,p,s,sp)$( SRPH(sp) and SRPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or SRPL(sp) and SRPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('5',t,s) - y('5',t,sp) =l= 1- y('7',p,s);
b10(t,p,s,sp)$( SRPH(sp) and SRPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or SRPL(sp) and SRPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('5',t,s) - y('5',t,sp) =g= y('7',p,s) - 1;

b11(t,p,s,sp)$(SRPH(sp) and SRPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or SRPL(sp) and SRPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('6',t,s) - y('6',t,sp) =l= 1- y('7',p,s);
b12(t,p,s,sp)$( SRPH(sp) and SRPH(s) and ord(p)>=2 and ord(t)>=ord(p)+1 or SRPL(sp) and SRPL(s) and ord(p)>=2 and ord(t)>=ord(p)+1 )..y('6',t,s) - y('6',t,sp) =g= y('7',p,s) - 1;




* first-stage regarding all scenarios as indistinguish
b113(s,sp)..y('5','2',s) =e= y('5','2',sp) ;
b114(s,sp)..y('6','2',s) =e= y('6','2',sp) ;
b115(s,sp)..y('7','2',s) =e= y('7','2',sp) ;

* exogenous NACs
exo1(i,t,s,sp)$(t_fourL(s) and t_fourL(sp) and ord(t)>=4 and ord(t)<=7)..y(i,t,s) =e= y(i,t,sp) ;
exo11(i,t,s,sp)$(t_fourH(s) and t_fourH(sp) and ord(t)>=4 and ord(t)<=7)..y(i,t,s) =e= y(i,t,sp) ;

exo2(i,t,s,sp)$(t_eightL(s) and t_eightL(sp)and ord(t)>=8 and ord(t)<=11)..y(i,t,s) =e= y(i,t,sp);
exo22(i,t,s,sp)$(t_eightH(s) and t_eightH(sp) and ord(t)>=8 and ord(t)<=11)..y(i,t,s) =e= y(i,t,sp);
*e3(i,t,s,sp)$( even(ord(s)))..y(i,t,s) =e= y(i,t,sp) ;


d50(r,s)$(ord(r)>=2)..LFR(r,s) =l= 520*1.296*1.296*sum((i,p)$(ord(i) ne 7),y(i,p,s)*Qgbar(i,s))*(1+b*D*(rr(r)-1))**(-1/b);
d51(r,s)$(ord(r)>=2)..Qg(r,s) =l= 800*1.296*1.296*sum((i,p)$(ord(i) ne 7),y(i,p,s)*Qgbar(i,s))*(1+b*D*(rr(r)-1))**(-1/b);
d52(r,s)$(ord(r)>=2)..Qo(r,s) =l= 20*1.296*1.296*sum((i,p)$(ord(i) ne 7),y(i,p,s)*Qgbar(i,s))*(1+b*D*(rr(r)-1))**(-1/b);
d53(r,s)$(ord(r)>=2)..Qng(r,s) =l= 500*1.296*1.296*sum((i,p)$(ord(i) ne 7),y(i,p,s)*Qgbar(i,s))*(1+b*D*(rr(r)-1))**(-1/b);

g1(r,s)..tax(r,s) =e= Xtax(r,s) + Xtax1(r,s);
g2(r,s)..Xtax(r,s) - x(r,s)*423165000 =l= 0;
g3(r,s)..Xtax1(r,s) + (1-x(r,s))*423165000 =g= 0;
g4(r,s).. tax(r,s) - 423165000*x(r,s) =l= 0;
g5(r,s).. tax(r,s) - 423165000*(x(r,s)-1) =g= 0;

*d100(s)..y('7','2',s)=e=1;
*d101(s)$(ord(s) = 1 or ord(s) =3 or ord(s) =5 or ord(s) =7)..z('7','16',s)=e=1;

option limrow = 0,
       limcol = 0,
       iterlim = 1e9,
       reslim = 36000,
*     minlp = sbb,
*       minlp = sbb,
       mip = cplex,
*      minlp = alphaecp,
       solprint = on;
option optcr=0.001;
Model Horizonwell /all/;
Horizonwell.optfile=1;
Solve Horizonwell using MIP max cost;
Display y.l, z.l,w.l, Qg.l,LFR.l,tax.l,x.l,Qgbar;
