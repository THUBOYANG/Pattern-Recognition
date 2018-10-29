%第1、2小问以及各种变型只需细微修改参数
n=100;
mu=zeros(3,1);
sigma=zeros(3,1);
for i=1:3
x=rand(n,1);
%x=randn(n,1);
logL = @(sita)0.5*n*log(2*pi)+n*log(sita(2))+(1/(2*sita(2)^2))*sum((x-sita(1)).^2);
sita0 = [-1,0.1];
sita = fminsearch(logL,sita0);
mu(i) = sita(1);
sigma(i) = sita(2);
end
[f, x] = ksdensity(mu(1)+sigma(1)*randn(100000,1));
[g, y] = ksdensity(mu(2)+sigma(2)*randn(100000,1));
[h, z] = ksdensity(mu(3)+sigma(3)*randn(100000,1));
[fi, r] = ksdensity(rand(100000,1));
plot(x,f,'r-',y,g,'b-',z,h,'y-',r,fi,'g-')
title('数据规模100 green-U(0,1)')