%单纯形法B矩阵
clc;
clear all;
close all;
A=[3,4,1,0;
   5,2,0,1];
b=[9;
   8;
   0;
   0];
c=[-3;
   -2;
   0;
   0];

[m,n]=size(A);
v=[1,2,3,4];
Bv=v(:,1:m);%基变量
MBv=v(:,m+1:n);%非基变量
m_B=A(:,Bv);%分块矩阵
m_N=A(:,MBv);
m_0=zeros(n-m,m);
m_1=eye(n-m,n-m);
M=[m_B,m_N;
   m_0,m_1];
M
inv(M)*b

   
    



