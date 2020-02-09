%function [x,nItr] = relaxmeth(A,b,x0,maxIt,tol,w)
% Implement relaxation Method
%   A - input matrix
%   b - vector b
%   x0 - inicial vector
%   maxIt - maximum number of iterations
%   tol - tolerance
%   w - relaxation scalar

%x - solution vector
%nItr - nu,ber of performed iterations

A = [4, 1, 2; 3,8, 4; 7, 8, 20]
[m,n] = size(A);
% check whether matrix is square matrix or not
if(m ~= n)
    disp("A is not square matrix")
    %return(NaN, NaN)
end
dd_flag = 1
% Check for diagonally dominant
for i = 1:m
    sum = 0;
    for j = 1:m
        if i == j
            diag_ele = A(i,j);
        else
            sum = sum+A(i,j)
            
        end             
    end    
    if (diag_ele < sum)
        dd_flag = 0
        break    
    end
end

if(dd_flag == 1)
    disp(" Matrix is DD")
end    



