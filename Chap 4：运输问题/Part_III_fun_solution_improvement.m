%%
function [x] = Part_III_fun_solution_improvement(x,route)
    
    for k=1:length(route)
        theta = 99999;%adjustment amount

        %%Find out_base
        if rem(k,2)==0 %find even
            i = route(k,1);
            j = route(k,2);
            if x(i,j)<=theta
                theta = x(i,j);
                out_i = i;
                out_j = j;
            end
        end
    end

    %%Update x_value
    for k=1:length(route)
        i = route(k,1);
        j = route(k,2);%%i,j what?
        if rem(k,2)==0
            x(i,j) = x (i,j) - theta;
        else
            x(i,j) = x (i,j) + theta;
        end
    end
    x;
    
    



