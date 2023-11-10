function y = phiderbase(x,gd,xi,xi1)
    if(x<xi || x >xi1)
    y = 0;
    else
        if gd == 1
            y = 1/(xi1-xi);
        else
            y = 1/(xi-xi1);
        end
    end
end
    