Data=load('F:\\清华大学生活\\大三下\\模式识别基础\\第二次作业\\Breast_Cancer_Wisconsin_data.txt');
Index=Data(:,2:10);
Class=Data(:,11);
Class=Class/2-1;

%全局变量初始化
risk1=zeros(3,1);
risk2=zeros(3,1);
err1=zeros(3,1);
presentage1=zeros(3,1);
err2=zeros(3,1);
presentage2=zeros(3,1);

for k=1:3  %第四问要求循环3次
a=zeros(699,1);
for i=1:699
    a(i)=i;
end
b=randperm(699,489);
XTrain=Index(b,1:9);
YTrain=Class(b);
c=setdiff(a,b);
XTest=Index(c,1:9);
YTest=Class(c);

ntrain=489;
num1=ntrain-sum(YTrain);
num2=sum(YTrain);
m1=zeros(1,9);
m2=zeros(1,9);
for i=1:ntrain
    if YTrain(i)==0
        m1=m1+XTrain(i,:)/num1;
    else
        m2=m2+XTrain(i,:)/num2;
    end
end
S1=zeros(9,9);
S2=zeros(9,9);
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

pzen1=zeros(3001,1);
pzen2=zeros(3001,1);
s=1;
for x0=-25:0.01:5
    pzen1(s)=parzen(num1,x,x0);
    pzen2(s)=parzen(num2,y,x0);
    s=s+1;
end
x0=[-25:0.01:5];
plot(x0,pzen1,'b-',x0,pzen2,'g-')

%第二问
f=zeros(210,1);
p1=zeros(210,1);
p2=zeros(210,1);
Ypre=zeros(210,1);
for i=1:210
    f(i)=XTest(i,:)*w;
    p1(i)=(num1/ntrain)*parzen(num1,x,f(i));
    p2(i)=(num2/ntrain)*parzen(num2,y,f(i));
    if p1(i)>p2(i)
        Ypre(i)=0;
    else
        Ypre(i)=1;
    end
    if YTest(i)>Ypre(i)
        risk1(k)=risk1(k)+10;
    elseif YTest(i)<Ypre(i)
        risk1(k)=risk1(k)+1;
    else
        risk1(k)=risk1(k);
    end
end
err1(k)=sum(abs(YTest-Ypre));
presentage1(k)=err1(k)/210;

%第三问
for i=1:210
    if p1(i)>p2(i)*10
        Ypre(i)=0;
    else
        Ypre(i)=1;
    end
    if YTest(i)>Ypre(i)
        risk2(k)=risk2(k)+10;
    elseif YTest(i)<Ypre(i)
        risk2(k)=risk2(k)+1;
    else
        risk2(k)=risk2(k);
    end
end
err2(k)=sum(abs(YTest-Ypre));
presentage2(k)=err2(k)/210;
end
presentage1=presentage1
presentage2=presentage2
risk1=risk1
risk2=risk2



        