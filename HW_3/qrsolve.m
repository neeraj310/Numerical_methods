function [ Q,R ] = qrsolve(A)
n = length(A(1,:));
for i=1:n
    Q(:,i) = A(:,i);
    for j=1:i-1
        R(j,i) = (Q(:,j)')*Q(:,i);
        Q(:,i) = Q(:,i)-R(j,i)*Q(:,j);
    end
    R(i,i) = norm(Q(:,i),2);
    if R(i,i) == 0
        break;
    end
    Q(:,i)=Q(:,i)/R(i,i);
end
end