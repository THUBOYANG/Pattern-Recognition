Data=load('F:\\清华大学生活\\大三下\\模式识别基础\\第二次作业\\Breast_Cancer_Wisconsin_data.txt');
Index=Data(:,2:10);
Class=Data(:,11);
Class=Class/2-1;
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
mean1=0;
mean2=0;
for i=1:ntrain
    if YTrain(i)==1
       mean2=mean2+(XTrain(i,:)*w)/num2;
    else
       mean1=mean1+(XTrain(i,:)*w)/num1;
    end
end
y=(num1*mean1+num2*mean2)/(num1+num2);

res=zeros(210,1);
for i=1:210
    if XTest(i,:)*w>y
        res(i)=0;
    else
        res(i)=1;
    end
end
err =sum(abs(YTest-res));
percentage2=1-err/size(XTest,1);
percentage2
        