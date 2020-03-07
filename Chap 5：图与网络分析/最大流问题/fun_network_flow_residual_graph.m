%function to network_flow_residual_graph
%2019.5.21

function [Gf,n] = fun_network_flow_residual_graph (C,F)
    %Gf:the residual_graph
    n = size(C,1);
    Gf = zeros(n);%initialization Gf
    for i=1:n
        for j=1:n
            if i == j
                continue;%diag elements needn't be done
            end
            if C(i,j)~=inf
                Gf(i,j) = C(i,j) - F(i,j);
                Gf(j,i) = F(i,j);
                %%transfer 1 graph to 2 graphs(the Gf graph)
            end
        end
    end
