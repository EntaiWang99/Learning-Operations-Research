function [x,z]=fun_get_bfs_for_TP(c,s,d)
%using Vogel find a bfs,and print x
[m,n]=size(c);
x=zeros(m,n);
c2=c;
while 1
    c_col=sort(c);
    p_col=c_col(2,:)-c_col(1,:);%找出每一行的惩罚数
    c_row=sort(c');
    p_row=c_row(2,:)-c_row(1,:);%找出每一列的惩罚数
    [i_val,i]=max(p_row);
    i=i(1,1);
    [j_val,j]=max(p_col);
    j=j(1,1);
    %i,j
    if i_val>=j_val
        [j_val,j]=min(c(i,:));
    else 
        [i_val,i]=min(c(:,j));
    end
    if c(i,j)==inf
        break;
    end
    x(i,j)=min(s(i),d(j));
    if s(i)>=d(j)
        c(:,j)=inf;
    else 
        c(i,:)=inf;
    end
    s(i)=s(i)-x(i,j);
    d(j)=d(j)-x(i,j);
end
z=dot(x,c2);
z=sum(z);

 
   
