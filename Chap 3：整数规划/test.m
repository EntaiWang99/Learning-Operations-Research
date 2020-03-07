clc;
clear all; 
close all;

c=[40;90];
A=[9,1;
   7,20];
b=[56;70];
Aeq=[];
beq=[];


[A_M,x_opt,zLB]=B_and_B_func_positive(-c,A,b,Aeq,beq)

