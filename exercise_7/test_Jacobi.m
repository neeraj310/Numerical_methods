% Test Jacobi method
% We know it will converge if matrix is diagonally dominant by rows

% A=diag([5,3,6,2,4,2,5])+0.1*rand(7);
% A=diag([5,3,6,2,4,2,5])+rand(7);
% A= rand(7);
% b=rand(7,1);
A=[2.8, 4.41;-2.31, 4.91];
b=[-2;5];
[x,err,k]=JacobiMethod(A,b,1000, 1e-10);