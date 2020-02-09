function [tspan, y] = explicitEuler(odefun,tspan, y0)

Nt=length(tspan)-1;
m=length(y0);
y=zeros(m,Nt+1);
y(:,1)=y0;
for i=1:Nt
    dt=tspan(i+1)-tspan(i);
    y(:,i+1)=y(:,i)+dt*odefun(tspan(i),y(:,i));
end

end

