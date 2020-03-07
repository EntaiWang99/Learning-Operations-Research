$ontext
demo for lp;
created by et wang;
$offtext

set i/1,2,3,4/;
alias(i,j);

parameter p(i)/
1 5
2 9
3 7
4 10
/;
parameter a(i)/

/;
parameter b(i)/
1 40
2 60
/;

variable x(j);
variable z;

equation obj_func;
equation constraint(i);

obj_func..
z=e=sum(j,c(j)*x(j));

constraint(i)..
sum(j,a(i,j)*x(j))=l=b(i);

model lp_test/obj_func,constraint/;
*constraint在model中不用加i
solve lp_test using LP minimaing z;
display x.l;
*这里直接x,不是x(i).l
display z.l;


