function [ f ] = s_04_wejbull_simulating_exponential_u( )
               
    N=10000;
    sum1=0; sumofsqu1=0; mean1=0; var1=0;
    theta1=1;              % why is graph exploding at k=0.5,2.5
    k1=1.5;
    
    for i=1:N
      u(i)=rand();
      a1(i)=-theta1*log(1-u(i))^(1/k1);
      sum1=sum1+a1(i)/N;
      sumofsqu1=sumofsqu1+(a1(i)^2)/N;
    end

    var1=sumofsqu1-(sum1^2);
   
    disp(sum1);
    disp(var1); 
    
    xMax=10;
    delta_x=0.05;
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C1=0;
        z1=0;
        for i = 1 : N            
            if ((a1(i)<=x))
                C1=C1+1;
                if(a1(i)>x-delta_x)
                    z1=z1+1;
                end
            end            
        end
        Prob1(j)=C1/N;
        prob1(j)=z1/N;
        j=j+1;
    end
    
    xxasis=linspace(-xMax,xMax,j-1);
    figure
    plot( xxasis,Prob1,'k*')
    
    figure
    plot( xxasis,prob1,'k*')
    

end
