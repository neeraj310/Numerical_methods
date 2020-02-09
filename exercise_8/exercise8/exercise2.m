clear all; clc; close all;
%Apply richardson's extrapolation starting from two trapezoidal rules
% with H1=1, H2=0.5

%Function, interval and exact integral
f=@(x) exp(-x.^2/2);
a=0;
b=2;
I=sqrt(pi/2)*(erf(b/sqrt(2))-erf(a/sqrt(2)));
fprintf('Exact integral    %f \n',I)

% Mesh and mesh sizes
H1=1;
H2=0.5;
X1=a:H1:b;
X2=a:H2:b;

% Trapezoidal rule for 2 meshes
T1=trapz(X1,f(X1));
T2=trapz(X2,f(X2));

% Richardson formula
R=T2+(T1-T2)/(1-(H1/H2)^2);%4/3*T2-1/3*T1;

%different errors
E1=abs(I-T1);
E2=abs(I-T2);
ER=abs(I-R);

fprintf('Integral mesh 1 %f \n',T1)
fprintf('Integral mesh 2 %f \n',T2)
fprintf('Integral richard  %f \n',R)

fprintf('Error mesh 1 %f \n', E1)
fprintf('Error mesh 2 %f \n', E2)
fprintf('Error richard  %f \n', ER)

%simpson rule
S=1/6*(f(0)+4*f(0.5)+2*f(1)+4*f(1.5)+f(2));
ES =abs(I-S);

fprintf('Integral richard %2.10f \n',R)
fprintf('Integral Simpson %2.10f \n',S)
