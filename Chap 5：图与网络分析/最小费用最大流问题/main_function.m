
function [] = main_function (C,W,V,begin,terminal) 
    n = size(C,1);
    F = zeros(n,n);%��ʼ����������

    s = begin;
    t = terminal;

    %% Step 1: ������������
    GL = fun_get_incremental_network(C,W,F);
    %һ��Ϊ��

    %% Step 2: Ѱ����С����������(Floyd��SPP)
    [L,P] = fun_SPP_Flold_fit(GL,s,t);
    %[SPP����,·��]

    %% Step 3��Ѱ��SPP�е�����theta
    while L ~= inf %when not exist SPP(L=inf),break
        theta = inf *ones(1,n);
        for k = 1:length(P)-1 %������· 
            u = P(k);v = P(k+1);
            if C(u,v) ~= inf %ǰ��
                theta(k) = C(u,v) - F(u,v);
            else %����
                theta(k) = F(u,v);
            end
        end
        min_theta = min(theta);

        %% Step 4������ǰ�󻡾���F
        for k = 1:length(P)-1
            u = P(k);
            v = P(k+1);
            if C(u,v) ~= inf %ǰ��
                F(u,v) = F(u,v) +min_theta;
            else %����
                F(u,v) = F(u,v) +min_theta;
            end
        end

        %% Step 5��ѭ��
        GL = fun_get_incremental_network(C,W,F);
        [L,P] = fun_SPP_Flold_fit(GL,s,t);

        E = m_transMatrix(F);
        m_grPlot(V,E,'d','%d','%d');
        title('\bf the iteration flow graph');
        pause(1);
        
    end   