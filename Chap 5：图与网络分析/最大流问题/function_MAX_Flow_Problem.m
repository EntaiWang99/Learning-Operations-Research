%%function for MAX_Flow_Problem by FF
%%2019.6.1

function [] = function_MAX_Flow_Problem (C,F,V)

    %% Step 1:Get the residual graph
    [Gf,n] = fun_network_flow_residual_graph (C,F);
    
    %% Step 2:Get augmenting chain && Output the augmented chain
    [min_theta,p,flag] = m_augmenting_chain (Gf,n);
    
    %% Step 3:Interation
    while min_theta ~= 0 %%exist adjustment amount
        for k = 1:length(p)-1 %%Search all augmented chain
            u = p(k);
            v = p(k + 1);%%the reason why we use 'length(p)-1'
            %judge forward chain or backward chain
            if C(u,v) ~= inf %%the forward chain
                F(u,v) = F(u,v) + min_theta;
            else %%the backward chain
                F(u,v) = F(u,v) - min_theta;
            end
        end

            E = m_transMatrix(F);
            m_grPlot(V,E,'d','%d','%d');
            title ('net flow graph');
            pause(1);
            
            Gf = fun_network_flow_residual_graph (C,F);
            [min_theta,p,flag] = m_augmenting_chain (Gf,n);
           
            if flag == 1
                break;
            end
        
    end
    