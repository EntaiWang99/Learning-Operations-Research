function[rN]=fun_compute_rN_1(c,x)
% %the first method for getting w
[m,n]=size(c);
cB=[];
B=[];
[Bi,Bj]=find(x~=0);%i����x�в�Ϊ0���ڵ�������j����x�в�Ϊ0���ڵ�������i��j��ͬ��ɲ�Ϊ0��Ԫ�����ڵ�λ��
[Ni,Nj]=find(x==0);%i����x��0���ڵ�������j����x��0���ڵ�������i��j��ͬ���0��Ԫ�����ڵ�λ��
% %find B
for k=1:m+n-1
    cB=[cB;c(Bi(k),Bj(k))];
    new_col=zeros(m+n,1);
    new_col(Bi(k),1)=1;
    new_col(m+Bj(k),1)=1;
    B=[B,new_col];
end
B=B(2:m+n,:);%��ΪA����Ϊm+n-1,������������m+n-1��������ʱ�����BΪm+n��m+n-1�У�ɾ��B�������һ�У�Ҫ��û����
w=cB'*inv(B);%Ĭ��ɾ������һ�ж�Ӧ��w=0
w=[0,w];


for i=1:m
    for j=1:n
        rN(i,j)=c(i,j)-w(i)-w(m+j);
    end
end
