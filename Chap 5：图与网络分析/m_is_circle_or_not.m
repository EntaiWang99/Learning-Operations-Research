function re=m_is_circle_or_not(A)
    [m n]=size(A);
    while 1
        pre_A=A;
        for i=1:m
            du=0;       %��m��Ԫ�صĶ�
            for j=1:n
                if A(i,j)~=0
                    du=du+1;
                end
            end
            if du==1            %Ԫ�صĶ�Ϊ1ʱɾ�����Ԫ�أ�������Ԫ�ضȼ�һ
               A(i,:)=0;
               A(:,i)=0;
            end
        end
        if pre_A==A     %ͼ��û�ж�Ϊ1��Ԫ�����˳�
           break; 
        end
    end
    
    if sum(A(:))==0
        re=0;
    else
        re=1;
    end
end
