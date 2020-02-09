function PHI = lagrangian_polynomial(xx, nodes)

Nx = length(xx);
Np = length(nodes);
PHI = zeros(Nx,Np+1);

% build weights
ww=ones(1,Np);
for k=1:Np
    for j=1:k-1
        ww(k)= ww(k)*(nodes(k)-nodes(j));
    end
    for j=k+1:Np
        ww(k)= ww(k)*(nodes(k)-nodes(j));
    end
end
ww = 1./ww;

for i=1:Nx
    for k=1:Np
        num =1;
        for j=1:k-1
            num= num*(xx(i)-nodes(j));
        end
        for j=k+1:Np
            num= num*(xx(i)-nodes(j));
        end
    PHI(i,k)=num*ww(k);
    end
end

end