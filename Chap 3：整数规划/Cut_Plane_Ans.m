%CuttingPlaneMethod.m�ļ���
%�˳�����ø�ƽ�淨��������滮����
%�ó������������С�����⣻��Ϊ������⣬����뻯Ϊ��С�����⡣
%As��ʾС�ڵ��ڵĲ���ʽԼ����Ab��ʾ���ڵ��ڵĲ���ʽԼ��,b��ʾ����ʽԼ�����Ҷ��c��ʾ��ֵϵ����
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
        Ab=A(i,:)-floor(A(i,:));%Ϊ���ɵĸ�ƽ��
        As=A;
        b=[b;bm];%����A=[As;Ab]��bmӦ�ӵ�b�����һ��λ����Ab��Ӧ
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