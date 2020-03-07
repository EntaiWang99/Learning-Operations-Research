%第一组测试数据
% A=[1 1 1 0;1 0 0 1];
% b=[2;1];
% c=[-2;-1;0;0];

%第二组测试数据
%A=[1 1 -1 0 0;1 -1 0 -1 0;1 0 0 0 1];
%b=[2;1;3];
%c=[-2;1;0;0;0];


%第三组测试数据
%A=[5 2 1 0 0;2 3 0 1 0;4 2 0 0 1];
%b=[150;100;80];
%c=[-12;-8;0;0;0];


%第四组测试数据
%A=[4 2 2 -1 0 0;2 4 0 0 1 0;4 8 2 0 0 1];
%b=[4;20;16];
%c=[-2;-1;-1;0;0;0]

%第五组实验数据
% A=[1 -2 1 1 0;2 1 -4 0 -1;1 0 -2 0 0];
% b=[11;3;1];
% c=[1;1;-3;0;0 ];
% 
% A=[1,1,1,0;
%    2,0,0,1];
% b=[40;60];
% c=[-1;-2;0;0];

[m,n]=size(A);
%step 1:search a dual feasible:
L=1:n;
cobv=nchoosek(1:n,m);
for i=1:size(cobv,1)
    va=cobv(i,:);
    vb=[];
    for j=1:n
        if (any(va==j)==0) 
            vb=[vb,j];
        end
    end
    v=[va,vb];
    B=A(:,v(1:m));
    N=A(:,v(m+1:n));
    cB=c(v(1:m));
    cN=c(v(m+1:n));
    r=cN'-cB'*inv(B)*N;
if all(r>=0)
       break;
end
end

%step 2:search a basic feasible solution
while 1 
xB=inv(B)*b;
   if all(xB>=0)
       sprintf('xB is opt');
        x=xB;
        z=cB'*x;
        x
        z
        v
      return;
   end
   
   [val,q]=min(xB);
   out_v=v(1,q);
   for i=m+1:n  
    v2=v;
    in_v=v2(1,i);
    v2(1,q)=in_v;
    v2(1,i)=out_v;
    B=A(:,v2(1:m));
    N=A(:,v2(m+1:n));
    cB=c(v2(1:m));
    cN=c(v2(m+1:n));
    r=cN'-cB'*inv(B)*N;
    if (r>=0) 
        break;
    end
   end
end
