function [S] = simp_comp(f, n)
%f = Function for which intergation needs to be approximated
%n = Number of interpolation points
%S =  approximated integral

% Define the interval

a = 0;
b = 1;
h = (b-a)/(2*n);
% Calculate inner points
xodd = [a+h:2*h:b-h];
xeven = [a+2*h:2*h:b-2*h];
% S = h/3(fa+fb+ 4*Sum f(Xi+1) + 2*Sum f(X even i)
S = (h/3)*(f(a)+f(b) + 4*sum(f(xodd)) +2*sum(f(xeven)));

end

