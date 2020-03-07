function [r_M,route]=fun_loop_path(A,o_i,o_j)


%A =[nan nan 5 2;3 nan nan 1;nan 6 nan 3]        %用来测试闭合回路的算法
% o_i=3;
% o_j=1;

A(A==0)=NaN;
move=[1 0;-1 0;0 1;0 -1];                        %指针的移动方向，下、上、右、左
[m,n]=size(A);                                   %m、n分别为A的行数和列数

R=[];
%------------行的可行性标记

[marks,i,j,row,col,B]=mark(A,o_i,o_j);              %初始化可行性路径
prev=[0 0];                                     %用于保存上一次移动时的移动方向
[~,R,~,~,~]=seekPath(B,0,marks,move,R,prev,0,i,j,row,col);  %查询比和路径
%%%%

[m1,n1]=size(R);
R2=[];
for i=1:m1
    if isnan(A(R(i,1),R(i,2))) && ~(R(i,1)==o_i && R(i,2)==o_j)
        continue;
    end
    R2=[R2;R(i,:)];
end
R2=fliplr(R2');
R2=R2';
%%%%
[m1,n1]=size(R2);
R3=[];
R3=[R3;R2(1,:)];
for i=2:m1
    pre_row=R2(i-1,:);
    if i==m1
        next_row=R2(1,:);
    else
        next_row=R2(i+1,:);
    end
    sameRowLabel=0;
    sameColLabel=0;
    if pre_row(1,1)==R2(i,1)
        sameRowLabel=sameRowLabel+1;
    end
    if next_row(1,1)==R2(i,1)
       sameRowLabel=sameRowLabel+1;
    end
    if pre_row(1,2)==R2(i,2)
        sameColLabel=sameColLabel+1;
    end
    if next_row(1,2)==R2(i,2)
       sameColLabel=sameColLabel+1;
    end
    if sameRowLabel==0 || sameColLabel==0
       continue; 
    end    
    R3=[R3;R2(i,:)];
end

%%%%%
result=res(A,R3,o_i,o_j);                               %查询结果，用二进制表示路径
r_M=result;
route=R3;




function [isfind,R,times,row,col,prev]=seekPath(A,isfind,marks,move,R,prev,times,i,j,row,col)
  if (i==row &&j==col)                   %判断是否又回到查找起点
        times=times+1;
        if times==2                      %此时回到起点，查找结束
            isfind=1;
            return
        end
  end
  x=i;y=j;
  if isnan(A(i,j))              %该数据点为空所执行的算法
      next=prev;                %如果数据格为空则只能直走     
      u=i-prev(1);v=j-prev(2);  %按照前一次的方向移动
      if prev(1)
          mrow=2;
      else
          mrow=1;
      end
      if marks(u+1,v+1,mrow)==1
         [isfind,R,times,row,col]=seekPath(A,isfind,marks,move,R,next,times,u,v,row,col);
         if isfind==1
              R=[R;i j];
              return
         end
      end
  else
        for k=1:4
            if k==1||k==2
                mrow=2;
            else
                mrow=1;
            end
            u=i+move(k,1);
            v=j+move(k,2);
            
            if prev(1)~=move(k,1)||prev(2)~=move(k,2)               %判断是否原路返回
                if marks(u+1,v+1,mrow)==1
                    next=[-move(k,1),-move(k,2)];
                    [isfind,R,times,row,col]=seekPath(A,isfind,marks,move,R,next,times,u,v,row,col);
                       if isfind==1
                           R=[R;i j];
                           return
                       end
                end
           end
        end
  end
    function result=res(A,R,o_i,o_j)
        [m,n]=size(A);
        [m1,n1]=size(R);
        result=zeros(m,n);                      
        for i=1:m1
%             if isnan(A(R(i,1),R(i,2))) && ~(R(i,1)==o_i && R(i,2)==o_j)
%                continue; 
%             end
            %%%%%%%%
            result(R(i,1),R(i,2))=1;
        end
        
function [marks,i,j,row,col,B]=mark(A,x,y)
     fprintf('%s%d%s%d%s\n','闭回路起点为A(',x,',',y,')')
            A(x,y)=-1;
            B=A;
            [m,n]=size(A);
            
            marks=zeros(m+2,n+2,2);
for p=2:m+1
    T1=find(~isnan(A(p-1,:)));
    if ~isempty(T1)
        if length(T1)==1
            marks(p,T1(1)+1,1)=1;
        else
            for k=T1(1):T1(length(T1))
                marks(p,k+1,1)=1;
            end
        end
    end
end
for q=2:n+1
    T2=find(~isnan(A(:,q-1)));
    if ~isempty(T2)
        if length(T2)==1
            marks(T2(1)+1,q,2)=1;
        else
            for k=T2(1):T2(length(T2))
                marks(k+1,q,2)=1;
            end
        end
    end
end
row=x;col=y;i=x;j=y;
 
