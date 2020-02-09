% Numerical methods in informatics: HOMEWORK 5
% Help guidelines for the study of the convergence
% described in the point c of exercise 2.
%
% Copy and paste from here to your script as required.

% xa is first zeros
% xb is second zeros

nx=100; ny=50;
xDis = linspace(-3,3,nx);
yDis = linspace(-2,2,ny);
[XX,YY] = meshgrid(xDis,yDis);
COL = zeros(size(XX));

for i=1:size(XX,1)
    for j=1:size(XX,2)
        
        % Select the initial point on the mesh grid
        x0 = [XX(i,j); YY(i,j)];
        
        % Call Broyden method with initial guess x0 and B0 = J(x): 
        xij = Broyden ( ... ):
        
        % Build the matrix COL:
        % if "||xij-xa||<1.e-8":
           COL(i,j)= 1;
        % if "||xij-xb||<1.e-8"
           COL(i,j)= 2;
        % if not converged
           COL(i,j)= 0;      
    end
end

% Contour plot
figure();
hold on;
contourf(XX,YY,COL,'LineColor','None');
p1=plot(xa(1),xa(2),'r+','Markersize',6,'LineWidth',2);
p2=plot(xb(1),xb(2),'b+','Markersize',6,'LineWidth',2);

xlabel('x'); ylabel('y');
title('Convergence study of Broyden method');

% Not necessary improvements:
% add legend only for the zeros
legend([p1, p2],'X_A', 'X_B','Location', 'Southwest');
% use only 3 colors and re-name color labels
colormap(parula(3));
colorbar('Ticks',[0,1,2],'TickLabels',{'Not conv','X_A','X_B'});
