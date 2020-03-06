function [ ] = s_22_convergence_of_normal_gau_dis_both_together( )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
N=10000;
sum=0;
n=50;
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


N=10000;
exx=0;
exy=0;
sqx=0;
sqy=0;
varx=0;
vary=0;
k=1;
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
        exx=0;
        exy=0;
        sqx=0;
        sqy=0;
        varx=0;
        vary=0;
        while k<=N
            u1=rand();
            u2=rand();
            v1=2*u1-1;
            v2=2*u2-1;
            s=(v1*v1)+(v2*v2);
            if(s<=1)
                X(k)=sqrt((-2*log(s))/s)*v1;
                y(k)=sqrt((-2*log(s))/s)*v2;
                exx=exx+X(k)/N;
                sqx=sqx+(X(k)*X(k))/N;
                exy=exy+y(k)/N;
                sqy=sqy+(y(k)*y(k))/N;
                k=k+1;
            end
        end
            varx=sqx-exx^2;
            vary=sqy-exy^2;
            %a=(abs(round(exx,4))< benchmark) && (abs(round(exy,4)) < benchmark);
            %b= abs(round(exy,4)) < varbenchmark;
            %a=abs(exy-benchmark) < 1e4*eps(min(abs(exy),abs(benchmark)));
            z=z+1;
            exaray_pol1(z)= abs(exx);
            exaray_pol2(z)= abs(exy);
            varary_pol1(z)=abs(varx);
            varary_pol2(z)=abs(vary);
    end
    main_coun=main_coun+1;
    
end

figure;
plot(exaray,'b');
hold on;
plot(exaray_pol1,'r');
hold on;
plot(exaray_pol2,'y');
title('the mean_convergence of normal vs polar')
legend('blue-normal gausian','red-polarcoordinate','yellow-polarcoordinate')
%title('convergence of normal vs polar')
%legend('red-normal by polar coordinate')
hold off;

              %don't know as why this variance plot is
              % converging so i have commented it out
% figure; 
% plot(varary,'b');
% hold on;
% plot(varary_pol1,'r');
% hold on;
% plot(varary_pol2,'y');
% title('the variance_convergence of normal vs polar')
% legend('blue-normal gausian','red-polarcoordinate','yellow-polarcoordinate')
% %title('convergence of normal vs polar')
% %legend('red-normal by polar coordinate')
% hold off;
end


