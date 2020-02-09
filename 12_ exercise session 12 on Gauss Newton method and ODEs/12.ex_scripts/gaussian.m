function [gauss] = gaussian (t ,a , sigma )

gauss =[exp(-((t-a)/(sqrt(2)*sigma)).^2)/(sqrt(pi*2)*sigma)];


end

