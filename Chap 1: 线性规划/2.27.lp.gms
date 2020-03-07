$ontext
demo for lp;
created by et wang;
$offtext


set i/1*3/;
set j/1*3/;


table a(i,j)
         1       2       3
1        3       2       7
2        7       5       2
3        2       5       4
;
parameter b(i)/
1        500
2        600
3        400/
;

positive variable x(i,j);
variable z;

equation obj_func;
equation constraint1;
equation constraint2;
equation constraint3;
equation constraint4;

obj_func..
z=e=sum((i,j),a(i,j)*x(i,j));

constraint1..
sum(i,x(i,'1'))=e=600;

constraint2..
sum(i,x(i,'2'))=l=400;

constraint3..
sum(i,x(i,'3'))=g=200;

constraint4(i)..
sum(j,x(i,j))=e=b(i);

model lp_test/all/;
solve lp_test using MIP maximaing z;
display x.l;

display z.l;

