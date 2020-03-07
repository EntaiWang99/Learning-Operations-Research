%CuttingPlaneMethod.m文件：
%此程序采用割平面法求解整数规划问题
%该程序用于求解最小化问题；若为最大化问题，则必须化为最小化问题。
%As表示小于等于的不等式约束，Ab表示大于等于的不等式约束,b表示不等式约束的右端项，c表示价值系数。
function [X,z]=Cut_Plane_Ans(As,Ab,b,c)
s=length(c);
[A,As,b,c,X,z]=BigMMethod(As,Ab,b,c);
BL=0;
for i=1:s
    if floor(X(i))==X(i)
        BL=BL+1;
    end
end
  while BL<s
    i=1;
    while i<=length(b) && floor(b(i))==b(i)
        i=i+1;
    end
    if i<=length(b)
        bm=b(i)-floor(b(i));
        Ab=A(i,:)-floor(A(i,:));%为生成的割平面
        As=A;
        b=[b;bm];%由于A=[As;Ab]故bm应加到b的最后一个位置与Ab对应
        [A,As,b,c,X,z]=BigMMethod(As,Ab,b,c);
    end
    
            [X_m,~]=size(X');
        for i=1:X_m
            delta(i)=floor(X(i))-X(i);
        end
        if all(delta==0)
            break;
        end
%     BL=0;
%     for i=1:s
%         if floor(X(i))==X(i)
%             BL=BL+1;
%         end
%     end
  end
X=X(1:s);
z;