load('F:\\清华大学生活\\大三下\\模式识别基础\\神经网络作业\\MNIST');
Index4=trainX([24755:30586],:,:);
Index9=trainX([54052:60000],:,:);
Index4=reshape(Index4,5832,784);
Index9=reshape(Index9,5949,784);
XTrain=[Index4;Index9];
YTrain=zeros(11781,1);
XTest4=testX([4158:5139],:,:);
XTest9=testX([8992:10000],:,:);
XTest=[XTest4;XTest9];
XTest=reshape(XTest,1991,784);
YTest=zeros(1991,1);
for i=1:982
    YTest(i)=1;%1表示数字为4
end
for i=1:5832
    YTrain(i)=1;%1表示数字为4
end

ntrain=11781;
num1=ntrain-sum(YTrain);
num2=sum(YTrain);
m1=zeros(1,784);
m2=zeros(1,784);
for i=1:ntrain
    if YTrain(i)==0
        m1=m1+XTrain(i,:)/num1;
    else
        m2=m2+XTrain(i,:)/num2;
    end
end
S1=zeros(784,784);
S2=zeros(784,784);
for i=1:ntrain
    if YTrain(i)==0
        S1=S1+(XTrain(i,:)-m1)'*(XTrain(i,:)-m1);
    else
        S2=S2+(XTrain(i,:)-m2)'*(XTrain(i,:)-m2);
    end
end
Sw=S1+S2;
w=inv(Sw)*(m1-m2)';
w=w/sqrt(sum(w.^2));

j=1;
r=1;
x=zeros(num1,1);
y=zeros(num2,1);
for i=1:ntrain
    if YTrain(i)==0
        x(j)=XTrain(i,:)*w;
        j=j+1;
    else
        y(r)=XTrain(i,:)*w;
        r=r+1;
    end
end
f=zeros(1991,1);
p1=zeros(1991,1);
p2=zeros(1991,1);
Ypre=zeros(1991,1);
for i=1:1991
    f(i)=XTest(i,:)*w;
    p1(i)=(num1/ntrain)*parzen(num1,x,f(i));
    p2(i)=(num2/ntrain)*parzen(num2,y,f(i));
    if p1(i)>p2(i)
        Ypre(i)=0;
    else
        Ypre(i)=1;
    end
end
err=sum(abs(YTest-Ypre));
presentage=err/1991