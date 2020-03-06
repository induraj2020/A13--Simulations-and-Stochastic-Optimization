function P=s_18_Binomial_Discrete_Cum_PMF_gust()
% PMF f(k) p1(k)=(lambda^k)*exp(-lambda)/k!;
% Cumulative is CUM array

    
    n=20;    
    p=0.5;
    
    for k=0:n
        j=k+1; %Because Matlab dont accept index 0
        xk(j)=j; % Consider the integer like the value of xk
        ArrangeKN = factorial(n)/(factorial(k)*factorial(n-k));
        p1(j)= ArrangeKN * p^k * (1-p)^(n-k);      % ncx p^x q^(n-x)
        if k==0
            cum1(j)=p1(j);
        else
            cum1(j)=cum1(j-1)+p1(j);
        end
    end
    
    %Create N random variables;
    N=1000;
    for i=1:N
        u(i)=rand();
    end
    
    for j=1:N
       i=1;
       while ( u(j) > cum1(i) && i < length(p1))
           i=i+1;
       end       
       a(j)=xk(i);
    end

    % Calculate Cumulative and Mass for the Random.
    xMax=20;
    delta_x=0.05;
    x=0;
    j=1;
    Exu=0;
    while x<=xMax
        x=x+delta_x;
        C=0;
        Cd=0;
        for i=1:N            
            if ( a(i) <= x )
                C=C+1;
                if ( a(i) > x-delta_x)
                    Cd=Cd+1;
                end
            end            
        end
        Cumulative(j)=C/N;
        Mass(j)=Cd/N;
        j=j+1;
    end
    
    %Expectation Value
    squu=0;
    for k=1:N        
        Exu=Exu+a(k)/N;
        squu=squu+(a(k)*a(k))/N;
    end
    Var=squu-(Exu^2);
    disp(['E[x}= ', num2str(Exu)]); % Error.
    disp(['Var[x]= ', num2str(Var)]);
    
    xAxis1=linspace(0,xMax,j-1);
    plot(xAxis1,Cumulative,'r*');
    title 'Cumulative Density Function';
    
    figure;   
    plot(Mass,'b*');
    plot(xAxis1,Mass,'b*');
    title 'Probability Density Function';

end