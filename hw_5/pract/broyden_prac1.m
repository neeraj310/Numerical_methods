function [x,iter] = broyden_prac1(Ffun, x0, B0, tol, itMax)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

B = B0;
err = 1e10;
iter = 0;
x = x0;
while(err > tol)&& (iter < itMax) ;
    F = Ffun(x);
    p = -B\F;
    xnew = x + p;
    deltaf = Ffun(xnew) - Ffun(x);
    B = B+ (((deltaf - B*p)*p')/ (p' * p));
    err=norm(p); 
    iter = iter+1;
    x = xnew;
        
end




end

