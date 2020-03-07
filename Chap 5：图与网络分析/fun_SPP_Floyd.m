%Shortest_Path_Problem by Floyd
%2019.5.10

function [Path] = fun_SPP_Floyd (A,V,begin,terminal)
    E = m_transMatrixNoD(A);
    m_grPlot(V,E,'d','%d','%d');
    
    %Step 1:Initialization
    n = size(V,1);%the number of node
    d = A;
    P = zeros(n,n);%Label matrix(S)

    for j=1:n
        P(:,j) = j;
    end

    %Step 2:Iteration
    for k=1:n
        for i=1:n
            for j=1:n
                if d(i,j) > d(i,k)+ d(k,j)
                    d(i,j) = d(i,k)+ d(k,j);
                    P(i,j) = P(i,k);
                end
            end
        end
    end

    %Step 3:Display the path
    s = begin;
    t = terminal;

    now_node = s;
    Path = [s];
    PP = zeros(n,n);%the graph matrix of shortest path
    %%Pay attention to PP & P
    while  now_node ~= t
        next_node = P(now_node,t);
        Path = [Path,next_node];
        PP(now_node,next_node) = A(now_node,next_node);

        E = m_transMatrixNoD(PP);
        m_grPlot(V,E,'d','%d','%d');
        now_node = next_node;
        pause(1);
    end
