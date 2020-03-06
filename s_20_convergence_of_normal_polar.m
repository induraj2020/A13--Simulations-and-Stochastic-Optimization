function [exaray_pol1,exaray_pol2,varary_pol1,varary_pol2] = s_20_convergence_of_normal_polar( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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
            a=(abs(round(exx,4))< benchmark) && (abs(round(exy,4)) < benchmark);
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
plot(exaray_pol1,'r');
title('convergence of normal vs polar')
legend('red-normal by polar coordinate')
hold off;
end

