N=1000;
exu=0;
squexp=0;               %%dont forget to arrange the x and p
x=[0.8 1.4 2.5 3 3.6 4.5 5.5 6 6.5 7];
p=[0.09 0.01 0.2 0.08 0.02 0.1 0.1 0.03 0.07 0.3];
z=length(x);

for i=1:z
   exu=exu+(x(i)*p(i));
   squexp= squexp+(x(i)*x(i)*p(i));
end
var=squexp-exu^2;
fprintf('Theoretical mean is');
disp(exu);
fprintf('Theoretical variance is');
disp(var);

% theoretical vs practical %
y=length(p);

% for i=1:N
%     u(i)=rand();
% end

a=[];
sumP =[];
sumP(1)=p(1);
for i= 2:y
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
    a(j)=x(i);
    sum=sum+a(j)/N;
    sumsqu=sumsqu+(a(j)*a(j)/N);
end
fprintf('practival mean is');
disp(sum)
var=sumsqu-sum^2;
fprintf('practival variance is');
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
    plot(xxasis,Prob,'*');
    title('cdf');
    figure;
    plot(xxasis,prob,'*');
    title('pdf');
  
