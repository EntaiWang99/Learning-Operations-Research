$ontext
demo for general assignment problem
created by etwang
$offtext

set i/1*3/;
set j/A*E/;

*Use this method is good, it can replace 'A'
*set j_oA(j)/A/;
*set j_oB(j)/B/;
*set i_o1(i)/1/;
*set i_o3(i)/3/;

table c(i,j)
    A   B   C   D   E
1   4   8   7   15  12
2   7   9   17  14  10
3   6   9   12  8   7
;
parameter M/999/;
binary variable x(i,j);
variable z;

equation obj_function;
equation constraint_people(i);
*equation constraint_other1(i,j_oA,j_oB);
*equation constraint_other2(i_o1,i_o3,j);
equation constraint_other1(i);
equation constraint_other2;

obj_function..
z=e=sum((i,j),c(i,j)*x(i,j));

constraint_people(i)..
sum(j,x(i,j))=e=1;

*constraint_job(j)..
*sum(i,x(i,j))=e=1;
$ontext
constraint_other1(i,j_oA,j_oB)..
x(i,j_oA)+x(i,j_oB)=l=1;
constraint_other2(i_o1,i_o3,j)..
*what you use must fill in ()..
x(i_o1,j)+x(i_o3,j)=e=1;
$offtext

constraint_other1(i)..
x(i,'A')+x(i,'B')=l=1;
constraint_other2..
M*sum(j,x('1',j))+sum(j,x('3',j))=g=1;
*if-else,1,3 are not equal!-----M method!
*constraint_other2(j)..
*x('3',j)+M*x('1',j)=g=1;

model GAP_pro/all/;
solve GAP_pro using MIP maximizing z;

display x.l,z.l;





