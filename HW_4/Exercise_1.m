function [x,nItr] = relaxmeth(A,b,x0,maxIt,tol,w)
% Implement relaxation Method
%   A - input matrix
%   b - vector b
%   x0 - inicial vector
%   maxIt - maximum number of iterations
%   tol - tolerance
%   w - relaxation scalar

%x - solution vector
%nItr - nu,ber of performed iterations

[m,n] = size(A);
% check whether matrix is square matrix or not
if(m ~= n)
    disp("A is not square matrix")
    x = NaN;
    nItr = NaN;
    return
end

% Covert the Ax = B equation to the relaxation method form
% (D+wL)Xk+1  = wb +(D(1-w) -wU)Xk
%  MXk+1 = NXk +y(Write in form of linear equation)
L = tril(A, -1);
D = diag(diag(A));
U = triu(A,1);
b = w*b;
M = w*L +D;
N = -w*U + D*(1-w)
normb = norm(b) % save norm of vector b

% Iteration Loop
for nItr = 1:maxIt
    x1 = M\(N*x0+b);  % Solution of linear equation Ax = b
    err = norm(x1-x0)/normb;
    if(err < tol)
        break;
    else
        x0 = x1;
    end
end

if(nItr == maxIt)
    disp("Failed to reach convergence")
end
        
    


