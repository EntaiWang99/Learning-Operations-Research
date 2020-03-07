%function:

function [GL] = fun_get_incremental_network (C,W,F)
    n = size(C,1);
    GL = inf * ones(n,n);
    for i = 1:n
        for j = 1:n
            if i == j
                continue;
            end
            if C(i,j) == inf
                continue;
            end
            if C(i,j) ~= inf && F(i,j) < C(i,j) 
                GL(i,j) = W(i,j);
            elseif C(i,j) ~= inf && F(i,j) == C(i,j) 
                GL(i,j) = inf;
            end
        end
    end   
end

