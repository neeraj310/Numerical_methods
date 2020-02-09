clc ; clear all ; close all ;

a =[2.3 ,3.25 ,4.82 ,5.3 ,6.6]; 
m = length ( a );
sigma =[0.2 ,0.34 ,0.50 ,0.23 ,0.39];

n =2000; 
tt = linspace(0 ,10 , n)';
yy = zeros(n,1);
for k =1: m
    yy = yy + gaussian(tt,a(k), sigma(k));
end
yy = yy +0.05* randn (n ,1);
plot(tt,yy)

m=5;
x0 =[2 ,3 ,4 ,5 ,6 ,0.3 ,0.3 ,0.6 ,0.3 ,0.3]; % x0 =[a,sigma]; % [Tfin/(m+1)*[1:m] ,rand(1,m)];
tol =3.e-5;
kmax =200;
[x , err , iter ]= gaussnewton ( @gmmR , @gmmJR , x0 , tol , kmax ,tt , yy );
xa = x (1: m ); 
xsigma = x ( m +1: end );
h =1./( sqrt (2* pi )* xsigma ); 
w =2* sqrt ( log (4))* xsigma ;

y_pred=zeros(n,1);
for k =1: m
    y_pred = y_pred + gaussian(tt,xa(k), xsigma(k));
end
plot(tt,yy)

hold on
plot(tt,y_pred,'r*')
