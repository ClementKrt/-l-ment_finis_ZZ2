function [] = main(a,b,n)

    %Assemblage
    R = zeros(n+1);
    c = [];
    B = [];
    F = @constrb;
    FR = @constrR;
    x = linspace(a,b,n+1);
    %On réfléchis par intervalle  
    %On a pas v(a) = v(b) = 0 ni même u(a)=u(b)=0 
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
    disp(R);
    disp(B);
    
    
end

