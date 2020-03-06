N=10000;
sum=0;
n=30;
exy=0;
sumofsqu1=0;
for i=1:N
    sum=0;
    for k=1:n
        u(k)=rand();
        sum=sum+u(k)/n;
    end
    mean=sum;
    y(i)= sqrt(12*n)*(mean-0.5);
    exy=exy+(y(i)/N);
    sumofsqu1=sumofsqu1+(y(i)*y(i))/N;
end
fprintf('practical mean is');
disp(exy);
var=sumofsqu1-exy^2;
fprintf('practical variance is');
disp(var);

%a= abs(exy1-bench) < 1e2*eps(min(abs(exy1),abs(bench)))

    xMax=5;
    delta_x=0.1;
    
    x=-xMax;
    j=1;
    disp(length(y))
    while x <= xMax
        x=x+delta_x;
        C=0;
        C1=0;
        for i = 1 : N            
            if ( y(i) <= x )
                C=C+1;
                if(y(i)>x-delta_x)
                    C1=C1+1;
                end
            end            
        end
        Prob(j)=C/N;
        Prob1(j)=C1/N;
        j=j+1;
    end
   
    
    figure;
    plot(1:j-1,Prob,'*');
    figure;
    plot(-j/2+1:j/2-1,Prob1,'*');