%�����η�B����
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
Bv=v(:,1:m);%������
MBv=v(:,m+1:n);%�ǻ�����
m_B=A(:,Bv);%�ֿ����
m_N=A(:,MBv);
m_0=zeros(n-m,m);
m_1=eye(n-m,n-m);
M=[m_B,m_N;
   m_0,m_1];
M
inv(M)*b

   
    



