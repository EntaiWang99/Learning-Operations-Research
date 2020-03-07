$ontext
    demo for CSP by CG
    looping Automatically
    Created by ET Wang
$offtext

****the definition of sets****
set i/1,2,3,4,5,6/;
set pp/1*1000/;
*Total growth
set p(pp);
*the subset of pp, the actual growth
set pi(pp);
*the subset of pp, the current growth

p('1')=yes;
p('2')=yes;
p('3')=yes;
*'yes' means that you can use??
pi('2')=yes;
* the current active number

table a(pp,i)
*the known mode j matrix for demand i
*why pp:input the value : complete set
    1   2
1   2   1
2   1   1
3       1
4       1
5       1
6       1       ;

parameter n(i)/
*the demand of each factory
1        233
2        310
3        122
4        157
5        120/;

****Step 1:the master problem****
parameter w(i)/
1        18
2        91
3        21
4        136
5        51
/;
parameter CW/273/;
positive variable x(pp);
*x must belong to the Complete set(pp)
variable z_master;

equation master_obj_func;
equation master_demand_const(i);

master_obj_func..
    z_master=e=sum(p,x(p));
master_demand_const(i)..
    sum(p,a(p,i)*x(p))=g=n(i);

model master_pro/master_obj_func,master_demand_const/;

*solve master_pro using LP minimizing z_master;
*display x.l,z_master.l;
*display master_demand_const.m;

****Step 2: the sub problem****
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

*solve sub_pro using MIP minimizing z_sub;
*display z_sub.l,y.l;

****Step 3: the looping process****
set iter/1*8/;
*Possible numbers of iterating
parameter sub_value/-1/;
*intermediate variables，its value is useless

parameter result(iter,*);
*you can put result into *,for every iter put sth into *
*dynamic array

loop(iter$(sub_value),
*loop(iter$(sub_value=l=0),
*solve the master problem
    solve master_pro using LP minimizing z_master;
    solve sub_pro using MIP minimizing z_sub;

    sub_value=z_sub.l;
*update the value

    result(iter,p)=x.l(p);
*put the value into result

    result(iter,'z_master')=z_master.l;
**output the dual multiplier,current z value

    result(iter,'dual_1')=master_demand_const.m('1');
    result(iter,'dual_2')=master_demand_const.m('2');
    result(iter,'dual_3')=master_demand_const.m('3');
**the current iter, put dual_i into it

****Step 4:Column Gneration****
    pi(pp)=pi(pp-1);
    a(pi,i)=y.l(i);
    p(pi)=yes;
*after generation,pi can be used
);
display result;
