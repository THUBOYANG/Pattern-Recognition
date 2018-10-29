function [j, a, d] = decision_stump(X, y, w)
% 优化决策树桩的参数
% 
%
% 输入
%     X : n * p 矩阵, 每一行是一个样本
%     y : n * 1 向量, 每一行是一个标签
%     w : n * 1 向量, 权重
%
% 输出
%     j : 最优的维度
%     a : 最优的阈值
%     d : 最优的d，-1或者+1

% 请注意优化代码
%%% 请补全代码 %%%
e=1;
j=0;
a=0;
d=0;
for j0=1:size(X,2)
    for a0=1:255
        for d0=-1:2:1
            if (decision_stump_error(X, y, j0, a0, d0, w)<=e)
                e=decision_stump_error(X, y, j0, a0, d0, w);
                j=j0;
                a=a0;
                d=d0;
            end
        end
    end
end
%%% 请补全代码 %%%
end