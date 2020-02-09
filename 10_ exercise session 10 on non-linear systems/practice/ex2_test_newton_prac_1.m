clc; clear all;close all;
x = sym('x', [2, 1]);

phi=   0.5.*((1.5-x(1).*(1-x(2))).^2+...
           (2.25-x(1).*(1-x(2).^2)).^2+...
           (2.625-x(1).*(1-x(2).^3)).^2 );
 
f = matlabFunction(phi);
F = @(x) f(x(1), x(2));

g(1,1) = simplify(diff(phi,x(1)));
g(2,1) = simplify(diff(phi,x(2)));

J = matlabFunction(g);
JJ = @(x) J(x(1, 1), x(2,1));

