function [ R ]= gmmR (x ,t , y )
%see quarteroni page 251
x = x (:);
m = length ( x )/2; 
a = x (1: m ); 
sigma = x ( m +1: end );
n = length ( t ); 

R = zeros (n ,1);
for k =1: m
    R = R + gaussian (t,a(k),sigma(k)); 
end
R =R - y;
end