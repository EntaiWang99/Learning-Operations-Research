function[rN]=fun_compute_rN_1(c,x)
% %the first method for getting w
[m,n]=size(c);
cB=[];
B=[];
[Bi,Bj]=find(x~=0);%i代表x中不为0所在的行数，j代表x中不为0所在的列数，i与j共同组成不为0的元素所在的位置
[Ni,Nj]=find(x==0);%i代表x中0所在的行数，j代表x中0所在的列数，i与j共同组成0的元素所在的位置
% %find B
for k=1:m+n-1
    cB=[cB;c(Bi(k),Bj(k))];
    new_col=zeros(m+n,1);
    new_col(Bi(k),1)=1;
    new_col(m+Bj(k),1)=1;
    B=[B,new_col];
end
B=B(2:m+n,:);%因为A的秩为m+n-1,即基变量共有m+n-1个，但此时求出的B为m+n行m+n-1列，删掉B中冗余的一行，要不没有逆
w=cB'*inv(B);%默认删掉的那一行对应的w=0
w=[0,w];


for i=1:m
    for j=1:n
        rN(i,j)=c(i,j)-w(i)-w(m+j);
    end
end
