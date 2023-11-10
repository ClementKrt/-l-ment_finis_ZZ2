function [] = Assemblage(a,b,n)
    %Assemblage
    R = sparse(zeros(n+1));
    c = [];
    B = [];
    F = @constrb;
    FR = @constrR;
    x = linspace(a,b,n+1);
    ua = 4; 
    ub = 2;
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
    end 
    %avec Dirichlet Reconstitution

    c(1) = ua;
    c(n+1) = ub; 
    B = B - c(1) * R(1,:);
    B = B - c(n+1)*R(n+1,:);
   %disp(B);
    B = B(2:n);
    R = R(2:n,2:n);
    %disp(B);
    %disp(R);
    
    c(2:n) = R\B';
    %disp(c);
    xr = linspace(0,1,100);
    y = -5*xr.^2 + 3*xr + 4;
    hold on;
    plot(xr,y);
    plot(x,c);
    
end

