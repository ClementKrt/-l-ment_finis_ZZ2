function y = constrM(x,xk,xk1,i,j)
    if(i == 1)
        if( j == 1)
            y = phibase(x,1,xk,xk1) * phibase(x,1,xk,xk1);
        else
            y =  phibase(x,1,xk,xk1) * phibase(x,2,xk,xk1);
        end
    else
        if( j == 1)
            y =  phibase(x,2,xk,xk1) * phibase(x,1,xk,xk1);
        else
            y =  phibase(x,2,xk,xk1) * phibase(x,2,xk,xk1);
        end
    end

end