function [theta, theta_vec, i] = Newton_Gauss_param(theta0, b, Rfun, Jfun, Maxiter, tol)

theta = theta0;
theta_vec = [theta0];
err = tol + 1;
i = 0;
while err > tol && i < Maxiter
    J = Jfun(theta);
    R = Rfun(theta);
    JJ = J'*J;
    delta_t = JJ\ (J'*(b - R)) ;
    theta = theta + delta_t;
    theta_vec = [theta_vec, theta];
    i = i + 1;
    err = norm( theta_vec(end)-theta_vec(end-1) );
end


end