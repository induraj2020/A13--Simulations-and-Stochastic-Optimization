N=100
lamda=2
sum=0;
sumofsqu=0;
mean=0;
var=0;
Var=0;

for i=1:N
    u(i)=rand();
end

for i=1:N
    alpha=1;
    cumul=exp(-lamda);
    ajout=cumul;
    while cumul< u(i)
        ajout=ajout*lamda/alpha;
        cumul=cumul+ajout;
        alpha=alpha+1;
    end
    a(i)=alpha;
    sum=sum+a(i);
    sumofsqu=sumofsqu+(a(i)^2);
end
sumofsqu=sumofsqu/N;
mean=sum/N;
Var= sumofsqu-(mean^2);
disp(mean)
disp(Var)


%     xMax=10;
%     delta_x=0.05;
%     x=0;
%     j=1;
%     while x<=xMax
%         x=x+delta_x;
%         C=0;
%         Cd=0;
%         for i=1:N                   % for N which is 1000 values, so we have prob divided by N           
%             if ( a(i) <= x )
%                 C=C+1;
%                 if ( a(i) > x-delta_x)
%                     Cd=Cd+1;
%                 end
%             end            
%         end
%         Prob(j)=C/N;
%         Den(j)=Cd/N;
%         j=j+1;
%     end
%    figure;
%    plot(1:j-1,Prob,'r*');
%    title 'Prob Function';
%    figure;
%    plot(1:j-1,Den,'b*');