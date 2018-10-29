function pnx=parzen(N,x,x0)
pnx=0;
for i = 1:N
    pnx=pnx+exp(-(x0-x(i))^2/2)/sqrt(2*pi);
end
pnx=pnx/N;
end