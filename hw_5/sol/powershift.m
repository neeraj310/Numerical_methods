function [lambda,xx,iter,lambdas] = powershift(A,alpha,tol,itMax, x0)

[n,m] = size(A);
if n ~= m, error('Only for square matrices'); 
end

if nargin == 1
    tol = 1.e-06; itMax = 100;
end

lambdas=[];
B=A-alpha*(eye(n));
x0 = x0/norm(x0);
pro = B*x0';
lambda = x0'.'*pro;
lambdas(1)=lambda;
err = tol*abs(lambda) + 1;
iter = 0;

while err>tol*abs(lambda) && abs(lambda)~=0 && iter<=itMax
    xx = pro;
    xx = xx/norm(xx);
    pro = B*xx;
    lambdanew = xx'*pro;
    lambdas(iter+2)=lambdanew+alpha;
    err = abs(lambdanew - lambda);
    lambda = lambdanew;
    iter = iter + 1;
end

lambda = lambda + alpha;

end
 
