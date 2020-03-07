function [A,As,b,c,X,z]=BigMMethod(As,Ab,b,c)
M=99999;
s=length(c);
if ~isempty(Ab)
c=[c,zeros(1,length(Ab(:,1)))];
As=[As,zeros(length(As(:,1)),length(Ab(:,1)))];
Ab=[Ab,-eye(length(Ab(:,1)))];
m1=0;
k=zeros(1,length(Ab(1,:)));
for j=1:length(Ab(1,:))
    n=0;
    for i=1:length(Ab(:,1))
        if Ab(i,j)~=0
            n=n+1;
        end
    end
    if n==1        
        if find(Ab(:,j)==1)
        m1=m1+1;
        k(j)=find(Ab(:,j)==1);
        end
    end
end
 k=sort(k);
 D=eye(length(Ab(:,1)));
for i=1:length(k)
         if k(i)==1
            D=D(:,2:length(D(1,:)));
            k=k-1;      
        elseif k(i)>1 && k(i)<length(D(1,:)) 
            D=[D(:,1:k(i)-1),D(:,k(i)+1:length(D(1,:)))];
            k=k-1;
        elseif k(i)==length(D(1,:))
            D=D(:,1:length(D(1,:))-1);
            k=k-1;
         end
 end
 Ab=[Ab,D];
CE=ones(1,length(Ab(:,1))-m1)*M;
c=[c,CE];
As=[As,zeros(length(As(:,1)),length(D(1,:)))];
end
A=[As;Ab];
m2=0;
k=zeros(1,length(A(1,:)));
for j=1:length(A(1,:))
    n=0;
    for i=1:length(A(:,1))
        if A(i,j)~=0
            n=n+1;
        end
    end
    if n==1
        if find(A(:,j)==1)
        m2=m2+1;
        k(j)=find(A(:,j)==1);
        end
    end
end
 D2=eye(length(A(:,1)));
 k=sort(k);
for i=1:length(k)
         if k(i)==1
            D2=D2(:,2:length(D2(1,:)));
            k=k-1;      
        elseif k(i)>1 && k(i)<length(D2(1,:)) 
            D2=[D2(:,1:k(i)-1),D2(:,k(i)+1:length(D2(1,:)))];
            k=k-1;
        elseif k(i)==length(D2(1,:))
            D2=D2(:,1:length(D2(1,:))-1);
            k=k-1;
         end
 end
 A=[A,D2];
X=zeros(1,length(A));
CB=zeros(1,length(b));
CE=zeros(1,length(A(:,1))-m2);
c=[c,CE];
xB=zeros(1,length(b));
for i=1:length(b)
    F=zeros(length(b),1);
    F(i)=1;
    for j=1:length(A(1,:))
        if A(:,j)==F
            xB(i)=j;
        end
    end
end
for i=1:length(b)
    CB(i)=c(xB(i));
end
P=zeros(1,length(A(1,:)));
for i=1:length(A(1,:))
    P(i)=c(i)-CB*A(:,i);
end
if max(P)<=0
    for i=1:length(b)
        X(xB(i))=b(i);
    end
end   
  while min(P)<0 
     q=-ones(length(A(:,1)),1);
     [~,t1]=min(P);
     for j=1:length(q)
         if A(j,t1)>0
             q(j)=b(j)/A(j,t1);
         end
     end
     q(q==-1)=9999;
     [~,t2]=min(q);
     xB(t2)=t1;
     CB(t2)=c(t1);
     b(t2)=b(t2)/A(t2,t1);
     A(t2,:)=A(t2,:)/A(t2,t1);     
     for i=1:length(A(:,t1))
        if i~=t2 && A(i,t1)~=0
            b(i)=b(i)-b(t2)*A(i,t1);
            A(i,:)=A(i,:)-A(t2,:)*A(i,t1);         
        end
     end
     P=P-A(t2,:)*P(t1);
  end
z=CB*b;
for i=1:length(b)
    X(xB(i))=b(i);
end
X=X(1:s);

end

