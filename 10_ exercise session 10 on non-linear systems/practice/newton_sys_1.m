function [x, iter] = newton_sys_1(Fun, JF, x0, tol, miter)

err = 1e10;
iter = 0;
x = x0;
while(err > tol) && (iter < miter) ;
    F = Fun(x);
    J = JF(x);
    delta = -J\F;
    x = x+delta;
    err = norm(delta);
    iter = iter +1;

end
if(iter == miter)
    error(" not able to converge in given %d iter", miter)
end    


