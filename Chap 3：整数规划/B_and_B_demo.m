clc;
clear all;
close all;

%input
c=[24;2;20;4];
A=[8,1,5,5];
b=[9];
Aeq=[];
beq=[];
[m,n]=size(A);
x_lb=[0;0;0;0];%x_low bound 0<=x<=1
x_up=[1;1;1;1];%x_up bound
%%using of linprog
%%[x,zlp,exitflag]=linprog(-c,A,b,Aeq,beq,x_lb,x_ub);
%%zLp=-zLp
%%pay attention to the max or min


A_M=[1,0,zeros(1,n)];%%the node matix
now_node=1;%the current node
n_count=1;%count++

while now_node<=n_count%%why??
    Aeq=[];
    beq=[];
    %%debugging
    A_M=[1,2,1,1,0,0];
    x_level=2;
    x_level=A_M(now_node,:);%%current line of x_level
    %eatablish the sub_lp model,
    for i=1:x_level
        Aeq_new=zeros(1,n);
        Aeq_new(1,i)=1;
        beq_new(1,1)=A_M(now_node,i+2);

        Aeq=[Aeq;Aeq_new];
        beq=[beq;beq_new];
    end
    [x,zlp,exitflag]=linprog(-c,A,b,Aeq,beq,x_lb,x_ub);
    zLp=-zLp;
    
       
end



