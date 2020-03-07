function [w] = Part_II_ComputeRN_Dual_method(c,Bi,Bj,Ni,Nj)
    [m,n] = size(c);

    %%Constructing dual problem to get parameters
    A = zeros(m+n,m+n);
    b = zeros(m+n,1);

    A(1,1) = 1;
    b(1,1) = 1;%%Let u1=0

    
    %#Bi=5,r(c)=m+n-1=6,Degradation
    %for k=1:m+n-1
    %????????????????????????????????????????????
    nn = length(Bi);
    Bi=[ones(m+n-nn-1,1);Bi];
    Bj=[ones(m+n-nn-1,1);Bj];
    
    for k=2:m+n
        i = Bi(k-1);
        j = Bj(k-1);

        %%Compute u(i)+v(j)=c(i,j)
        A(k,i) = 1;
        A(k,m+j) = 1;
        b(k) = c(i,j);
    end
    w = inv(A) * b;

    


   
    