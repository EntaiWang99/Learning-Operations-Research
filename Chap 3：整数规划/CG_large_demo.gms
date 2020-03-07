$ontext
demo for Cutting Stock Problem
created by et wang

How about m = 17, W = 100 and the demand are
ni=
{100,200,300,400,500,400,400,400,100,200,300,400,500,400,400,400
wi = {25,35,300,45,10,5,15,20,30,6,7,8,9,10,11,12,13,9}
$offtext

set k/1*1000/;
*the number of Stock
set i/1*6/;
*the number of factories

parameter n(i)/
*the demand of each factory
1        233
2        310
3        122
4        157
5        120/;

parameter w(i)/
*the standard of demand
1        18
2        91
3        21
4        136
5        120
/;

parameter WM/273/;
*the max length of Stock

integer variable x(i,k);
binary variable y(k);
variable z;

equation obj_func;
equation demand(i);
equation width;

obj_func..
    z=e=sum(k,y(k));
demand(i)..
    sum(k,x(i,k))=g=n(i);
width(k)..
    sum(i,w(i)*x(i,k))=l=WM*y(k);

model CSP_pro/all/;

solve CSP_pro using MIP minimazing z;
*solve CSP_pro using LP minimazing z;

display x.l,z.l;


