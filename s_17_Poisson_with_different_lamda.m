lamda1 =3;       % for different values of lamda the pdf curve is changing
lamda2 =6;
lamda3= 10;

n=100;
j=0;
exu=0;
squ=0;
var=0;

%p(j)=0;
for i=1:n
    numerator1 = exp(-lamda1)*(lamda1^i);
    numerator2 = exp(-lamda2)*(lamda2^i);
    numerator3 = exp(-lamda3)*(lamda3^i);
    denominator = factorial(i);
    p1(i)=numerator1/denominator;
    p2(i)=numerator2/denominator;
    p3(i)=numerator3/denominator;
end
for i=1:n
    sum1(i)=0;
    sum2(i)=0;
    sum3(i)=0;
end
 for i=1:n
    sum1(i)=p1(i)+sum1(i);
    sum2(i)=p2(i)+sum2(i);
    sum3(i)=p3(i)+sum3(i);
 end
figure
hold on;
plot(sum1(1:30),'r');
plot(sum2(1:30),'b');
plot(sum3(1:30),'y');

% s=0;
% delta_x=0.05;
% for i=1:n
%     while (p1(i)<=i+delta_x)
%         s(i)=p1(i);
%     end
% end
% figure;
% plot(s,'r')
