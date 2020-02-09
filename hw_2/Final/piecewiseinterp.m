% Create 8 equidistant points between -5 to 5
xx = linspace(-5, 5, 8);

% Define the function
f = @(x) (exp(-(x.*x)));

% Calculate f(x) for the interpoling points
yy =f(xx);

% Define figure properties
p_leg = zeros(1, 3);
colorstring = 'bgrym';
fig = figure();
grid on;
hold on;

% Plot the original function
p_leg(1) = plot(xx,f(xx), 'k--','MarkerSize',1, 'Linewidth',4);

% Calculate data points for polynomial plots between -5 to 5 
zz = -5;
for j = 2:1001
    zz =  [zz, (((j-1)/100)- 5)];
end
% Compute linear interpolation
y_linearIP = interp1(xx,yy,zz, 'linear');
p_leg(2) = plot(zz, y_linearIP, 'Color',colorstring(1), 'Linewidth',2);

% Compute Cubic Spline Interpolation 
y_splineIP = spline(xx,yy,zz);
p_leg(3) = plot(zz, y_splineIP, 'Color',colorstring(2), 'Linewidth',2);

legend(p_leg,'f','Linear Interpolation \Pi_1 f','Cubic spline Interpolation \Pi_3 f','Location','NorthEast')
title('Linear and cubic spline interpolation on equidistant nodes')
axis([-5, 5, -0.1, 1])

xlabel('X');
ylabel('Y');

savefig(fig,'piecewise')
close all;
