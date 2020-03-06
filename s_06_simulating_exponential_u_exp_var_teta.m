% finding mean and variance for exponential distribution with inverse
% transformation with teta = 0.6
    
    N=10000;
    sum=0;
    sumofsqu=0;
    mean=0;
    var=0;

    theta=0.6;
    for i=1:N
      u(i)=rand();                          % u(i) is nothing but Fx(x) CDF
      a(i)=-log(1-u(i))/theta;              % a(i) is nothing but the random variable x1,x2,x3.., here we call as a(i)
      sum=sum+a(i);
      sumofsqu=sumofsqu+(a(i)^2);
    end
    mean=sum/N;
    sumofsqu=sumofsqu/N;
    var=sumofsqu-(mean^2);
    disp(mean);
    disp(var);
