function [L,p] = fun_SPP_Flold_fit(W,s,t)

    n = size(W,1);
    D = W;

    path = zeros(n,n);
    for i = 1:n
        for j = 1:n
            if D(i,j) ~= inf
                path(i,j) = j;
            end
        end
    end

    for k=1:n
        for i=1:n
            for j=1:n
                if D(i,j) > D(i,k)+ D(k,j)
                    D(i,j) = D(i,k)+ D(k,j);
                    path(i,j) = path(i,k);
                end
            end
        end
    end

    L = D(s,t);
    if L == inf
        p = [];
        return;
    end

    p = [s];
    node = s;

    while node ~= t
        forward = path(node,t);
        p = [p,forward];
        node = forward;
    end
    
