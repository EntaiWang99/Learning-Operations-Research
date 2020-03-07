
function [] = main_function (C,W,V,begin,terminal) 
    n = size(C,1);
    F = zeros(n,n);%初始化零流矩阵

    s = begin;
    t = terminal;

    %% Step 1: 产生增量矩阵
    GL = fun_get_incremental_network(C,W,F);
    %一分为二

    %% Step 2: 寻找最小费用增广链(Floyd法SPP)
    [L,P] = fun_SPP_Flold_fit(GL,s,t);
    %[SPP长度,路径]

    %% Step 3：寻找SPP中调整量theta
    while L ~= inf %when not exist SPP(L=inf),break
        theta = inf *ones(1,n);
        for k = 1:length(P)-1 %遍历链路 
            u = P(k);v = P(k+1);
            if C(u,v) ~= inf %前向弧
                theta(k) = C(u,v) - F(u,v);
            else %后向弧
                theta(k) = F(u,v);
            end
        end
        min_theta = min(theta);

        %% Step 4：更改前后弧矩阵F
        for k = 1:length(P)-1
            u = P(k);
            v = P(k+1);
            if C(u,v) ~= inf %前向弧
                F(u,v) = F(u,v) +min_theta;
            else %后向弧
                F(u,v) = F(u,v) +min_theta;
            end
        end

        %% Step 5：循环
        GL = fun_get_incremental_network(C,W,F);
        [L,P] = fun_SPP_Flold_fit(GL,s,t);

        E = m_transMatrix(F);
        m_grPlot(V,E,'d','%d','%d');
        title('\bf the iteration flow graph');
        pause(1);
        
    end   