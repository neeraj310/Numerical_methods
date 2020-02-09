A = [1 2 3 4; 4 5 6 8 ; 7 8 9 10; 11 12 13 14]
%A = [1 2 3 ; 4 5 6 ; 7 8 9]
A = magic(4)
[m,n] = size(A)
if(m ~=n)
    fprintf("\n Matrix A needs to be a square Matrix");
end   
%Initialize L and U matrix
L=zeros(m);
U=eye(m);
for s=1:n
%Perform calculation on column j to determine L components 
j=s;
for i=j:n
    L(i,j)=A(i,j)-L(i,1:(j-1))*U(1:(j-1),j);
end
%Perform calculation on row i to determine U components   
i=s;
U(i,i)=1;
for j=i+1:n
    U(i,j)=(A(i,j)-L(i,1:(i-1))*U(1:(i-1),j))/(L(i,i));
end
end
        
disp(sprintf('\n'))
check= (L*U)
if check==A
    disp(sprintf ('                  the equation L*U=A is correct  '))
else
    disp(sprintf ('error'))
end
