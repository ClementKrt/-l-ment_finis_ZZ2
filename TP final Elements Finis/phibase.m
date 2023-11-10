function y = phibase(x,gd,xi,xi1)
    if(x<xi || x >xi1)
    y = 0;
    else
        if (gd == 1)
            y = (x-xi)/(xi1-xi);
            
        else
            y = (x-xi1)/(xi-xi1);
            
        end
    end
end
    