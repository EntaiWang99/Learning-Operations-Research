%������ƽ�����������
c=[8,6,10,9;
   9,12,13,7;
   14,9,16,5];
s=[35,50,40];
d=[45,20,30,30];

c_always=c;
[x,z]=fun_get_bfs_for_TP(c,s,d);
while 1
 [rN]=fun_compute_rN_1(c,x);
% [rN]=fun_compute_rN_2(c,x);

%�ҵ���С�ļ�������Ӧ��x
standard=0;
if all(rN>=0)
   z_opt=dot(x,c_always);
   z_opt=sum(z_opt);
   x
   z_opt
    return
else 
    for i=1:m
        for j=1:n
            if rN(i,j)<standard
                standard=x(i,j);
                in_i=i;
                in_j=j;
            end
        end
    end
end
A=x;
o_i=in_i;
o_j=in_j;

%����������(�õ��Ǳջ�·��)
[r_M,route]=fun_loop_path(A,o_i,o_j);
theta=999999;
%�ҵ������ջ�·Ӧ�ü�ȥ��ֵ
for k=1:length(route)
    if rem(k,2)==0  %��2�����������ж��Ƿ�Ϊż��
        i=route(k,1);
        j=route(k,2);
        if x(i,j)<=theta
            theta=x(i,j);
            out_i=i;
            out_j=j;
        end
    end
end
%�������ջ�·���е���
for k=1:length(route)
    i=route(k,1);
    j=route(k,2);
    if rem(k,2)==0
        x(i,j)=x(i,j)-theta;
    else 
        x(i,j)=x(i,j)+theta;
    end
end
end