$ontext
demo for Set Covering Problem
created by etwang
$offtext

set i/A*J/;
*demand
set j/1*8/;
*supply

parameter c(j)/1    15
               2    18
               3    24
               4    20
               5    19
               6    18
               7    29
               8    30
               /;
table a(i,j)
*the order from O to D.
    1   2   3   4   5   6   7   8   
A   1   1   1   1   1       1   1             
B       1   1   1   1   1   1   1
C           1   1       1   1   1
D           1   1       1   1   1
E   1   1   1       1           1
F       1   1   1   1   1   1   1   
G       1   1   1       1   1   1
H           1   1       1   1   1
I   1   1   1       1       1   1
J       1   1   1   1   1   1   1;

binary variable x(j);
variable z;

equation obj_function;
equation constraint(i);

obj_function..
z=e=sum(j,c(j)*x(j));
constraint(i)..
sum(j,a(i,j)*x(j))=g=1;

model SCP_pro/all/;
solve SCP_pro using MIP minimizing z;

display x.l,z.l;
