
            % the probability denstity function for exponential
            % distribution with different teta values
    N=10000;
    theta = 0.5;
    theta2 = 2;
    theta3 = 0.6;
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
        for i = 1 : N            
            if ((a(i)< x)&&(a(i)>x-delta_x))
                C=C+1;
            end            
        end
        Prob(j)=C/N;
        j=j+1;
    end
    
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C=0;
        for i=1:N            
            if ((a2(i)< x)&&(a2(i)>x-delta_x))
                C=C+1;
            end            
        end
        Prob2(j)=C/N;
        j=j+1;
    end
  
    x=0;
    j=1;
    while x <= xMax
        x = x+delta_x;
        C=0;
        for i=1:N            
            if ((a3(i)< x)&&(a3(i)>x-delta_x))
                C=C+1;
            end            
        end
        Prob3(j)=C/N;
        j=j+1;
    end
    figure;
    title('pdf')
    plot(1:j-1,Prob,'*',1:j-1,Prob2,'r*',1:j-1,Prob3,'y*');
