clc ; clear all ; close all ;
syms x
expr = pi*x.*(sin(pi*x.^2));
% Calculate integral analytically
I = int(expr, 0, 1)

f = @(x) pi*x.*(sin(pi*x.^2));
n = 2.^[1:8];
% Subinterval length(b-a)/n
h = [1./n];


for i = 1:length(n)
    I_t(i,1) = trap_comp(f, n(i));
    I_s(i,1) = simp_comp(f, n(i));
    E_t(i,1) = abs(I - I_t(i,1));
    E_s(i,1) = abs(I - I_s(i,1));
end

fig = figure(1);
hold on ;
% Plot the errors against lograthmic scale
plot(log2(n), log(E_t(:,1)),'bo-', 'Linewidth', 2);
% Theortical convergence is h2 in Trapezoid case
plot(log2(n), log(h.^2),'bo--', 'Linewidth', 1);
plot(log2(n), log(E_s(:,1)),'ro-', 'Linewidth', 2);
% Theortical convergence is h4 in Simpson case
plot(log2(n), log(h.^4),'ro--', 'Linewidth', 1);

xlabel('Number of sub intervals');
ylabel('Error in Intergal approximation');
legend('Trapezoidal Error', 'Trapezoidal Theoritical Convergence','Simpson Error','Simpson Theoritical Convergence');
legend('Location', 'SouthWest');
savefig(fig, 'plot_quadr');
close all;

    
