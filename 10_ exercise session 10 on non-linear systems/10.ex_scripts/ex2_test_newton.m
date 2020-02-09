clear all
close all

x=sym('x',[2,1]);

phi=0.5.*((1.5-x(1).*(1-x(2))).^2+...
    (2.25-x(1).*(1-x(2).^2)).^2+...
    (2.625-x(1).*(1-x(2).^3)).^2 );
P=matlabFunction(phi);
Phi=@(x) P(x(1),x(2));

minpoint=[3;0.5];
saddle=[0;1];

g(1,1)=simplify(diff(phi,x(1)));
g(2,1)=simplify(diff(phi,x(2)));

J=matlabFunction(g);
JJ=@(x) J(x(1,1),x(2,1));

He(:,1)=diff(g,x(1));
He(:,2)=diff(g,x(2));
H=matlabFunction(He);
HH=@(x) H(x(1),x(2));

[x,res,iter]=newtonsys(JJ,HH,[8.;0.2],1e-5,100)

[x,res,iter]=newtonsys(JJ,HH,[8.;0.8],1e-5,100)


%%
xx=linspace(-1,3,10);
yy=linspace(0,1.1,10);

[XX,YY]=meshgrid(xx,yy);
PP=zeros(size(XX));
XXN=zeros(size(XX));
YYN=zeros(size(XX));
CC=zeros(size(XX));
F1=zeros(size(XX));
F2=zeros(size(XX));
for i=1:size(XX,1)
    for j=1:size(XX,2)
        x0=[XX(i,j);YY(i,j)];
        PP(i,j)=Phi(x0);
        jac = JJ(x0);
        F1(i,j)=jac(1); F2(i,j)=jac(2);
        x=newtonsys(JJ,HH,x0,1e-5,100);
        XXN(i,j)=x(1);
        YYN(i,j) = x(2);
    end
end

figure()
surf(XX,YY,PP)
xlabel('x')
ylabel('y')

fig1=figure()
quiver(XX,YY,F1,F2,'LineWidth',1)
xlabel('x')
ylabel('y')
saveas(fig1,'vect_jac.pdf')

figure()
surf(XX,YY,YYN)
colorbar()

figure()
surf(XX,YY,XXN)
colorbar()

fig2=figure()
quiver(XX,YY,XXN,YYN)
xlabel('x')
ylabel('y')
saveas(fig2,'vect_sol.pdf')