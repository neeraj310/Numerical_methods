function [ Jr]=gmmJR(x,t,y)
x=x(:);
m=length(x)/2;
a=x(1:m);
sigma=x(m+1:end);
n=length(t);
Jr=zeros(n,m*2);
gaussian=@(t,a,sigma)[exp(-((t-a)/(sqrt(2)*sigma))...
.^2)/(sqrt(pi*2)*sigma)];
fk=zeros(n,m);
for k=1:m
   fk (:,k)= gaussian(t,a(k),sigma(k));
end
for k =1: m 
    Jr(:,k)=(fk(:,k).*(t-a(k))/sigma(k)^2)';
end
for k =1: m 
    Jr (:,k+m)=(fk(:,k).*((t-a(k)).^2/...
sigma(k)^3-1/(2*sigma(k))))'; 
end
end