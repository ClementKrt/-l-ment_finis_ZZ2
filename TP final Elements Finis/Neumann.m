function [] = Neumann(a,b,n)
    R = sparse(zeros(n+1));
    c = [];
    B = [];
    M = sparse(zeros(n+1));
    F = @constrb;
    alpha = 1;
    FR = @constrR;
    CM = @constrM;
    
    x = linspace(a,b,n+1);
   

    
    for k =1:n
        B(k+1) = integ(F,x(k),x(k+1),1,1);
        B(k) = B(k) + integ(F,x(k),x(k+1),1,2);  
        
        R(k,k) = R(k,k) + integ(FR,x(k),x(k+1),2,2,2); 
        R(k,k+1) = R(k,k+1) + integ(FR,x(k),x(k+1),2,2,1) ;
        R(k+1,k) =  R(k+1,k) + integ(FR,x(k),x(k+1),2,1,2) ;
        R(k+1,k+1) = R(k+1,k+1) + integ(FR,x(k),x(k+1),2,1,1);     
        
        M(k,k) = M(k,k) + integ(CM,x(k),x(k+1),2,2,2); 
        M(k,k+1) =integ(CM,x(k),x(k+1),2,2,1) ;
        M(k+1,k) =  integ(CM,x(k),x(k+1),2,1,2) ;
        M(k+1,k+1) = integ(CM,x(k),x(k+1),2,1,1); 
    end 
    
    B(1) = B(1) - 1;%conditions limites ici
    B(n+1) = B(n+1) - 1;
    disp(R);
    disp(M);
    disp(B)
    c = (R+alpha*M)\B';
    disp(c);
    
    
    c1 = (-1-exp(-1))/(-exp(-1)+exp(1));
    c2 = (-1 -exp(1))/(-exp(-1) +exp(1));
    xr = linspace(a,b,100);
    y =  c1*exp(sqrt(alpha)*xr) + c2 *exp(-sqrt(alpha) * xr) + 10/alpha;
    axis equal;
    plot(xr,y);
    hold on;
    plot(x,c);
end

