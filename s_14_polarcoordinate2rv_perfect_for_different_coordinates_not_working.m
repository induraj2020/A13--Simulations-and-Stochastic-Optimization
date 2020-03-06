%function [ output_args ] = s_14_polarcoordinate2rv_perfect( )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

N=10000;
exx=5;
exy=3;
% sqx=0;
% sqy=0;
varx=0.8;
vary=0.6;
% k=1;
% while k<=N
%     u1=rand();
%     u2=rand();
%     v1=2*u1-1;
%     v2=2*u2-1;
%     s=(v1*v1)+(v2*v2);
%     if(s<=1)
%         X(k)=sqrt((-2*log(s))/s)*v1;
%         y(k)=sqrt((-2*log(s))/s)*v2;
%         exx=exx+X(k)/N;
%         sqx=sqx+(X(k)*X(k))/N;
%         exy=exy+y(k)/N;
%         sqy=sqy+(y(k)*y(k))/N;
%         k=k+1;
%     end
%     
% end
%     varx=sqx-exx^2;
%     vary=sqy-exy^2;
%     
%     fprintf('practical mean of rv 1 is');
%     disp(exx)
%     fprintf('practical var of rv 1 is');
%     disp(varx)
%     fprintf('practical mean of rv 2 is');   
%     disp(exy)
%     fprintf('practical var of rv 2 is');
%     disp(vary)
    
    xMax=5;
    delta_x=0.1;
    
    x=-xMax;
    j=1;
    while x <= xMax
        x=x+delta_x;
        C=0;
        C1=0;
        for i = 1 : N            
            if ( X(i) <= x )
                C=C+1;
                if(X(i)>x-delta_x)
                    C1=C1+1;
                end
            end            
        end
        Prob(j)=C/N;
        Prob1(j)=C1/N;
        j=j+1;
    end
     
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
        Prob2(j)=C/N;
        Prob12(j)=C1/N;
        j=j+1;
    end
    
    xxasis=linspace(-xMax,xMax,j-1);
    xxasis1=linspace(-xMax,xMax,j-1);
    figure;
   % plot(xxasis,Prob2,'*', xxasis1,Prob12,'*');
    plot(1:j-1,Prob,'*',1:j-1,Prob2,'r*');
    figure;
    hold on;
    plot(xxasis,Prob1,'*',xxasis1,Prob12,'*');

%end





