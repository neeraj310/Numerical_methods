function [lambda, v, ite] = power_method(A, v, tol, MaxIte)

if nargin<3 || isempty(tol)
    tol = 1e-5;
end
if nargin<4 || isempty(MaxIte)
    MaxIte = 500;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~isnumeric(A) || size(A,1)~=size(A,2)
    error('*** The input argument A must be a square matrix of numeric type.');
elseif size(v,1)~=size(A,1) || size(v,2)~=1
    error('*** The input argument V does not match the input argument A.');
elseif tol<=0
    error('*** The input argument TOL must be positive.');
elseif MaxIte<=0 || rem(MaxIte,1)~=0
    error('*** The input argument MAXITE must be a positive integer.');
end % if-elseif-flow
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

err = 1e10;
ite = 0;
v
oldlambda = v'*(A*v) / (v'*v);

while err>=tol && ite<MaxIte
    
    % Calculate the new eigenvector.
    v = A*v;
    v = v/norm(v,2);
    
    % Calculate the new eigenvalue.
    lambda = v'*(A*v) / (v'*v);
    
    % Calculate the error.
    err = abs(lambda - oldlambda);
    oldlambda = lambda;
    ite = ite+1;
end

end
