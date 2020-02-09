function [x,err,k] = JacobiMethod(A,b,n_max,tol)
% Gauss Seidel method for system Ax=b

M=diag(diag(A));
N=M-A;
x_old=ones(size(b));
x=x_old;
M_inv= zeros(size(M));
for k=1:size(M,1)
    M_inv(k,k)=1/M(k,k);
end
 
for k=1:n_max
    x= M_inv*(N*x_old+b);
    err = norm(A*x-b,2);
    if err<tol
        break
    end
%     hold on
%     plot([x_old(1),x(1)],[x_old(2),x(2)],'b-')
%     pause(1/sqrt(k))
    x_old=x;
end
if k==n_max
    fprintf('Not converged, error %f\n',err)
end
end

