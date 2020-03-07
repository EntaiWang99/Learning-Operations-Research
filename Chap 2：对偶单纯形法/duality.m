%数学实验，强（弱）对偶定理、互补松弛定理验证
clc;
clear all; %#ok<CLALL>
close all;

A=[1,1,1,0;
   2,1,0,0];
b=[40;60];
c=[1;-2;0;0];
[m,n]=size(A);

%看单纯形乘子
% v=[1,3,2,4];%选择需要对偶的点的基排序
% B=A(:,v(1:m));
% cb=c(v(1:m),:);
% w=cb'*inv(B);
%

x12=[30;0];%这个地方根据选集不同要改
A12=A(:,[1,2]);
s=-A12*x12+b;

x=[x12;s];
z=c'*x;

v=[1,3,2,4];%每次实验基序要改的
cb=c(v(1:m),:);
B=A(:,v(1:m));

w=cb'*inv(B);
c12=c([1,2],:);
r=c12-A12'*w';
z=b'*w';%注意这两处都需要转置
output1=A*x-b
output2=c'*x
output3=cb'*inv(B)
output4=c12-A12'*w'
%output5=w
output6=b'*w'
