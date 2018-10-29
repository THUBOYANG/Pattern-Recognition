function e = adaboost_error(X, y, j, a, d, c)
% adaboost_error: 返回AdaBoost分类器的错误率
% 
% 输入
%     X     : n * p 矩阵,每一行是一个样本
%     y     : n * 1 向量，每一行是一个标签
%     j     : M * 1 向量, 所选的特征维度
%     a     : M * 1 向量, 所选的阈值
%     d     : M * 1 向量, 1 或 -1
%     c     : M * 1 向量, 分类器的权重
%
% 输出
%     e     : 错误率      

%%% 请补全代码 %%%
M=size(j,1);
n=size(X,1);
puse=sum(j~=0);
error=zeros(n,1);
e=0;
for i=1:n
    su=0;
    for s=1:puse
        su=su+c(s)*((X(i,j(s)) <= a(s)) - 0.5) * 2 * d(s);
    end
    error(i)=(sign(su)~=y(i));
end
e=sum(error)/n;


%%% 请补全代码 %%%
end