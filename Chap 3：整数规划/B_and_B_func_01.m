%Branch_and_Bound_function
%Created by E T Wang
%2019.4.15
%debug OK��

function [A_M,x_opt,zLB] = B_and_B_func(c,A,b,Aeq,beq)
    [~,n]=size(A);
    %%all 0<=x<=1
    x_lb=zeros(n,1);
    x_ub=ones(n,1);
    %%test,-c:max-->min
    %[x,z,exitFlag]=linprog(-c,A,b,Aeq,beq,x_lb,x_ub)

    %***************B & B***************%
    %%Step 1: initializing parameters
    A_M=[1,0,zeros(1,n)];%%the Node matix
    active_node=1;%%the current activing node
    n_count=1;%%counting
    zLB=-inf;
    x_opt=[];

    %%Step 2:looping for all node
    while active_node<=n_count
        Aeq=[];
        beq=[];
        x_level=A_M(active_node,2);%the 2nd number of Node matrix
        %%the function of this loop is making new Aeq, beq
        for i = 1:x_level
            one_row=zeros(1,n);
            one_row(1,i)=1;
            Aeq=[Aeq;one_row]; 
            b_row=A_M(active_node,2+i);
            beq=[beq;b_row];
        end
        
        %%testing the current c,A,b
        [x_j,z_j,exitFlag]=linprog(c,A,b,Aeq,beq,x_lb,x_ub);
        z_j=-z_j;%%min->max
    
    %step 3:  judging the current case
    %case 1: unsolvable
    if exitFlag == -2
        A_M(active_node,1)=0;  %%cutting node itself

    %case 2: zLB(j) exist but <= zLB
    elseif z_j<=zLB
        A_M(active_node,1)=0;

    %case 3: zLB(j) >= zLB && x is Zn, update zLB
    elseif z_j>zLB && max(abs(x_j-round(x_j)))<=1.0e-7
        A_M(active_node,1)=0;
        zLB=z_j;
        x_opt=x_j;

    %case 4: zLB(j) <= zLB && x is not Zn, branching!!
    elseif z_j>zLB && max(abs(x_j-round(x_j)))>=1.0e-7
        A_M(active_node,1)=0;
        x_cut=A_M(active_node,2)+1;

        %%updating the parameters in the branching node
        %%copying first
        branch_L=A_M(active_node,:);
        branch_R=A_M(active_node,:);

        %%modify each parameter
        branch_L(1,1)=1;
        branch_R(1,1)=1;%%transfer into the active node

        branch_L(1,2)=x_cut;
        branch_R(1,2)=x_cut;

        %branching --> 0 and 1
        branch_L(1,2+x_cut)=0;
        branch_R(1,2+x_cut)=1;

        %modify A_M
        A_M=[A_M;branch_L;branch_R];
        n_count=n_count + 2;

        end
    active_node = active_node + 1;
    end






