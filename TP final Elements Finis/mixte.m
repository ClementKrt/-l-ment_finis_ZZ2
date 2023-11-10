function [] = mixte(a,b,n)
    R = sparse(zeros(n+1));
    c = [];
    B = [];
    M = sparse(zeros(n+1));
    F = @constrb;
    alpha = 1;
    FR = @constrR;
    CM = @constrM;
    
    g_b = 1;
    ua = 1;
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
    c(1) = ua;
    
    B = B - c(1) * (R(1,:) + alpha* M(1,:));
    B(n+1) = B(n+1) + g_b;
   
    
    B = B(2:n+1);
    R = R(2:n+1,2:n+1);
    M = M(2:n+1,2:n+1);
    
    disp(R);
    disp(B)
    disp(M);
   
    c(2:n+1) = (R+alpha*M)\B';
    disp(c);
    
    
    c1 = (exp(1)-9)/(exp(2)+1);
    c2 = (-9*exp(2)-exp(1))/(exp(2) +1);
    xr = linspace(a,b,100);
    y =  c1*exp(xr) + c2 *exp(-xr) + 10;
    axis equal;
    plot(xr,y);
    hold on;
    plot(x,c);

end