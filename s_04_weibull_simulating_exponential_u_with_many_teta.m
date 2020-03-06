function [ f ] = s_04_weibull_simulating_exponential_u_with_many_teta( )
               
    N=10000;
    sum1=0; sumofsqu1=0; mean1=0; var1=0;
    sum2=0; sumofsqu2=0; mean2=0; var2=0;
    sum3=0; sumofsqu3=0; mean3=0; var3=0;
    sum4=0; sumofsqu4=0; mean4=0; var4=0;
    
    theta1=1; theta2=1; theta3=1; theta4=1;
    k1=0.5; k2=1.2; k3=1.5; k4=5;   % for the value given in wiki pedia, k1, k4 explodes
    
    for i=1:N
      u(i)=rand();
      a1(i)=-theta1*log(1-u(i))^(1/k1);
      a2(i)=-theta2*log(1-u(i))^(1/k2);
      a3(i)=-theta3*log(1-u(i))^(1/k3);
      a4(i)=-theta4*log(1-u(i))^(1/k4);
      sum1=sum1+a1(i)/N;
      sum2=sum2+a2(i)/N;
      sum3=sum3+a3(i)/N;
      sum4=sum4+a4(i)/N;
      sumofsqu1=sumofsqu1+(a1(i)^2)/N;
      sumofsqu2=sumofsqu2+(a2(i)^2)/N;
      sumofsqu3=sumofsqu3+(a3(i)^2)/N;
      sumofsqu4=sumofsqu4+(a4(i)^2)/N;
    end

    var1=sumofsqu1-(sum1^2);
    var2=sumofsqu2-(sum2^2);
    var3=sumofsqu3-(sum3^2);
    var4=sumofsqu4-(sum4^2);
    
    disp(sum1); disp(sum2); disp(sum3); disp(sum4);
    disp(var1); disp(var2); disp(var3); disp(var4);
    
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
    
    xMax=10;
    delta_x=0.05;
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C2=0;
        z2=0;
        for i = 1 : N            
            if ((a2(i)<=x))
                C2=C2+1;
                if(a2(i)>x-delta_x)
                    z2=z2+1;
                end
            end            
        end
        Prob2(j)=C2/N;
        prob2(j)=z2/N;
        j=j+1;
    end
    
    xMax=10;
    delta_x=0.05;
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C3=0;
        z3=0;
        for i = 1 : N            
            if ((a3(i)<=x))
                C3=C3+1;
                if(a3(i)>x-delta_x)
                    z3=z3+1;
                end
            end            
        end
        Prob3(j)=C3/N;
        prob3(j)=z3/N;
        j=j+1;
    end
    
    xMax=10;
    delta_x=0.05;
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C4=0;
        z4=0;
        for i = 1 : N            
            if ((a4(i)<=x))
                C4=C4+1;
                if(a4(i)>x-delta_x)
                    z4=z4+1;
                end
            end            
        end
        Prob4(j)=C4/N;
        prob4(j)=z4/N;
        j=j+1;
    end
    
    xxasis=linspace(0,xMax-9.98,j-1);
    
    figure
    plot( xxasis,Prob1,'k*',  xxasis,Prob2,'r.',  xxasis,Prob3,'g*',  xxasis,Prob4,'b.')
    legend('theta1=1, k1=0.5','theta2=1, k2=1.0','theta3=1,k3=1.5','theta4=1,k4=5');
    
    figure
    plot( xxasis,prob1,'k*',  xxasis,prob2,'r.',  xxasis,prob3,'g*',  xxasis,prob4,'b.')
    legend('theta1=1, k1=0.5','theta2=1, k2=1.0','theta3=1,k3=1.5','theta4=1,k4=5')

end
