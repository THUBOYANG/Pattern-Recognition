%������ѹ�����й�������Ҳ����ԭ���ݣ�
%������ʱSVMѵ������
data=[X,Y];
%����ÿ����������Y�����ϵ��
coef=zeros(1000,1);
for i=1:1000
    co=corrcoef(X(:,i),Y);
    coef(i)=abs(co(1,2));
end
[coef,index]=sort(coef,'descend');
newX=zeros(400,10);
for i=1:10
    newX(:,i)=X(:,index(i));
    index(i)
end
newdata=[newX,Y];
%����ȡ�����������ù�������SVM���࣬�������ҵ����

