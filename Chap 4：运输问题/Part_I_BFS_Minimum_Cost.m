%Transportation Problem
%19.4.24

function [x,z] = Part_I_BFS_Minimum_Cost(c,s,d)
    [m,n] = size(c);
    c0 = c;
    x = zeros(m,n);%%the initial xij(same as the size of c)

    %%Minimum-Cost Method to determine initial bfs
    while 1
        [i,j] = find(c==min(min(c)));%%find the sub-title of minimum value in c
        i = i(1,1);j = j(1,1);%%maybe min_value more than 1, choose one
        x(i,j) = min(s(i),d(j));
        if c(i,j)==inf%%the min_value is inf -->break
            break;
        end 

        s(i) = s(i) - x(i,j);
        d(j) = d(j) - x(i,j);

        if s(i)>=d(j)
            c(:,j) = inf;
            %%After distributing, the value turn into inf
        else
            c(i,:) = inf;
        end
    end
    %demand != supply??
    z = dot(c0,x);
    sum(z)
end