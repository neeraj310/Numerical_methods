function [L, U] = lu_nopivoting(A)
%Calculate LU decoposition of Matrix A

[m,n] = size(A);
if(m ~=n)
    fprintf("\n Matrix A needs to be a square Matrix");
    L = NaN
    U = Nan
    return
end   

%Initialize L and U matrix
L=zeros(m);
U=eye(m);

for s=1:n
    % Calculate L Matrix
    j=s;
    for i=j:n
        L(i,j)=A(i,j)-L(i,1:(j-1))*U(1:(j-1),j);
    end
    % Calculate U Matrix
    i=s;
    U(i,i)=1;
    for j=i+1:n
        U(i,j)=(A(i,j)-L(i,1:(i-1))*U(1:(i-1),j))/(L(i,i));
    end
    
end

end