function [lambda, xx, ite, lambdas] = powershift_1(A,alpha,tol, itMax, x0)

[m,n] = size(A);
if m ~= n;
    error(" Invalid input, Matrix A must be a square matrix");
end
[a, b] = size(x0)
if m ~= a;
    error(" size mismatch");
end

B = A - alpha*eye(m);
old_lambda = ((x0')*(B*x0))/(x0'*x0);
err = 1e10;
ite = 0;
lambdas(1) = old_lambda;

while(err > tol) && (ite <itMax);
    x = B*x0;
    x0 = x / norm(x, 2);
    new_lambda = ((x0')*(B*x0))/(x0'*x0);
    lambdas(ite+2) =  new_lambda
    err = abs(new_lambda - old_lambda);
    old_lambda = new_lambda;
    ite = ite+1;
end

lambda = old_lambda+alpha;
xx= x0;    
    
    



 

end

