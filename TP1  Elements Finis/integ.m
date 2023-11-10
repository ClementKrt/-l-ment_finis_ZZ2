function val = integ(fun,a,b,arg,i,j)
    %Le format de Varargin m'ennuie
    c = (a+b)/2;
    y = [];
    val = 0; 
    if( arg == 0)
        y(1) = feval(fun,a,a,b,varargin);
        y(2) = feval(fun,b,a,b,varargin);
        y(3) = feval(fun,c,a,b,varargin);
        val = (b-a)*(y(1) + 4 * y(3) + y(2))/6;
    else
        if(arg == 1)
            y(1) = feval(fun,a,a,b,i);
            y(2) = feval(fun,b,a,b,i);
            y(3) = feval(fun,c,a,b,i);
            val = (b-a)*(y(1) + 4 * y(3) + y(2))/6;
        else
            if(arg == 2)
                y(1) = feval(fun,a,a,b,i,j);
                y(2) = feval(fun,b,a,b,i,j);
                y(3) = feval(fun,c,a,b,i,j);
                val = (b-a)*(y(1) + 4 * y(3) + y(2))/6;
            end
        end 
        
    end
    
end

