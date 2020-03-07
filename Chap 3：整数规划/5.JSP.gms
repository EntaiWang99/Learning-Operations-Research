$ontext
demo for job shop problem
created by etwang
$offtext

set i/1*4/;
alias(i,j);

parameter a(i)/
1        10
2        15
3        15
4        5
*20 can divide into 2 parts in order to satisfy it
/;
parameter p(i)/
1        12
2        10
3        14
4        14
/;
parameter M/99999/;
binary variable x(i,j);
positive variable t(i);
variable z;

equation obj_func;
equation const_1(i,j);
equation const_2(i,j);
*equation const_3(i,j);

obj_func..
         z=e=sum(i,a(i)*t(i));
const_1(i,j)$(i.val<>j.val)..
         t(i)+M*(1-x(i,j))=g=t(j)+p(j);
const_2(i,j)$(i.val<>j.val)..
         x(i,j)+x(j,i)=e=1;
*const_3(i,j)..
***sum(i,a(i))=e=45;

model JSP_pro /all/;
solve JSP_pro using MIP minimizing z;
display x.l;
display t.l;
display z.l;
