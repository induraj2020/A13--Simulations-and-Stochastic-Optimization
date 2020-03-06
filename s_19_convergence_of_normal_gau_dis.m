function [ exaray,varary,main_coun ] = s_19_convergence_of_normal_gau_dis( )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
N=10000;
sum=0;
n=30;
exy=0;
sumofsqu1=0;
benchmark=0.0001;
varbenchmark=1.00;
counter=0;
step=1000;
a=0;
b=0;
z=0;
times_to_run=100;
main_coun=0;
while(main_coun<times_to_run)
    while(a==0 && N~=50000)
        counter=counter+1;
        N=N+step;
        exy=0;
        var=0;
        sum=0;
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
        %exy=round(exy,4)
        %fprintf('practical mean is');
        %disp(exy);
        var=sumofsqu1-exy^2;
        %fprintf('practical variance is');
        %disp(var);
        %disp(abs(round(exy,4)))
        a=abs(round(exy,4))< benchmark;
        b= abs(round(var,4)) < varbenchmark;
        %a=abs(exy-benchmark) < 1e4*eps(min(abs(exy),abs(benchmark)));
        z=z+1;
        exaray(z)= abs(exy);
        varary(z)=abs(var);
    end
   
    main_coun=main_coun+1;
end
disp(abs(exy));
disp(var);
disp(counter);
figure;
plot(exaray,'b');
title('convergence of normal vs polar')
legend('blue-normal gausian')
hold on;
end

