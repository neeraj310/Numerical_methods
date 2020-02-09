a=5;

a,b = lagr_polynomial(0.3)
%{
syms x;
f = x*x*x - 1.5*x*x + .54*x  
%f = x*(x-0.6)*(x-0.9);
k = sin(x);
ezplot(k, [0,1]);
df = diff(f);
s = solve(df);
y1 = subs(f, s(1));
y2 = subs(f, s(2));

if(y1 >y2) 
    max = y1;
else
    max = y2;
end
 
%}