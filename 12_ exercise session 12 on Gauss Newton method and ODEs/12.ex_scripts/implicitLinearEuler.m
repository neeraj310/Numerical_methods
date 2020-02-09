function [tspan, y] = implicitLinearEuler(odecoef,tspan, y0)

Nt=length(tspan)-1;
m=length(y0);
y=zeros(m,Nt+1);
y(:,1)=y0;
for i=1:Nt
    dt=tspan(i+1)-tspan(i);
    y(:,i+1)=(eye(m)-dt*odecoef)\y(:,i);
end

end

