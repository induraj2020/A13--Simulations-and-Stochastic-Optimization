
                % the mean variance all in one file for different values of
                % tetas
    N=10000;
    sum1=0;
    sum2=0;
    sumofsqu1=0;
    sumofsqu2=0;
    mean1=0;
    mean2=0;
    var1=0;
    var2=0;
    theta1=0.5;
    theta2=0.6;
    
    for i=1:N
       u(i)=rand();
       a1(i)=-log(1-u(i))/theta1;
       a2(i)=-log(1-u(i))/theta2;
       sum1=sum1+a1(i);
       sum2=sum2+a2(i);
       sumofsqu1=sumofsqu1+(a1(i)^2);
       sumofsqu2=sumofsqu2+(a2(i)^2);
    end
    
    sumofsqu1=sumofsqu1/N;
    sumofsqu2=sumofsqu2/N;
    mean1=sum1/N;
    mean2=sum2/N;
    var1= sumofsqu1- (mean1)^2;
    var2= sumofsqu2- (mean2)^2;
    
    fprintf('mean for teta of 0.5');
    disp(mean1)
    fprintf('var for teta of 0.5');
    disp(var1)
    fprintf('mean for teta of 0.6');
    disp(mean2)
    fprintf('var for teta of 0.6');
    disp(var2)
    
    figure
    hold on;
    plot(a1,u,'r.')
    plot(a2,u,'b.')
    title('as you see, if the mean arrival time is more, the rate of decay is more')
    legend('teta=0.5, e(x)=1/teta =2','teta=0.6', 'e(x)=1/teta=1.66');
    hold off;


%{
    N=10000;
    Exu1=0;
    Exu2=0;
    squu1=0;
    squu2=0;
    theta1=0.5;
    theta2=0.6;
    for i=1:N
      u(i)=rand();                          % u(i) is nothing but Fx(x) CDF
      a1(i)=-log(1-u(i))/theta1;            % a(i) is nothing but the continous random variable x1,x2,x3..
      a2(i)=-log(1-u(i))/theta2;            
      Exu1=Exu1+a1(i)/N;
      Exu2=Exu2+a2(i)/N;
      squu1=squu1+(a1(i)^2)/N;
      squu2=squu2+(a2(i)^2)/N;
    end
    Var1=squu1-(Exu1^2);
    Var2=squu2-(Exu2^2);
    
    fprintf("mean for teta of 0.5");
    disp(Exu1);
    fprintf("var for teta of 0.5");
    disp(Var1);
    fprintf("mean for teta of 0.6");
    disp(Exu2);
    fprintf("var for teta of 0.6");
    disp(Var2);
    
    plot(a1,u,'r.')
    

%}