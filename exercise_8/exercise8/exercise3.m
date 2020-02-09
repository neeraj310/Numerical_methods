clc ; clear all ; close all ;

T=10;
g = 9.8;
m = 68.1;
c = 12.5;
k = g*m/c;
fun = @(t) k*(1-exp(-t*c/m));
int_f = @(t) k*t+k*m/c*(exp(-t*c/m)-1);
d_exa = int_f(T);

%If your computer has enough memory, try with MM =10.^[1:9]
MM = 10.^[1:7];
tests = length(MM);
d = zeros(tests,1);

for i=1:tests
    M= MM(i);
    tt=linspace(0,10,M+1);
    yy= fun(tt);
    z = trapz(tt,yy);
    d(i) = z;
end

fprintf(1, "  Quadrature with composite trapezoidal\n");
for i=1:tests
    fprintf(1, "  M=%2.1e:  d_appr=%9.15f   eps=%12.2e \n", MM(i), d(i), 100*(d_exa - d(i))/d_exa);
end

figure(1)
loglog(MM, 100*(d_exa - d)/d_exa,'o-', 'Linewidth', 2);
hold on
loglog(MM, MM.^-2,'--')
title('Error for the composite trapezoidal rule');
xlabel('M, number of interval');
ylabel('Percentual error (I_ex - I_t)/I_ex');
print('ErrorParachutist','-dpng');
