[COEFF,SCORE,latent]=princomp(trainX);
trainX2=SCORE(:,1:2);
trainmatrix1=COEFF(:,1:2);
[row1,col1]=size(testX);
meantestX1=mean(testX);
normtestX1=testX-repmat(meantestX1,[row1,1]);
testX2=normtestX1*trainmatrix1;
%b可视化
figure;hold on;
scatter(trainX2(1:604,1),trainX2(1:604,2),'g')
scatter(trainX2(605:1303,1),trainX2(605:1303,2),'y')
scatter(trainX2(1304:1890,1),trainX2(1304:1890,2),'b')
scatter(trainX2(1891:2548,1),trainX2(1891:2548,2),'r')
scatter(trainX2(2549:3145,1),trainX2(2549:3145,2),'p')
hold off;
figure; hold on;
scatter(testX2(1:75,1),testX2(1:75,2))
scatter(testX2(76:167,1),testX2(76:167,2))
scatter(testX2(168:265,1),testX2(168:265,2))
scatter(testX2(266:357,1),testX2(266:357,2))
scatter(testX2(358:472,1),testX2(358:472,2))
hold off;
%c选择降的维数
choose=cumsum(latent)./sum(latent);
%找到choose中比0.95大的位置，大约取133维即可
trainXpca=SCORE(:,1:133);
trainmatrix=COEFF(:,1:133);
[row,col]=size(testX);
meantestX=mean(testX);
normtestX=testX-repmat(meantestX,[row,1]);
testXpca=normtestX*trainmatrix;
%合成待测试矩阵，利用工具箱SVM分类
trainpca=[trainXpca,trainY];
%svm在test集合上表现
sum(trainedClassifierpca.predictFcn(testXpca)==testY)/472
%不处理的训练集
train=[trainX,trainY];
%表现
sum(trainedClassifier.predictFcn(testX)==testY)/472