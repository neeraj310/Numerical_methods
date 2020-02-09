clc ; clear all ; close all ;

tol =10^-2;

a=1.5;
b=4;
fun = @(x) 200./(2*x.^3-x.^2).*(5*sin(20./x)).^2 ;

% Matlab integral
I_exact = integral(fun,a,b,'RelTol', 10^-8);

%Adaptive simpson
[I_ada, mesh_ada, f_eval]=quads(fun,a, b, tol);

xx=linspace(a,b,1000);
plot(xx,fun(xx))
hold on
plot(mesh_ada, zeros(size(mesh_ada)),'+')
title('Adaptive mesh')

% For trap rule we know E< 1/12 f'' h^2
%compute f''

h=xx(2)-xx(1);
f2 =max(abs(diff(diff(fun(xx))/h)/h));
K=f2/12;

% Chose h such that E< tol
h = sqrt(tol/K);
nTrap = ceil((b-a)/h);
mesh_trap=linspace(a,b,nTrap+1);
I_trap=trapz(mesh_trap, fun(mesh_trap));
figure()
plot(xx,fun(xx))
hold on
plot(mesh_trap, zeros(size(mesh_trap)),'+')
title('Trapezoidal rule')


fprintf('Evaluation adaptive %d \n', f_eval)
fprintf('Evaluation trapezoid %d \n', nTrap+1)

fprintf('Integral exact      %5.8f \n', I_exact)
fprintf('Integral adaptive %5.8f \n', I_ada)
fprintf('Integral trapezoid %5.8f \n', I_trap)


fprintf('Error adaptive %2.3e \n', abs(I_ada-I_exact))
fprintf('Error trapezoid %2.3e \n', abs(I_trap-I_exact))


