$ontext
demo for traveling salesman problem
created by et wang
$offtext
*where is starting in model?
*the start doesn't matter!! All the same
set i/1*5/;
alias(i,j);

*x(i) or p_x(i) ??

parameter p_x(i)/1    1
                 2    2
                 3    4
                 4    5
                 5    4
               /;
parameter p_y(i)/1    1
                 2    3
                 3    3
                 4    2
                 5    0
               /;
parameter c(i,j);
c(i,j)=sqrt(power((p_x(i)-p_x(j)),2)+power((p_y(i)-p_y(j)),2));
parameter n/5/;

binary variable x(i,j);
variable z;
positive variable u(i);

equation obj_function;
equation const_in(j);
equation const_out(i);
equation dividing_looping(i,j);

obj_function..
z=e=sum((i,j),c(i,j)*x(i,j));

const_in(j)..
sum(i$(i.val<>j.val),x(i,j))=e=1;

const_out(i)..
sum(j$(i.val<>j.val),x(i,j))=e=1;

dividing_looping(i,j)$(i.val<>j.val and i.val>1 and j.val>1)..
u(i)-u(j)+n*x(i,j)=l=n-1;

model TSP_pro/all/;
solve TSP_pro using MIP minimizing z;

display x.l,z.l;





