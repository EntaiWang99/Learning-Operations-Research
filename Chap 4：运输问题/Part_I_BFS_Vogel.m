function [x,z] = Part_I_BFS_Vogel(c,d,s)
    [m,n] = size(c);
    c0 = c;
    x = zeros(m,n);
    %%the initial xij(same as the size of c)
while 1
    %%Vogel method to determine initial bfs
    c_col = sort(c);%%arrange for col form min->max
    p_col = c_col(2,:) - c_col(1,:);

    c_row = sort(c');%%arrange for row form min->max
    p_row = c_row(2,:) - c_row(1,:);%%min-submin

    [i_val,i] = max(p_row);
    [j_val,j] = max(p_col);%%max(min-submin)
    %arrange value into (i_val,j_val) 
    i = i(1,1);
    j = j(1,1);

    %% determine i,j 
    %% if row_val>col_val, then we find min_val in max_row, 
    %  vice versa
    if i_val>j_val
        [j_val,j] = min(c(i,:));
    else 
        [i_val,i] = min(c(:,j));
    end
     
    if c(i,j) == inf
        break;
    end
    
    x(i,j) = min(s(i),d(j));
    
    if s(i)>=d(j)
        c(:,j) = inf;
    else
        c(i,:) = inf;
    end

    s(i) = s(i) - x(i,j);
    d(j) = d(j) - x(i,j);
end
    z = dot(c0,x);
    z = sum(z);