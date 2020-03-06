function P=s_16_Poisson_Discrete_Cum_PMF_gust_using_factorials()
% PMF f(k) p1(k)=(lambda^k)*exp(-lambda)/k!;
% Cumulative is CUM array

    % Create Pk probabilies for xk using Poisson Law;
    k=15;
    lambda1=3;

    for i=0:k
        j=i+1; %Because Matlab dont accept index 0
        xk(j)=j; % Consider the integer like the value of xk
        denominator = factorial(i);
        numerator1 = (lambda1^i)*exp(-lambda1);
        p1(j)=numerator1/denominator;
        
        if i==0
            cum1(j)=p1(j);
        else
            cum1(j)=cum1(j-1)+p1(j);
        end
    end
    
   % Create N random variables;
    N=1000;
    for i=1:N
        u(i)=rand();
    end
    
    for j=1:N
       i=1;
       while ( u(j) > cum1(i) & i < length(p1))
           i=i+1;
       end       
       a(j)=xk(i);
%        if a(j)>0 
%            disp(a(j));
%        end
    end
%      disp(xk);
%      disp(p1);    
%     disp(cum1);   
%     disp(u);    
%     disp(a);

    % Calculate Cumulative and Mass for the Random.
    xMax=10;
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
%         Exu=Exu+x*Mass(j);
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
    plot(xAxis1,Mass,'b*');
    title 'Probability Density Function';


end