load('F:\\�廪��ѧ����\\������\\ģʽʶ�����\\��������ҵ\\MNIST');
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
    YTest(i)=1;%1��ʾ����Ϊ4
end
for i=983:1991
    YTest(i)=-1;%-1��ʾ����Ϊ9
end
for i=1:5832
    YTrain(i)=1;%1��ʾ����Ϊ4
end
for i=5833:11781
    YTrain(i)=-1;%-1��ʾ����Ϊ9
end
Train=[YTrain,XTrain];
Test=[YTest,XTest];
%Ԥ�����ȷ��
sum(trainedClassifier.predictFcn(XTest)==YTest)/1991
sum(trainedClassifier1.predictFcn(XTest)==YTest)/1991
sum(trainedClassifier2.predictFcn(XTest)==YTest)/1991
sum(trainedClassifier3.predictFcn(XTest)==YTest)/1991
sum(trainedClassifier4.predictFcn(XTest)==YTest)/1991
sum(trainedClassifier5.predictFcn(XTest)==YTest)/1991