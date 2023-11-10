function [] = Masse(a,b,n)

    x = linspace(a,b,n+1);
    xr = linspace(a,b,100);
    %Matrice de masse
    M = zeros(n+1);
    B1 = zeros(n+1,1);
    CM = @constrM;
    FB = @constrb;
    c1  = [];
    
    for k =1:n
        %B(k+1) c'est l'intégrale de la fonction croissante
        B1(k+1) = integ(FB,x(k),x(k+1),1,1);
        %B(k) c'est l'intégrale de la fonction decroissante
        B1(k) = B1(k) + integ(FB,x(k),x(k+1),1,2);  
        

        M(k,k) = M(k,k) + integ(CM,x(k),x(k+1),2,2,2); 
        M(k,k+1) =integ(CM,x(k),x(k+1),2,2,1) ;
        M(k+1,k) =  integ(CM,x(k),x(k+1),2,1,2) ;
        M(k+1,k+1) = integ(CM,x(k),x(k+1),2,1,1);  
    end 
   
   
    disp(M);
    disp(B1);
    c1 = M\B1;
    disp(c1);
    y = (xr-1).*(xr+1);
    plot(xr,y);
    hold on;
    plot(x,c1);
end

