%%test
clc;

% A=[1,1,1,0;
%    1,0,0,1];
% b=[2,1];
% c=[-2;-1;0;0];
% 
A=[1,1,1,0;
   2,0,0,1];
b=[40,60];
c=[-1;-2;0;0];

% A=[-1,-2,1,-1,1,0;
%    2,1,-4,-1,0,1];
% b=[-6,-4];
% c=[-1;-5;0;-3;0;0];
% 
% A=[0,6,1,-1,0;
%    5,2,1,0,-1];
% b=[2,1];
% c=[15;24;5;0;0];

dual_simplex_func(A,b,c)