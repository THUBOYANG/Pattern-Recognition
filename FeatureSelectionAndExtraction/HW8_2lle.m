K=12;
dmax=3;
newX=[trainX' testX'];
newXlle=lle(newX,K,dmax);
newXlle=newXlle(1:2,:);
newXlle=newXlle';
trainXlle=newXlle(1:3145,:);
testXlle=newXlle(3146:3617,:);
%b可视化
figure;hold on;
scatter(trainXlle(1:604,1),trainXlle(1:604,2),'g')
scatter(trainXlle(605:1303,1),trainXlle(605:1303,2),'y')
scatter(trainXlle(1304:1890,1),trainXlle(1304:1890,2),'b')
scatter(trainXlle(1891:2548,1),trainXlle(1891:2548,2),'r')
scatter(trainXlle(2549:3145,1),trainXlle(2549:3145,2),'p')
hold off;
figure; hold on;
scatter(testXlle(1:75,1),testXlle(1:75,2))
scatter(testXlle(76:167,1),testXlle(76:167,2))
scatter(testXlle(168:265,1),testXlle(168:265,2))
scatter(testXlle(266:357,1),testXlle(266:357,2))
scatter(testXlle(358:472,1),testXlle(358:472,2))
hold off;
%c选择降的维数为3
newXlle=lle(newX,K,4);
newXlle=newXlle(1:3,:);
newXlle=newXlle';
trainXLLE=newXlle(1:3145,:);
testXLLE=newXlle(3146:3617,:);
%合成待测试矩阵，选择工具箱SVM分类器
trainlle=[trainXLLE,trainY];
%在测试集上表现
sum(trainedClassifierlle.predictFcn(testXLLe)==testY)/472
