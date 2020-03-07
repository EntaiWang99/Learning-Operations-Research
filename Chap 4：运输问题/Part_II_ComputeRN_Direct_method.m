function [w] = Part_II_ComputeRN_Direct_method(c,Bi,Bj,Ni,Nj)
    [m,n] = size(c); 
    cB=[];
    B=[];

    for k=1:m+n-1 %%the rank is m+n-1
        cB = [cB;c(Bi(k),Bj(k))];

        new_col = zeros(m+n,1);
        new_col(Bi(k),1) = 1;
        new_col(m+Bj(k),1) = 1;
        B = [B,new_col];
    end
    B = B(2:m+n,:);%remove the redundancy row, so inv(B) exists
    w = cB'*inv(B);
    