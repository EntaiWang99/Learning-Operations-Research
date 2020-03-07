function [ E ] = m_transMatrix( G )
%UNTITLED2 Summary of this function goes here
[m n]=size(G);
E=[];
k=0;    %边的数量
for i=1:m
    for j=1:n
        if G(i,j)~=0 && G(i,j)~=inf
            E=[E; i j G(i,j)];   %提取边，三元组存储
            k=k+1;
        end
    end
end


end

