close all; clc; clear all

f=@(x) exp(-x.^2);
% Test different values of d to find d_max
% which is approximately 3.5
d=1;  % value for the first part
%d=1.6;  %this is d_max/2

degs=2:2:15;
x_test = -d:2*d/1000:d;
yy=f(x_test);
% plot(x_test,yy)
% hold on
errors=zeros(size(degs));
for k =1:length(degs)
    deg=degs(k);
    nodes=-d:2*d/deg:d;
    pp=polyfit(nodes,f(nodes),deg);
    y_test= polyval(pp,x_test);
    errors(k)=max(abs(y_test-yy));
end
semilogy(degs,errors)
title('Error')
xlabel('Degree')
hold on
semilogy(degs, exp(-degs))
semilogy(degs, exp(-2.*degs))
semilogy(degs, exp(-3*degs))
legend('err','p=1', 'p=2','p=3')

%approx p = (log(err(n2))-log(err(n1))) /(n1-n2)
ps= (log(errors(2:end))-log(errors(1:end-1)))./(degs(1:end-1)-degs(2:end));

figure()
plot(degs(1:end-1), ps)
title('Exponent approximation')
xlabel('Degree of poly')
ylabel('p')

p_appr=sum(ps)/length(ps);   %compute mean value
fprintf("Approximated p %8.3f\n",p_appr);