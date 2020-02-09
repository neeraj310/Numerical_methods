% Let's try to solve an ODE u' = c*u, we know the exact solution is
% u0*exp(c*t)

c=-1.5;
u0=1;
exact=@(t) u0*exp(c*t);

figure(1)
%Fine mesh
tspan=linspace(0,10,1000);
[tt,yy]=explicitLinearEuler(c,tspan,u0);
plot(tt,yy','DisplayName', 'Explicit fine mesh')

[tt,yy]=implicitLinearEuler(c,tspan,u0);
hold on
plot(tt,yy', 'DisplayName', 'Implicit fine mesh')

%coarse mesh
tspan=linspace(0,10,8);
[tt,yy]=explicitLinearEuler(c,tspan,u0);
plot(tt,yy','DisplayName', 'Explicit coarse mesh')


[tt,yy]=implicitLinearEuler(c,tspan,u0);
plot(tt,yy', 'DisplayName', 'Implicit coarse mesh')
legend()

%% Systems
c=[-0.2, 1; 0.2, -1];
u0=[0.1;0.9];

figure(2)
%Fine mesh
tspan=linspace(0,10,1000);
[tt,yy]=explicitLinearEuler(c,tspan,u0);
plot(tt,yy','DisplayName', 'Explicit fine mesh')
legend()

figure(3)
[tt,yy]=implicitLinearEuler(c,tspan,u0);
plot(tt,yy', 'DisplayName', 'Implicit fine mesh')
legend()

figure(4)
%coarse mesh
tspan=linspace(0,10,8);
[tt,yy]=explicitLinearEuler(c,tspan,u0);
plot(tt,yy','DisplayName', 'Explicit coarse mesh')

hold on
[tt,yy]=implicitLinearEuler(c,tspan,u0);
plot(tt,yy', 'DisplayName', 'Implicit coarse mesh')
legend()

%% Nonlinear system: pendolum
% y''=-g*sin(y)... y1=y, y2=y1' is the speed
% y1'=y2  
% y2' = -g*sin(y1)

g=9.81;
odefunct=@(t,y) [y(2); -g*sin(y(1))];

u0=[0.9;0.1];
tspan=linspace(0,5,1000);
[tt,yy]=explicitEuler(odefunct,tspan, u0);
figure()
plot(tt,yy', 'DisplayName', 'Explicit Euler')

hold on

[tt,yy]=ode23(odefunct,tspan,u0);
plot(tt,yy',':', 'DisplayName', 'ode23')
[tt,yy]=ode45(odefunct,tspan,u0);
plot(tt,yy','--', 'DisplayName', 'ode45')
legend()

%% Non linear Lotka-Volterra equations
% https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations

alpha=1; beta=0.5; delta=0.7; gamma=0.9;
odefunct= @(t,u) [alpha*u(1)-beta*u(1)*u(2); delta*u(1)*u(2)-gamma*u(2)];

figure()
u0=[0.9;0.1];
tspan=linspace(0,30,1000);
[tt,yy]=explicitEuler(odefunct,tspan, u0);

plot(tt,yy')

hold on

[tt,yy]=ode23(odefunct,tspan,u0);
plot(tt,yy',':', 'DisplayName', 'ode23')
[tt,yy]=ode45(odefunct,tspan,u0);
plot(tt,yy','--', 'DisplayName', 'ode45')
legend()
