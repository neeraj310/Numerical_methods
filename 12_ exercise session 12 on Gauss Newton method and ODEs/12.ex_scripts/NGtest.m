clear all;close all; clc;
b = [15,1.5]'; %theta exact = 3

r1 = @(theta) theta.^2 + 2;
r2 = @(theta) -2*cos(theta);

theta0 = 0.1;
Maxiter = 100;
tol = 1*10^-5;
[theta_sol, theta_vec, iter] = Newton_Gauss_param(theta0, b, @Rfun, @Jfun, Maxiter, tol);

theta = linspace(-5,5,1000);
hold on
plot(theta,r1(theta),'b-')
plot(theta,r2(theta),'c-')
plot(theta_sol,r1(theta_sol),'o')
plot(theta_sol,r2(theta_sol),'*')
plot(theta,b(1)*ones(size(theta)),'g--')
plot(theta,b(2)*ones(size(theta)),'m--')
legend('r_1(x)','r_2(x)','sol_1','sol_2','b_1','b_2','Location','northwest' )

function R = Rfun(theta)
R(1,1) = theta.^2 + 2;
R(2,1) = -2*cos(theta);
end

function J = Jfun(theta)
J(1,1) = 2*theta;
J(2,1) = 2.*sin(theta);
end

