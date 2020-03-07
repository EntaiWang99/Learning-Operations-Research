$ontext
    demo for CSP by CG
    Only CG master problem
    Created by ET Wang
$offtext

set i/1,2,3/;
*the set of demand
set j/1,2,3/;
*the set of mode

table a(i,j)
*the known mode j matrix for demand i
    1   2   3
1   4
2       1   1
3           2;

parameter n(i)/
*the demand of each factory
1   100
2   200
3   300/;

positive variable x(j);
variable z;

equation obj_func;
equation demand_const(i);

obj_func..
    z=e=sum(j,x(j));
demand_const(i)..
    sum(j,a(i,j)*x(j))=g=n(i);

model CG_master_pro/all/;

solve CG_master_pro using LP minimizing z;
*What is the differences of LP or MIP??
*the algorithms required
display x.l,z.l;
