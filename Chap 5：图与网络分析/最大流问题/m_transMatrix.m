function [ E ] = m_transMatrix( G )
%UNTITLED2 Summary of this function goes here
[m n]=size(G);
E=[];
k=0;    %�ߵ�����
for i=1:m
    for j=1:n
        if G(i,j)~=0 && G(i,j)~=inf
            E=[E; i j G(i,j)];   %��ȡ�ߣ���Ԫ��洢
            k=k+1;
        end
    end
end


end

