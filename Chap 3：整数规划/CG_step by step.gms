$ontext
    demo for CSP by CG
    CG master problem & CG sub problem
    Step by step, you should update mode p and a(p,i)
    Created by ET Wang
    2019.4.18
$offtext

set i/1,2,3/;
*the set of demand
set p/1,2,3,4,5,6/;
*the set of mode

table a(p,i)
*the known mode j matrix for demand i
    1   2   3
1   1
2       1   
3           1
*the following mode is Column Gneration
4           3
5       3
6   2
;
parameter n(i)/
*the demand of each factory
1   44
2   3
3   48/;

parameter w(i)/
*the width of each steel in each factory
1   81
2   70
3   69/;

parameter CW/218/;
*the tatal length of the steel

****establish the master problem****
positive variable x(p);
variable z_master;

equation master_obj_func;
equation master_demand_const(i);

master_obj_func..
    z_master=e=sum(p,x(p));
master_demand_const(i)..
    sum(p,a(p,i)*x(p))=g=n(i);

model master_pro/master_obj_func,master_demand_const/;

solve master_pro using LP minimizing z_master;
display x.l,z_master.l;
display master_demand_const.m;
**which marginal here? master_demand?

****establish the sub problem****
integer variable y(i);
*Gnerate a new Column y, that is the new pattern
variable z_sub;
*the object function

equation sub_obj_fun;
equation sub_width;

sub_obj_fun..
    z_sub=e=1-sum(i,master_demand_const.m(i)*y(i));

sub_width..
    sum(i,w(i)*y(i))=l=CW;

model sub_pro/sub_obj_fun,sub_width/;

solve sub_pro using MIP minimizing z_sub;
display z_sub.l,y.l;

