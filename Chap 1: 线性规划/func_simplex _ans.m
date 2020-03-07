%%%%%A,c,b 中列的顺序都是从x1到xn
function [x0,v,z] = func_simple(A,c,b,v)

[m,n]=size(A);
B=A(:,v(1:m));
x0=[inv(B)*b;zeros(n-m,1)];

stop_or_not=0;
while stop_or_not==0
    cbn=c(v,:);
    m_B=A(:,v(1:m));
    m_N=A(:,v(m+1:n));
    m_0=zeros(n-m,m);
    m_I=eye(n-m,n-m);
    
    d=[-inv(m_B)*m_N;
       m_I];
   
    r=cbn'*d;
    
    if all(r>=0)
        z=cbn'*x0;
        display(sprintf('x is optimal'));return;
    end
    
    [r_value,q]=min(r);
    dq=d(:,q);
    %%%%%%%%%%%
    lamder=9999;out=0;
    for i=1:m
       if dq(i,1)<0 & lamder>=x0(i,1)/(-dq(i,1))
          lamder=x0(i,1)/(-dq(i,1)); out=i;
       end
    end    
    x1=x0+lamder*dq;
    
    %%%%%%%%update/arrange
    
    in_Bv=v(1,m+q);
    out_Bv=v(1,out);
    
    temp=x1(out,1);
    x1(out,1)=x1(m+q,1);
    x1(m+q,1)=temp;
    
    temp=v(1,out);
    v(1,out)=v(1,m+q);
    v(1,m+q)=temp;
    
    x0=x1;
    z=cbn'*x0;
    
end
end

