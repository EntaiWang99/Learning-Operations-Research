$ontext
demo for knapsack problem
created by etwang
$offtext

set i/1*5/;

parameter w(i)/1    2
               2    4
               3    9
               4    1
               5    2
               /;
parameter v(i)/1    2
               2    3
               3    5
               4    1
               5    9
               /;
parameter c(i)/1    3
               2    5
               3    7
               4    1
               5    9
               /;
parameter Capacityw/12/;
parameter Capacityv/18/;

binary variable x(i);
variable z;

equation obj_function;
equation constraint_capacityw;
equation constraint_capacityv;
*satisfy Weight & V 

obj_function..
z=e=sum(i,c(i)*x(i));

constraint_capacityw..
sum(i,w(i)*x(i))=l=Capacityw;

constraint_capacityv..
sum(i,v(i)*x(i))=l=Capacityv;

model KP_pro/all/;
solve KP_pro using MIP maximizing z;

display x.l,z.l;





