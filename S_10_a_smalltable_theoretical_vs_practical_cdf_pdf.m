            %finding the mean and variance for the small table given in
            %polycopy %%% clear the work space and exevute
N=1000;
exu=0;
squexp=0;
p=[0.3 0.5 0.2];

for i=1:3
   exu=exu+(i*p(i));
   squexp= squexp+(i*i*p(i));
end

var=squexp-exu^2;
fprintf('Theoretical mean is');
disp(exu);
fprintf('Theoretical Variance is');
disp(var);
%%%%%%%%%%%%%%%%% theoretical vs practival %%%%%%%%%%%%%%

a=[]; 
sumP(1)=p(1);               % function for calculating the sum of probabiliies sump(2)=sump(1)+p(2)
for i=2:length(p)
    sumP(i)=sumP(i-1)+p(i);      
end
sum=0;   
sumsqu=0;
var=0;

for j=1:N
    u(j)=rand();
    i=1;
    while (u(j)>sumP(i) && i<length(p))
       i=i+1;
    end       
       a(j)=i;
       sum=sum+a(j)/N;
       sumsqu= sumsqu+(a(j)*a(j)/N);
end
fprintf('Practical mean is');
disp(sum);
var=sumsqu-(sum^2);
fprintf('Practical variance is');
disp(var)

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
    xxasis=linspace(0,xMax,j-1);
    figure;
    %plot(xxasis,Prob,'*');
    plot(xxasis,Prob);
    title('cdf');
    figure;
    plot(xxasis,prob,'*');
    title('pdf');
  
