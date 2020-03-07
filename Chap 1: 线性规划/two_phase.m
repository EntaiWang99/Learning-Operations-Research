%Created by E T Wang
clc;
clear all;
close all;

%%Input standard
c=[-2;-3;-2;0;0];
A=[-1,-1,-1,0,0;
   4,2,999999,1,0;
   0,4,0,0,5];
b=[-8;16;12];
% c=[-2;-3;0;0;0];
% A=[-1,1,1,0;
%    3,4,0,-1];
% b=[48;120];

% c=[-3;0;1;0;0];
% A=[1,1,1,1,0;
%    -2,1,-1,0,-1;
%    0,3,1,0,0];
% b=[4;1;9];

%%Step 1: make b>=0
[m,n]=size(A);
for i=1:m
    if b(i,1)<0
        b(i,1)=-b(i,1);
        A(i,:)=-A(i,:);
    end
end

%%Step 2 establish a new LP question
A_ph1=[A,eye(m)];
b_ph1=b;
c_ph1=[zeros(n,1);ones(m,1)];

%step 3:solve LP_ph1
v=[n+1:n+m,1:n];
[x0,v,z]=simplex_method_function(A_ph1,c_ph1,b_ph1,v)

if z>0
    fprintf('LP is empty\n')
    return;
end

%%Stage 2:Primal LP
v2=[];
for i=1:n+m
    if v(1,i)<=n
        v2=[v2,i];
    end
end    

v=v(:,v2);
[x0,v,z]=simplex_method_function(A,c,b,v)
