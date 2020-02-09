function [x,iter] = Broyden(F,x0,B0,tol,itMax)
%BROYDEN Summary of this function goes here
%   Detailed explanation goes here
x=x0;
f=F(x);
B=B0;
iter=0;
err = tol+1;

size(x)
while (iter<=itMax) && (err >= tol)
    f = F(x);
    p= -B\f;
   
    xnew=x+p;
    deltaF=F(xnew)-F(x);
    B = B +((deltaF-B*p)*p')/(p'*p);
    err=norm(p)+ norm(f); 
    x=xnew;
    iter=iter+1;
    
end
size(x)

