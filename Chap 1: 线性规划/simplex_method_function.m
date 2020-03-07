%单纯形法复现，函数
%Created by E T Wang
function[x0,v,z]=simplex_method_function(A,c,b,v)
    [m,n]=size(A);
    B=A(:,v(1:m));
    x0=[inv(B)*b;zeros(n-m,1)];

    while 1
        cbn=c(v,:);
        m_B=A(:,v(1:m));%Bv
        m_N=A(:,v(m+1:n));
        m_I=eye(n-m,n-m);
        m_0=zeros(n-m,m);%所有矩阵都要写全呐
        d=[-inv(m_B)*m_N;m_I];
       
        r=cbn'*d;
            
        if all(r>=0)
           z=cbn'*x0;%这种情况也要把z的值加上啊
           fprintf('x is optimal');
           return;
        end
        
        %退化情况，Bland规则,取最小下标的做，貌似也不行[捂脸]
        [~,k]=size(r);
        for i=1:k
            if r(i)<0
                q=i;
                break;
            end
        end
            
      %在这里看r，都相等，退化情况，Bland规则
      [val,q]=min(r);
      for i=1:k
          if r(i)==val
             disp('LP is a degradation problem')
          end
      end
      
       dq=d(:,q);
       if all(dq>=0)
           printf('LP is unbounded below');
           return;
       end
       
       lambda=9999;
       out=0;
       for i=1:m
           if dq(i,1)<0 && lambda>=x0(i,1)/-dq(i,1)
               lambda=x0(i,1)/-dq(i,1);
               out=i;
           break;
           end
       break;
       end
       x1=x0+lambda*dq;
       
       in_v=v(m+q);
       out_v=v(out);
       
       v(m+q)=out_v;
       v(out)=in_v;
       
       temp=x1(m+q,1);
       x1(m+q,1)=x1(out,1);
       x1(out,1)=temp;
       x0=x1;
       z=c(v,:)'*x0;
    end
