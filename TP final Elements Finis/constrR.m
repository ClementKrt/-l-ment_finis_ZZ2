function y = constrR(x,xk,xk1,i,j)
    if(i == 1)
        if( j == 1)
            y = phiderbase(x,1,xk,xk1) * phiderbase(x,1,xk,xk1);
        else
            y =  phiderbase(x,1,xk,xk1) * phiderbase(x,2,xk,xk1);
        end
    else
        if( j == 1)
            y =  phiderbase(x,2,xk,xk1) * phiderbase(x,1,xk,xk1);
        else
            y =  phiderbase(x,2,xk,xk1) * phiderbase(x,2,xk,xk1);
        end
    end

end