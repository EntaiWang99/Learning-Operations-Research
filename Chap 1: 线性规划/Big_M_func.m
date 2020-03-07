%Big M method
%我认为这个程序有问题，
%改变M值未改变最优值结果，
%希望老师找到问题，谢谢老师！！

function[x0,v,z]=Big_M_func(A,c,b)
%%Step 1: make b>=0
[m,n]=size(A);
for i=1:m
    if b(i,1)<0
        b(i,1)=-b(i,1);
        A(i,:)=-A(i,:);
    end
end

%%Step 2 establish a new LP question
M=99999;
A_ph2=[A,eye(m)];
b_ph2=b;
c_ph2=[c;M*ones(m,1)];

%step 3:solve LP_ph1
v=[n+1:n+m,1:n];
[x0,v,z]=simplex_method_function(A_ph2,c_ph2,b_ph2,v)