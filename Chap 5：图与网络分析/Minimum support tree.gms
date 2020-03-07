$ontext
    demo for minimum support tree
    19.5.5
$offtext

set i/1*6/;
alias(i,j);
parameter c(i,j)/
1.2      5
1.3      6
2.1      5
2.3      1
2.4      2
2.5      7
3.1      6
3.2      1
3.5      5
4.2      2
4.5      3
4.6      4
5.3      3
5.4      3
5.6      4
6.4      4
6.5      4
/;
parameter n/6/;

binary variable x(i,j);
variable z;

equation obj_func;
obj_func..
    z=e=sum((i,j)$c(i,j),c(i,j)*x(i,j));

equation connect_const(i);
connect_const(i)..
    sum(j$c(i,j),x(i,j))=g=1;

equation no_direction_const;
no_direction_const(i,j)$c(i,j)..
    x(i,j)=e=x(j,i);

equation no_loop_const;
no_loop_const..
    sum((i,j)$c(i,j),x(i,j))=e=2*(n-1);

model min_support_tree_pro/all/;
solve min_support_tree_pro using MIP minimazing z;
display x.l,z.l;




