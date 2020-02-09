n = 40
a = 2*ones(n,1);
A = diag(a);
b = -1*ones(n-1,1);
A = A+ diag(b, -1)+diag(b, 1);
C = ((n+1)^02)*(pi^-2);
A = A*C;

f = @(x) C*(2-2*cos((k*pi)/(n+1)));
tol = 1.0d-10;
itMax = 2500;
alpha = 4*C;
x0 = linspace(1, 40, 40)
[lambda,xx,iter,lambdas] = powershift(A,alpha,tol, itMax, x0);
[lambda1,xx1,iter1,lambdas1] = powershift_1(A,alpha,tol, itMax, x0');





