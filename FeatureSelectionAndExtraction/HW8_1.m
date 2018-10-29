%�ȵ���excel�����ݣ�ע�ⲻ�õ������ı�ǩ����������Ϊd
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
legend('�人','֣��','����','�ܿ�','�˳�','ʮ��','����','����')