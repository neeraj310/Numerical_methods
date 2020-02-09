function [T] = trap_comp(f, n)
%f = Function for which intergation needs to be approximated
%n = Number of interpolation points
%T =  approximated integral

% Define the interval

a = 0;
b = 1;
h = (b-a)/n;
% Calculate inner points
xx = [a+h:h:b-h];
% T = h/2(fa+fb+Sum of function value at inner points)
T = h*(((f(a)+f(b))/2) + sum(f(xx)));

end

