$ontext
demo for shortest path Problem
created by etwang
$offtext

set i/S,A,B,C,D,E,F,G,H,I,K,L,M,N,O,T/;
alias (i,j);

set i_start(i)/S/;
set i_terminal(i)/T/;
set i_middle(i)/A,B,C,D,E,F,G,H,I,K,L,M,N,O/;

parameter path(i,j)/
*S-->A can be discribed by this
S.A     1
S.B     1
A.C     5
A.D     4
B.D     7
B.E     3
C.F     2
C.G     1
D.G     1
D.H     2
E.H     5
E.I     4
F.K     3
G.K     4
G.L     4
H.L     2
H.M     4
I.M     2
K.N     5
L.N     2
L.O     8
M.O     4
N.T     2
O.T     1
/;

binary variable x(i,j);
variable z;

equation obj_function;
equation start_constraint(i_start);
equation middle_constraint(i_middle);
equation terminal_constraint(i_terminal);

obj_function..
z=e=sum((i,j),path(i,j)*x(i,j));

start_constraint(i_start)..
sum(j$path(i_start,j),x(i_start,j))=e=1;
*Why use i_start instaed of i??

middle_constraint(i_middle)..
sum(j$path(i_middle,j),x(i_middle,j))=e=sum(j$path(j,i_middle),x(j,i_middle));
terminal_constraint(i_terminal)..
sum(j$path(j,i_terminal),x(j,i_terminal))=e=1;

model SPP_pro/all/;
*solve SPP_pro using MIP minimizing z;
solve SPP_pro using MIP maximizing z
display x.l,z.l;
