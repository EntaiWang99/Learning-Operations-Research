function[X,z]=Cut_Plane(As,Ab,b,c)
    s=length(c);
    [A,As,b,c,X,z]=BigMMethod(As,Ab,b,c);

    while 1
    i=1;
    %%each time you can only cut one plane!
    while i<=length(b) && floor(b(i))==b(i)
        i=i+1;
    end
    
    if i<=length(b)
        b_floor=b(i)-floor(b(i));
        A_floor=A(i,:)-floor(A(i,:));
        As=A;
        Ab=A_floor;
        b=[b;b_floor];
        ffloor=[A_floor,b_floor];%%cut plane eqution
        [A,As,b,c,X,z]=BigMMethod(As,Ab,b,c);
    end
    
        [X_m,~]=size(X');
        for i=1:X_m
            delta(i)=floor(X(i))-X(i);
        end
        if all(delta==0)
            break;
        end
   end
  
  X=X(1:s);
z;
    
   