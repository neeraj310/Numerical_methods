syms x1 x2 x3
F = @(x)[3*x(1)-cos(x(2)*x(3))-0.5;
        x(1)^2 - 81*(x(2)+0.1)^2+sin(x(3))+ 1.06;
        exp(-(x(1) * x(2))) + 20*x(3)+((10*pi -3)/3)];
    
J = @(x) [ 3 , x(3)*sin(x(2)*x(3)), x(2)* sin(x(2)*x(3));
           2*x(1), -162*(x(2)+0.1),cos(x(3));
           -x(2)*exp(-x(1)*x(2)), -x(1)*exp(-x(1)*x(2)), 20];

x0=[0.1;0.1;-0.1];
tol=1e-8;
miter = 1000
%[x,res,niter]=newtonsys(F,J,x0,tol,1000);
[x1, iter1] =  newton_sys_1(F, J, x0, tol, miter);

%{
L = 3*x1 - cos(x2*x3);
    
M = @(x) [ 3 , x(3)*sin(x(2)*x(3)), x(2)* sin(x(2)*x(3));
           2*x(1), -162*(x(2)+0.1),cos(x(3));
           -x(2)*exp(x(1)*x(2)), -x(1)*exp(x(1)*x(2)), 20];

%}

      