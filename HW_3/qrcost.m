clc ; clear all ; close all ;
n = [250, 500, 1000, 2000, 4000];

for i = 1:length(n)
   % fill matrix and vector 
   for j = 1:n(i)
       for k = 1:n(i)
           if(j == k)
               A(j,k) = n(i);
           else
               A(j,k) = 1/(exp(abs(j-k)/n(i)));
           end
       end
   b(j) = mod(j,2);   
               
   end
   % start time counter
   tic;
   % QR Decomposition
   [Q,R] = qrsolve(A);
   time(i,1) =  toc;
   % Solve the equation using QR matrixes
   x = (inv(R)*Q')*b';
   time(i,2) = toc;
       
end
fig = figure(1);
hold on;

plot(n, log(time(:,1)), '*', 'DisplayName', 'QR Decomposition Time','MarkerSize',8,'MarkerFaceColor', 'b');
plot(n, log(time(:,2)), '*', 'DisplayName', 'Total Time','MarkerSize',8,'MarkerFaceColor', 'r');

% plot theoritical complexities
func1 = @(x) x.^3  % QR Complexity (2/3 n*3+n*2+1/3 *n -2) is equivant to n*3 for large values of n

xx = linspace(250, 4000, 11);
yy = func1(xx);
plot(xx, log(yy), 'k--', 'DisplayName', 'QR Decomposition Theoretical Complexity','Linewidth',2 );

legend('Location', 'SouthEast');
xlabel('Size of Matrix');
ylabel('Computation Time in Seconds in Logarithmic Scale');
savefig(fig, 'qr_cost');
close all;



