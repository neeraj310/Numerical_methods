clc ; clear all ; close all ;
xx = linspace(0.005, 0.5, 100);
yy = zeros(length(xx), 5);
n = length(xx);
for i = 1:n
    % Create Matrix
    for j = 1:2
        for k = 1:2
            A(j,k) = 1;
        end
    end
    % Change A(1,1) to Epsilon
    A(1,1) = xx(i);
    [L,U] =  lu_nopivoting(A); %lu_nopivoting(A) 
    [Q,R] =  qr(A);
    yy(i,1) =  cond(A, inf);
    yy(i, 2) = cond(Q, inf);
    yy(i, 3) = cond(R, inf);
    yy(i, 4) = cond(L, inf);
    yy(i, 5) = cond(U, inf);
       
end
fig = figure(1);
hold on;
plot(xx,yy(:,1),'k.','DisplayName','Cond(A)');
plot(xx,yy(:,2),'r.','DisplayName','Cond(Q)')
plot(xx,yy(:,3),'b.','DisplayName','Cond(R)')

plot(xx,log(yy(:,4)),'g.','DisplayName','Log(Cond L)')
plot(xx,log(yy(:,5)),'y.','DisplayName','Log (Cond U)')

legend('Location','North')
xlabel('Epsilon');
ylabel('Condition Number');
title('Condition number for A Q R L U Matrixes')

savefig(fig,'ex_condition')

close all;