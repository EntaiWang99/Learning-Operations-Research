function[rN]=fun_compute_rN_2(c,x)
[m,n]=size(c);
%the second method for getting w
[Bi,Bj]=find(x~=0);%i����x�в�Ϊ0���ڵ�������j����x�в�Ϊ0���ڵ�������i��j��ͬ��ɲ�Ϊ0��Ԫ�����ڵ�λ��
[Ni,Nj]=find(x==0);%i����x��0���ڵ�������j����x��0���ڵ�������i��j��ͬ���0��Ԫ�����ڵ�λ��
B=zeros(m+n,m+n);
b=zeros(m+n,1);
B(1,1)=1;
b(1,1)=0;%��w1=0
for k=2:m+n
    i=Bi(k-1);
    j=Bj(k-1);
    B(k,i)=1;
    B(k,m+j)=1;
    b(k)=c(i,j);
end
w=inv(B)*b;


%find rN
for i=1:m
    for j=1:n
        rN(i,j)=c(i,j)-w(i)-w(m+j);
    end
end
