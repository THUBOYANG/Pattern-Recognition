function w_update = update_weights(X, y, j, a, d, w, c)
% ����Ȩֵ
% 
% ����
%     X        : n * p ����ÿһ����һ��ѵ������
%     y        : n * 1 ������ÿһ����һ��ѵ����ǩ
%     j        : ��ѡ�������ά��
%     a        : ��ѡ��ֵ
%     d        : 1 �� -1
%     w        : n * 1 ����, ԭ����Ȩֵ
%     c        : ������������Ȩֵ
%
% Output
%     w_update : n * 1 ����, ���¹����Ȩֵ

%%% �벹ȫ���� %%%
n=size(X,1);
w_update=zeros(n,1);
    w_update=w.*exp(c*(d*2*(X(:,j)<=a)-d~=y));
w_sum=sum(w_update);
w_update=w_update/w_sum;

%%% �벹ȫ���� %%%
end