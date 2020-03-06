
                % plotting the cdf for different value of teta
    N=10000;
    theta = 0.5;
    theta2 = 0.25;
    theta3 = 0.8;
    C=0;
        
    for i = 1 : N
      x(i) = rand();
      a(i) = -log(1-x(i))/theta;
      a2(i) = -log(1-x(i))/theta2;
      a3(i) = -log(1-x(i))/theta3;
    end
    
    xMax=10;
    delta_x=0.05;
    
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C=0;
        z=0;
        for i = 1 : N            
            if ( a(i) <= x )
                C=C+1;
                if(a(i)>x-delta_x)
                    z=z+1;
                end            
            end
        end
        Prob(j)=C/N;
        prob(j)=z/N;
        j=j+1;
    end
    
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C=0;
        z=0;
        for i=1:N            
            if ( a2(i) <= x )
                C=C+1;
                if(a2(i)>x-delta_x)
                    z=z+1;
                end 
            end            
        end
        Prob2(j)=C/N;
        prob2(j)=z/N;
        j=j+1;
    end
  
    x=0;
    j=1;
    while x <= xMax
        x = x+delta_x;
        C=0;
        z=0;
        for i=1:N            
            if ( a3(i) <= x )
                C=C+1;
                if(a3(i)>x-delta_x)
                    z=z+1;
                end 
            end            
        end
        Prob3(j)=C/N;
        prob3(j)=z/N;
        j=j+1;
    end
    xxasis=linspace(0,xMax,j-1);
    figure;
    plot(xxasis,Prob,'*',xxasis,Prob2,'r*',xxasis,Prob3,'y*');
    title('cdf');
    legend('teta=0.5','teta=2','teta=0.6')
    figure;
    plot(xxasis,prob,'*',xxasis,prob2,'r*',xxasis,prob3,'y*');
    title('pdf');
    legend('teta=0.5','teta=2','teta=0.6')
