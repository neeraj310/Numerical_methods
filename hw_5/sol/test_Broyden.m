clear all; close all; clc;

%Initializing all the input parameters
x0a=[-1,0];
x0b=[-1,-1];
tol=1*10^-10;
max_iter=100;

B0a= Jfun(x0a);
B0b= Jfun(x0b);


[xa,nitera] = Broyden(@Ffun, x0a,B0a,tol,max_iter);
[xb,niterb] = broyden_prac1(@Ffun, x0b,B0b,tol,max_iter);


figure
plot(xa(1),xa(2),'p');
hold on;
plot(xb(1),xb(2),'p');
hold on;
disp(xb);
xlim([-1 3]);
ylim([-1 3]);
savefig('zeros_Broyden.fig');


function J=Jfun(x)
      x1=x(1);
      x2=x(2);
      J(1,1)=2*x1;
      J(1,2)=8*x2;
      J(2,1)=2*(x1-0.5);
      J(2,2)=-1;

end

function F=Ffun(x)
    x1=x(1);
    x2=x(2);
    F(1,1)=x1^2+4*x2^2-1;
    F(2,1)=(x1-0.5)^2-x2-1;
end

