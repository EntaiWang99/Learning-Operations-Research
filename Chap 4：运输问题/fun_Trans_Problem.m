%Transportation Problem
%Input c,s,d
function [x,z] = fun_Trans_Problem(c,s,d)
    [m,n] = size(c);
    c00 = c;

    %%Step 1: Find a bfs
    [x,z] = Part_I_BFS_Vogel(c,d,s);
    %[x,z] = Part_I_BFS_North_corner(c,d,s);
    %[x,z] = Part_I_BFS_Minimum_Cost(c,s,d);    
      fprintf('Use the northwest corner to find the bfs:');
      x
%%%%%BUG 1: which method can be used, we don't know, maybe...

    %%Step 2:Compute and check the RN
    while 1
%         x=[35,0,0,0;
%           10,20,20,0;
%           0,0,10,30];
%%%%%BUG 2: You change x,the x found by method cannot be used!

        [Bi,Bj] = find(x~=0);%if x!=0-->x is base
        [Ni,Nj] = find(x==0);%if x!=0-->x is unbase
        
        %[w1] = Part_II_ComputeRN_Direct_method(c,Bi,Bj,Ni,Nj);
        [w2] = Part_II_ComputeRN_Dual_method(c,Bi,Bj,Ni,Nj);
        w = w2;
        %w = w1;%not feasible
        
        rN = zeros(m,n);
        for i=1:m
            for j=1:n
            rN(i,j) = c(i,j) - w(i) - w(m+j);
            end
        end
        
        rN_value = min(min(rN));
        [in_i,in_j] = find(rN==rN_value);
        
%         standard = 0;
        if rN_value>=0
            fprintf('x is optimal!!\n');
            z_optimal = dot(c00,x);
            z_optimal = sum(z_optimal);
            x %#ok<NOPRT>
            z_optimal %#ok<NOPRT>
            return; 
%         else 
%             for i=1:m
%                 for j=1:n
%                     if rN(i,j)<standard
%                     standard = x(i,j);
%                     in_i = i;
%                     in_j = j;
%                     end
%                 end
%             end
        end
        
%%%%%BUG 3:This x have been optimal, we needn't countine it.

    %%Step 3:Solution improvement(Pivoting procedure)
    
        A = x;
        o_i = in_i;
        o_j = in_j;

        %%Find closed loop
        [r_M,route] = fun_loop_path(A,o_i,o_j);
        %%Here debug r_M &route

        [x] = Part_III_fun_solution_improvement(x,route);
%%%%%BUG 4:I doubt that x is degraded solution, adjust what??
    end
end




