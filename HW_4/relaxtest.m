clc ; clear all ; close all ;
A = [5, -12, 3; -3, 9, 1; 2, -1, -7];
b = [-1;2;3];
%Real soultion of linear equation
x_real = A\b;

x0 = b;
w = [0.01:0.01:2];

tol = 0.0001;
max_iter = 1000;

% Calculate iteration matrix B and spectral density
L = tril(A, -1);
D = diag(diag(A));
U = triu(A,1);
% Covert the Ax = B equation to the relaxation method form
% (D+wL)Xk+1  = wb +(D(1-w) -wU)Xk
%  MXk+1 = NXk +y(Write in form of linear equation)
% iteration matrix  = (inv)M*N
for i = 1:length(w)
    
    M = w(i)*L +D;
    N = -w(i)*U + D*(1-w(i));
    B = M\N;
    spectral_matix(:,:,i) = B;
    spectral_radius(i,1) = max(abs(eig(B)));
    
end

fig = figure(1);
hold on;
xx = w;
yy = spectral_radius(:,1);
plot(xx, yy)
xlabel('w');
ylabel('Spectral Density');

% Find the optimum value of W
for i = 1:length(w)
    [x_apprx(:,i),iter(i,1)] = relaxmeth(A,b,x0,max_iter,tol,w(i));
end
% find min value of iteration
[min_iter, index] = min(iter);

% Plot spectral_density corresponding to optimum w
plot(xx(index), yy(index), 'ro','Linewidth', 2);

%compute the solution of the given linear system using the relaxation method with !
[x, y] = relaxmeth(A,b,x0,max_iter,tol,xx(index));

savefig(fig, 'relaxplot');
close all;







