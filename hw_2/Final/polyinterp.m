clc ; clear all ; close all ;

a =-5;
b = 5;
f = @(x)(exp(-x.*x));

n_all = [2,4,6,8,10];

colorstring = 'bgrym';

xk = zeros(5, n_all(end)+1);
% Create data points for polynomial interpolation
% x(1,:) will contains 3 valid nodes, x(2,:) will contain 5 nodes and so on
for i = 1:length(n_all)
    n = n_all(i);
    for k=1:n+1
       xk(i,k) = -5 +(10*(k-1))./n ;
    end
end

% Calculate data points for polynomial plots, 
zz = -5;
for j = 2:1001
    zz =  [zz, (((j-1)/100)- 5)];
end

p_leg =zeros(1,6);
fig = figure();
grid on;
hold on;
% Plot the original function
p_leg(1) = plot(zz,f(zz), 'k--','MarkerSize',1, 'Linewidth',2);

for i = 1:length(n_all) 
    n = n_all(i);
    % xx contains 2 points for 2nd degree, 5 points for 4th degree
    % polynomial
    xx = xk(i,(1:n+1));
    yy = f(xx);
    pn = polyfit(xx,yy,n);
    p_val = polyval(pn,zz);
    p_leg(i+1)= plot(zz,p_val, 'Color',colorstring(i), 'Linewidth',1);

end

legend(p_leg,'f','\Pi_2','\Pi_4','\Pi_6','\Pi_8','Pi_{10}','Location','South')
title('2, 4, 6,8, 10th degree interpolation on equidistant nodes')
axis([-5, 5, -2.5, 2.5])

xlabel('X');
ylabel('Y');

savefig(fig,'interp_n')
close all;


