clc ; clear all ; close all ;

% exercise 3:
L5 = @(x) 63/8*x.^5 -35/4*x.^3 +15/8*x;
xx=linspace(-1,1,1000);
plot(xx, L5(xx))
hold on;

x1 = fsolve(L5,-0.9);
x2 = fsolve(L5,-0.52);
x3 = fsolve(L5,0);
x4 = fsolve(L5,0.52);
x5 = fsolve(L5,0.9);
nodes=[x1, x2, x3, x4, x5];
plot(nodes, L5(nodes),'ro')

%PHI = zeros(Nx,Np+1);
Phi =lagrangian_polynomial(xx, nodes);
alpha = zeros(1,5);
for k =1:5
    alpha(k) = trapz(xx,Phi(:,k));
end

L5_der =  @(x) 5*63/8*x.^4 -3*35/4*x.^2 +15/8;
alpha2 = zeros(1,5);
for k =1:5
    alpha2(k) = 2/( (1-nodes(k)^2)*(L5_der(nodes(k)))^2);
end

b=3;
a=-3;
f = @(x) exp(x);
Iex = f(b) - f(a);

yy = 0.5*(a+b)+(b-a)*nodes/2;
alp = (b-a)*alpha/2;
alp2 = (b-a)*alpha2/2;
ff =f(yy);

I_app = sum(ff.*alp);
I_app2 = sum(ff.*alp2);
fprintf('Gauss quadrature I = %12.8f \n', I_app)
fprintf('Gauss quadrature I2 = %12.8f \n', I_app2)
fprintf('Exact I2 = %12.8f \n', Iex)


