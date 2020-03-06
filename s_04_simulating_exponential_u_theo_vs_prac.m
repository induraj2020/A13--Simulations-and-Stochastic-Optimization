
                % finding mean and variance for exponential distribution
                % with teta =2
    N=1000;            
    sum=0;
    sumofsqu=0;         % mean is given by 1/lamda, variance = 1/lamda^2
    mean=0;
    var=0;
    theta=2;
%     texu=0;
%     tsumofsqu=0;
%     tvar=0;
%     % theoretical         %% theoretical will never work! you will have
%     to calculate this by hand by using the mean=1/lamda and
%     variance=1/lamda^2 formula
%     cumul=theta;
%     ajout=0;
%     ajout=cumul;
%     for j=1:N;
%         t(j)= theta*exp(-theta*j);
%         ajout=ajout+t(j);
%         tsumofsqu=tsumofsqu+(j^2*t(j));
%     end  
% 
%      texu= ajout;
%      tvar=tsumofsqu-(texu^2);
%      fprintf('theoretical exp is %f ; theoretical var is %f \n', texu,tvar);
    
    % practical %
    for i=1:N
      u(i)=rand();
      a(i)=-log(1-u(i))/theta;
      sum=sum+a(i);
      sumofsqu=sumofsqu+(a(i)^2);
    end
    mean=sum/N;
    sumofsqu=sumofsqu/N;
    var=sumofsqu-(mean^2);
    fprintf('practical exp is %f ; practical var is %f \t', mean,var);

