function [x,res,niter] = newtonsys(Ffun,Jfun,x0,tol,...
                                nmax, varargin)
%NEWTONSYS Finds a zero of a nonlinear system
% [ZERO,RES,NITER]=NEWTONSYS(FFUN,JFUN,X0,TOL,NMAX)
% tries to find the vector ZERO, zero of a nonlinear
% system defined in FFUN with jacobian matrix defined
% in the function JFUN, nearest to the vector X0.
% The variable RES returns the residual in ZERO
% while NITER returns the number of iterations needed
% to compute ZERO. FFUN and JFUN are function handles
% associated with anonymous functions or MATLAB
% functions stored in M-files.
niter = 0; err = tol + 1; x = x0;
while err >= tol && niter < nmax
   % J = Jfun(x,varargin{:});
   % F = Ffun(x,varargin{:});
    F = Ffun(x);
    J = Jfun(x);
    delta = - J\F;
    x = x + delta;
    err = norm(delta);
    niter = niter + 1;
end
res = norm(Ffun(x,varargin{:}));
% if (niter==nmax && err> tol)
%  fprintf(' Fails to converge \n');
% end
return
