%先导入excel中数据，注意不用导入中文标签，数据命名为d
[m,n]=size(d);
D=zeros(m,m);
for i=1:m
    for j=1:m
        D(i,j)=(norm(d(i,:)-d(j,:)))^2;
    end
end
I=eye(m);
e=ones(m,1);
J=I-(e*e')./m;
H=-0.5*J*D*J;
[p,q]=eig(H);
qsort=sqrt(q);
Y=qsort(1:2,1:2)*p(:,1:2)';
k=Y';
figure;hold on;
for i=1:8
    plot(k(i,1),-k(i,2),'x','MarkerSize',10);
end
legend('武汉','郑州','北京','周口','运城','十堰','汉中','重庆')