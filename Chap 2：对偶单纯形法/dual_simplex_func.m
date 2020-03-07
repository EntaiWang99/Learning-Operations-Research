%dual_simplex_method_function
%Created by E T Wang

function[z]=dual_simplex_func(A,b,c)
    [m,n]=size(A);

%%%% Step 1:starting with dual feasible basic solution
    %%�ҵ����еĻ����У��Ž�vmatrix��ÿ�м���Ƿ����
    vall=1:n;
    vmatrix=perms(vall);
    [~,n1]=size(vmatrix);
    
    %%����Ƿ��ż����
    for i=1:n1
        v=vmatrix(i,:);
        v'
        B=A(:,v(1:m));
        N=A(:,v(m+1:n));
        cB=c(v(1:m),:);
        cN=c(v(m+1:n),:);

        r=cN'-cB'*inv(B)*N;
        if all(r>=0)
            break;
        end
        disp("xB is not dual feasible, try again!!!");
    end

%%%%Step 2:checking for optimality
while 1
    xB=inv(B)*b';
    if all(xB>=0)
        disp("xB is optimal!!!")
        break;
    end

%%%%Step 3:search a better basic solution
%%%%Step 3.1:leaving the basis
    [val,q]=min(xB);
    out_v=v(1,q);

%%%%Step 3.2:entering the basis
    for i=m+1:n
        v2=v;%avoiding confusion of the basis
        in_v=v(1,i);
        v2(1,q)=in_v;
        v2(1,i)=out_v;

        B=A(:,v2(1:m));
        N=A(:,v2(m+1:n));
        cB=c(v2(1:m),:);
        cN=c(v2(m+1:n),:);

        r=cN'-cB'*inv(B)*N;
        if all(r>=0)
            break;
        end
    end

    if ~all(r>=0)
        disp("We can not find the entering basis, the prime problem is not feasible!!!");
        break;
    end
end
    x=inv(B)*b';
    z=cB'*x;


    


