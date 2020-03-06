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

fprintf('practical mean centred at zero is');
disp(exy);
fprintf('practical variance centred at zero is');
var=sumofsqu1-exy^2;
disp(var);
    

    xMax=5;
    delta_x=0.1;
    
    x=-xMax;
    j=1;
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
    
    meux=4;                 % we calculte the random variables by transfromation
    sigx=2;
    expx=0;
    squx=0;
    varx=0;
    for h=1:N
       xx(h)= y(h)*sigx+meux;
       expx=expx+xx(h)/N;
       squx=squx+xx(h)*xx(h)/N;
    end
    varx=squx-expx^2;
    fprintf('practical mean centred at non zero is');
    disp(expx);
    fprintf('practical variance centred at non zero is');
    disp(varx);
    fprintf('practical std deviation centred at non zero is');
    disp(sqrt(varx));
    
    xMax=5;
    delta_x=0.1;
    
    x=-xMax+4;
    j=1;
    while x <= xMax+4
        x=x+delta_x;
        C=0;
        C1=0;
        for i = 1 : N            
            if ( xx(i) <= x )
                C=C+1;
                if(xx(i)>x-delta_x)
                    C1=C1+1;
                end
            end            
        end
        Prob2(j)=C/N;
        Prob12(j)=C1/N;
        j=j+1;
    end
    
    xxasis=linspace(-xMax,xMax,j-1);
    xxasis1=linspace(-xMax+4,xMax+4,j-1);
    figure;
    plot(1:j-1,Prob,'*',1:j-1,Prob2,'r*');
    figure;
    hold on;
    plot(xxasis,Prob1,'*',xxasis1,Prob12,'*');
    
