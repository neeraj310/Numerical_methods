function [Q,mesh,fevals] = quads(func,a, b, tol)
%
% function [Q,mesh,fevals] = quads(a, b, tol)
%
% adaptively evaluate Q - an approximation to the
% integral from a to b of func(x), to within tolerance tol.
%
% mesh is the resulting mesh where f was evaluated
% fevals is the number of function evaluations required.
% initialize
maxlevel = 10;
fa = func(a); fb = func(b); fab2 = func((a+b)/2);
sab = srule (a,b,fa,fab2, fb);
fevals = 3;
mesh(1) = a; mesh(2) = b; mesh(3) = (a+b)/2;
% Evaluate the integral
[Q,mesh,fevals] = quade (func,a, b, tol, fa, fab2, ...
    fb, sab, maxlevel, fevals, mesh);
% sort mesh in ascending order
mesh = sort(mesh);
end

function [Q,mesh,fevals] = quade(func,a, b, tol, fa, ...
    fab2, fb, sab, level, fevals, mesh)
%
% adaptively evaluate Q - one recursive step.
% called by quads
%
% mesh is the resulting mesh where f was evaluated
% fevals is the number of function evaluations required.
fa3b1 = func((3*a+b)/4);
fa1b3 = func((a+3*b)/4);
mesh(fevals+1) = (3*a+b)/4; mesh(fevals+2) = (a+3*b)/4;
fevals = fevals + 2;
ab2 = (a+b)/2;
saab = srule (a,ab2,fa,fa3b1,fab2);
sabb = srule (ab2,b,fab2,fa1b3,fb);
% compare error estimate to tolerance
if abs ( sab - (saab+sabb)) < 10*tol
    Q = saab+sabb;
else
    %must subdivide further
    % first check if max recursion levels reached
    if level == 0
        fprintf('max recursion levels reached.')
        fprintf('Current level = %d\n ',level)
        Q = saab+sabb;
    else
        [Q1,mesh,fevals] = quade(func,a, ab2, tol/2, fa, fa3b1,...
            fab2, saab, level-1, fevals, mesh);
        
        [Q2,mesh,fevals] = quade(func,ab2, b, tol/2, fab2, fa1b3,...
            fb, sabb, level-1, fevals, mesh);
        Q = Q1 + Q2;
    end
end
end

function val = srule (a,b,fa,fab2, fb)
%
% function val = srule (a,b,fa,fab2, fb)
%
% evaluate basic Simpson rule
%
val = (b-a)/6 * (fa + 4*fab2 + fb);
end