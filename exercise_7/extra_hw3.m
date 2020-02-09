%% Additional point

A= [11, 10, 14; 12, 11, - 13; 14, 13, -66];
A2= [11, 10, 14; 12, 11.01, - 13; 14, 13, -66];

b = [1, 1, 1]';
b2 = [1.001, 1, 1]';

[L,U]=lu_nopivoting(A);
[L2,U2]=lu_nopivoting(A2);

x=backward_sub(U,forward_sub(L,b))
x2=backward_sub(U2,forward_sub(L2,b))

x3=backward_sub(U,forward_sub(L,b2))

fprintf('Condtion number of A = %f,\n  of L = %f,\n of U=%f\n',cond(A), cond(L), cond(U))

%% Additional exercise
A = [6 6 2; 2 3 1; 4 5 4];
x1 = [10; 15; 30];

b = A*x1;
b1=[210 95 235]';
b2 = [220 105 190]';

[L,U,P]=lu(A);
det(A)
det(U)

y = L\(P*b1);
x_hat = U\y

y = L\(P*b2);
x_hat2 = U\y
