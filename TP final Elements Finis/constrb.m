function [y] = constrb(x,xk,xk1,i)
if(i == 1)
    y = F(x) * phibase(x,1,xk,xk1);
else
    y = F(x) * phibase(x,2,xk,xk1);
end

