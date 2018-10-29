Data=load('F:\\�廪��ѧ����\\������\\ģʽʶ�����\\�ڶ�����ҵ\\Breast_Cancer_Wisconsin_data.txt');
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

[nsamples, nfeatures]=size(XTrain);
w0 = rand(nfeatures + 1, 1);
weight = logisticRegressionWeights( XTrain, YTrain, w0, 1000, 0.1);
res = logisticRegressionClassify(XTest,weight );

err =sum(abs(YTest-res));
percentage=1-err/size(XTest,1);
percentage
