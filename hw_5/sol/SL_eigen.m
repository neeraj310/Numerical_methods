clc ; clear all ; close all ;

n= 40;
tol = 1.0d-10;
itMax=2500;
x0=linspace(11,40,40);
reg = ((n+1)^2)/pi^2;
alpha = 4*reg;
f = @(x) reg * (2-2*cos(x*pi/n+1));

    v=2*ones(n,1);
w=(-1)*ones(n-1,1);
T= diag(v)+diag(w,1)+diag(w,-1);
A= reg .* T;

[lambda,xx,iter,lambdas] = powershift(A,alpha,tol, itMax, x0);

lamb = [];
for k = 1:iter
    lamb(k) = f(k);
end

for z = 1:iter
    yy(1,z)= abs(lambdas(z) - min(lamb));
end


B=sort(lambdas);
if abs(B(1)/B(2))>abs(B(length(B))/B(length(B)-1))
    theo_conv_rate = (B(1)/B(2))^2;
else
    theo_conv_rate =(B(length(B))/B(length(B)-1))^2;
end

figure
%semilogx([1:1:iter],yy);
loglog([1:1:iter],yy);
xlabel('Number of iterations');
ylabel('Error on eigenvalues');
%plot(1,theo_conv_rate,'*red');
%savefig('semilogeigvals.fig');


