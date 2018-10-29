%先载入压缩包中工作区（也就是原数据）
%不处理时SVM训练集合
data=[X,Y];
%考虑每个特征列与Y的相关系数
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
%对提取出的新数据用工具箱中SVM分类，结果见作业报告

