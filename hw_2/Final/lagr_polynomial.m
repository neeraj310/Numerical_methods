function [yp,err] = lagr_polynomial(xp)
%lagr polynomial.m that constructs 2nd dgree polynomial to approximate f 
% in a given xp
clc;
xx = [0, 0.6, 0.9];
f = @(x) cos(x);
yy =f(xx);

x0 = xx(1);
x1 = xx(2);
x2 = xx(3);

% Degree of polynomial is 1 less than then nu of data set points
n = length(xx) - 1;
% Take a column vector to store L1---Ln+1
L = ones(n+1, 1);
for i = 1:n+1
    for j = 1:n+1
       if(j ~= i)
         L(i,1) = L(i,1).*((xp - xx(j))/(xx(i)-xx(j)));
       end
    end
end

yp = 0;
for i = 1:n+1
    % Calculate the approximate value by using Langrage polynomials.
    yp = yp + yy(i).*L(i,1);
end
err = abs(yp - f(xp));
fprintf("Approximated value of f(x) with four decimal points is %.4f\n",yp)
fprintf("Error in approximation of f(x) at given point %.4f is %.4f", xp,err)

% Part 2 of the problem

fig=figure();
hold on;
xx = linspace(0, 1, 50);
yy = f(xx);

% Iniatilalize X data points 

% Caculate Lanrange polynomial Ln(x)
L1 = (((xx - x1).*(xx-x2))/((x0-x1).*(x0-x2)));
L2 = (((xx - x0).*(xx-x2))/((x1-x0).*(x1-x2)));
L3 = (((xx - x0).*(xx-x1))/((x2-x0).*(x2-x1)));

% Plot the Lanrange polynomials in the interval [0,1]
plot(xx, L1, 'r', 'Linewidth', 2);
plot(xx, L2, 'b-', 'Linewidth', 2);
plot(xx, L3, 'g-','Linewidth', 2);

%Plot the points corresponding to Lk(xk), for for k = 1, 2, 3

l1_x1 = (((x0 - x1).*(x0-x2))/((x0-x1).*(x0-x2)));
l2_x2 = (((x1 - x0).*(x1-x2))/((x1-x0).*(x1-x2)));
l3_x3 = (((x2 - x0).*(x2-x1))/((x2-x0).*(x2-x1)));

plot(x0, l1_x1, 'rs', 'MarkerSize',4,'Linewidth', 4);
plot(x1, l2_x2, 'bs', 'MarkerSize',4,'Linewidth', 4);
plot(x2, l3_x3, 'gs', 'MarkerSize',4,'Linewidth', 4);

title('Lagrange Polynomial Interpolation');
xlabel('X');
ylabel('Y');
legend('\Pi_0','\Pi_1','\Pi_2','Location','Northwest')
savefig(fig,'lagrangianpoly')
close all;
end