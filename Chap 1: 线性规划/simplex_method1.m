%单纯形法极点寻找方法及程序
clc;
clear all;
close all;
A=[1,1,1,0;
   2,1,0,1];
b=[40;
   60];
c=[-3;
   -2;
   0;
   0];

[m,n]=size(A);
cobV=nchoosek(1:n,m);
for i=1:size(cobV,1)
    Bv=cobV(i,:);
    B=A(:,Bv);
    X=inv(B)*b;
    if all(X>=0)
        X;
        cB=c(Bv,:);
        z=cB'*X;
    end
end