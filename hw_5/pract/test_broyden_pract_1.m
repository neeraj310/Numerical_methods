Ffun = @(x) [(x(1)^2 + 4*(x(2)^2) -1);
             ((x(1) -0.5)^2 -x(2)-1)];

JFun = @(x) [ 2*x(1), 8*x(2);...
              2*((x(1) - 0.5)), -1];


tol = 1e-10;
itMax = 1000;
x0 = [-1, 0];
x01 = [ -1, -1];
B0 = JFun(x0);
K2 = Ffun(x0)
[x1, iter1] = broyden_prac1(Ffun, x0, B0, tol, itMax);
[x2, iter2] = broyden_prac1(Ffun, x01, B0, tol, itMax);
figure;
plot(x1(1), x1(2), 'p')
hold on
plot(x2(1), x2(2), 'p')
xlim([-1 3]);
ylim([-1 3]);
%disp(x2);


          
          
          
          