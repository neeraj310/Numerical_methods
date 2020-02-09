function [L,U] = lu_nopivoting(A)
% [L,U] = lu_nopivoting(A,b)  returns the matrices L and U of the Gauss 
% LU decomposition of A.
%
% INPUT: A Square matrix, assumed invertible, and solvable without row
%           interchanges.
% OUTPUT: L lower triangular matrix
%         U upper triangular matrix

n=size(A,1);
if(size(A,2) ~= n)
    error("A is not a square matrix")
end

for k=1:n-1
    % compute the multipliers and store them in the matrix A
    A(k+1:end,k) = A(k+1:end,k)/A(k,k);
    % subtract multiples of line k from the next lines
    A(k+1:end,k+1:end) = A(k+1:end,k+1:end)-A(k+1:end,k)*A(k,k+1:end);
end

L = eye(n) + tril(A,-1);
U = triu(A);
    
end