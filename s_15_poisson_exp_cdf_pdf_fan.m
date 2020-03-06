N=1000;
var=0;
lamda=4;
Esp=0;

for i = 1:N
    alpha(i)=0;
    cumul = exp(-lamda);
    ajout=cumul;
    u=rand();                           % I changed rand(i) to rand()
    while cumul < u 
        alpha(i)=alpha(i)+1;
        ajout=ajout*lamda/alpha(i);
        cumul=cumul+ajout;
    end
    poisson=alpha(i);
    Esp=Esp+poisson/N;
    var=var+(poisson*poisson)/N;
end
var=var-Esp*Esp;
disp(Esp);
disp(var);


    xMax=10;
    delta_x=0.05;
    x=0;
    j=1;
    while x<=xMax
        x=x+delta_x;
        C=0;
        Cd=0;
        for i=1:N                   % for N which is 1000 values, so we have prob divided by N           
            if ( alpha(i) <= x )
                C=C+1;
                if ( alpha(i) > x-delta_x)
                    Cd=Cd+1;
                end
            end            
        end
        Prob(j)=C/N;
        Den(j)=Cd/N;
        j=j+1;
    end
   figure;
   plot(1:j-1,Prob,'r*');
   title 'Prob Function';
   figure;
   plot(1:j-1,Den,'b-');