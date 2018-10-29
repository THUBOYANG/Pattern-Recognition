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
for i=983:1991
    YTest(i)=-1;%-1表示数字为9
end
for i=1:5832
    YTrain(i)=1;%1表示数字为4
end
for i=5833:11781
    YTrain(i)=-1;%-1表示数字为9
end
Train=[YTrain,XTrain];
Train=Train(randperm(11781,500),:);
Xtrain=Train(:,2:785);
ytrain=Train(:,1);
Xtest=XTest;
ytest=YTest;
[trainErr, testErr] = adaboost(Xtrain, ytrain, Xtest, ytest, 30)
tr30=[trainErr testErr];
save('tr30.mat','tr30')