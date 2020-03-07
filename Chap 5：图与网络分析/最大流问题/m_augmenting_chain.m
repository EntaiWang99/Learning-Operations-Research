function [min_theta,p,flag] = m_augmenting_chain (Gf,n)
    %%%p:Chain/Path;
    %%%min_theta:adjustment amount
    %%%Method:T_F Labeling method

   %% 2.1 Get augmenting chain
    s = 1;%start
    t = n;%terminal
    active_n = s;
    List = [2:t];%the list that we will seek
    Pred = zeros(1,n);%the forward node matrix
    theta = inf * ones(1,n);%the initializal adjustment amount
    
    while active_n ~= t
        %%get u,v
        u = active_n;
        for k = 1:length(List)
            v = List(k);
    
            if Gf(u,v) ~= inf && Gf(u,v) > 0 %%the beside node existed
                theta(v) = min([Gf(u,v),theta(u),theta(v)]);
                %%the usage of min([])
                Pred(v) = u;%%update forward node
    
                active_n = v;%%update active node
                active_k = k;%%transfer no_labeling node into labeling node
            end
            
        end
        
       %must use this, why?
       flag = 0;
        if active_n == u
            flag = 1;
            break;
        end
    
        List(active_k) = [];%delete labeling node
        min_theta = min(theta);
        
       %%%%ÍË³öÌõ¼þ
    end
    
   %% 2.2 Output the augmented chain
    s = 1;
    t = n;
    now_node = t;
    p = [t];

    while now_node ~= s
        pred_node = Pred(now_node);
        p = [pred_node,p];
        now_node = pred_node;
    end

end