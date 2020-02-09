clc ; clear all; close all ;

% pagerRank
n=6;
i = [2 3 3  6 4 5 6 1 6 1];
j = [1 1 2  2 3 3 3 4 5 6 ];
% Build A with the correct values 
% v = [1/2 1/2 1/2 1/2 1/3 1/3 1/3 1 1 1];
% A = sparse (i,j,v);

% or build it with non-zeros=1, and then normalize columns
A = 	 (i,j,1,n,n);
c = full(sum(A));
D = spdiags(1./c',0,n,n);
A = A*D;
full(A)

e = ones(n,1);
[lambda,x,iter]=power_method(0.85.*A,e,1.e-5,50);

fprintf("== lambda: %f \n",lambda);
fprintf("== [eig] - [power] \n");
for i=1:n
    fprintf("   %f  \n", x(i));
end

figure
bar(x)
xlabel('Page')
ylabel('Importance')

[~,i]=max(x);
fprintf("First page shown is page %d\n", i);


%%
net = load('network_sample.mat');
A=net.A;
n=size(A,1);

figure()
spy(A)
c = full(sum(A));
D = spdiags(1./c',0,n,n);
A = A*D;
e = ones(n,1);
[lambda,x,iter]=power_method(A,e,1.e-8,1000);

fprintf("== lambda: %f \n",lambda);
fprintf("== [eig] - [power] \n");
for i=1:n
    fprintf("   %f  \n", x(i));
end

figure
bar(x)
xlabel('Page')
ylabel('Importance')

[~,i]=max(x);
fprintf("First page shown is page %d\n", i);

