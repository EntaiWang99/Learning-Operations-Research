%单纯形法实现

clc;
clear all; %#ok<CLALL>
close all;

c=[-3;-2;0;0];
A=[1,1,1,0;
   2,1,0,1];
b=[40;60];

[m,n]=size(A);
v=[3,4,1,2];
x0=[40;60;0;0];%这个改成可以自动识别

while 1
    m_B=A(:,v(1:m));%Bv
    m_N=A(:,v(m+1:n));
    m_I=eye(n-m,n-m);
    d=[-inv(m_B)*m_N;m_I];
   
   cbn=c(v,:);%c的基重排
   r=cbn'*d;
   if all(r>=0)
       fprintf('x is optimal');
       return;
   end
   
   [val,q]=min(r);
   
   dq=d(:,q);
   if all(dq>=0)
       printf('unbounded below');
       return;
   end
   
   lambda=9999;
   out=0;
   for i=1:m
       if dq(i,1)<0 && lambda>=x0(i,1)/-dq(i,1)
           lambda=x0(i,1)/-dq(i,1);
           out=i;
       end
   end
   x1=x0+lambda*dq;
   
   in_v=v(m+q);
   out_v=v(out);
   
   v(m+q)=out_v;
   v(out)=in_v;
   
   temp=x1(m+q,1);
   x1(m+q,1)=x1(out,1);
   x1(out,1)=temp;
   x0=x1;
   
   v
   x0
   z=c(v,:)'*x0
   end

           
   
   
    