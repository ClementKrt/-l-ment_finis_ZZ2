function [] = Dirichlet(a,b,n)
     %Assemblage
    R = sparse(zeros(n+1));
    c = [];
    B = [];
    F = @constrb;
    FR = @constrR;
    x = linspace(a,b,n+1);
    M = sparse(zeros(n+1));
    CM = @constrM;
    
    alpha = 1;
    ua = 1; 
    ub = 1;
    %On réfléchis par intervalle  
    
    for k =1:n
        %B(k+1) c'est l'intégrale de la fonction croissante
        B(k+1) = integ(F,x(k),x(k+1),1,1);
        %B(k) c'est l'intégrale de la fonction decroissante
        B(k) = B(k) + integ(F,x(k),x(k+1),1,2);  
        
        %(k,k) est l'indice de l'intégrale de la dérivé de la fonction decroissante * la
        %dérivé de la fonction décroissante
        R(k,k) = R(k,k) + integ(FR,x(k),x(k+1),2,2,2); 
        %(k,k+1) est l'indice de l'intégrale de la dérivé de la fonction decroissante * la
        %dérivé de la fonction croissante
        R(k,k+1) = R(k,k+1) + integ(FR,x(k),x(k+1),2,2,1) ;
        %(k+1,k) est l'indice de l'intégrale de la dérivé de la fonction croissante * la
        %dérivé de la fonction decroissante
        R(k+1,k) =  R(k+1,k) + integ(FR,x(k),x(k+1),2,1,2) ;
        %(k+1,k+1) est l'indice de de l'intégrale la dérivé de la fonction croissante * la
        %dérivé de la fonction croissante
        R(k+1,k+1) = R(k+1,k+1) + integ(FR,x(k),x(k+1),2,1,1); 
        
        M(k,k) = M(k,k) + integ(CM,x(k),x(k+1),2,2,2); 
        M(k,k+1) =integ(CM,x(k),x(k+1),2,2,1) ;
        M(k+1,k) =  integ(CM,x(k),x(k+1),2,1,2) ;
        M(k+1,k+1) = integ(CM,x(k),x(k+1),2,1,1); 
    end 
    %avec Dirichlet Reconstitution

    c(1) = ua;
    c(n+1) = ub; 
    B = B - c(1) * (R(1,:) + alpha*M(1,:));
    B = B - c(n+1)* (R(n+1,:) + alpha*M(n+1,:));
   
    B = B(2:n);
    R = R(2:n,2:n);
    M = M(2:n,2:n);
    disp(B);
    disp(R);
    disp(M);
    c(2:n) = (R+alpha*M)\B';
    disp(c);
    
   
    c2 = (-9*exp(1))/(exp(1)+1);
    c1 = -9/(exp(1)+1);
   
    xr = linspace(a,b,100);
    y =  c1*exp(sqrt(alpha)*xr) + c2 *exp(-sqrt(alpha) * xr) + 10/alpha;
    
    axis equal;
    plot(xr,y);
    hold on;
    plot(x,c);
    

    
end