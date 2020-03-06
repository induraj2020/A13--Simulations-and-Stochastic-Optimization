
            % finding the cummulative distributive function for exponential
            % distribbution with teta=0.5
    N=10000;
    theta = 0.5;
    C=0;
        
    for i = 1 : N
      u(i) = rand();                            % different Fx(x) is randomly generated
      a(i) = -log(1-u(i))/theta;                % different random variable x1,x2,x3... are generated
    end
    
    xMax=10;
    delta_x=0.05;
    
    x=0;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C=0;
        for i = 1 : N            
            if ( a(i) <= x )
                C=C+1;
            end            
        end
        Prob(j)=C/N;
        j=j+1;
    end
    xxasis=linspace(0,xMax,200);
    plot(xxasis,Prob)
%     plot(1:j,Prob,'*');
