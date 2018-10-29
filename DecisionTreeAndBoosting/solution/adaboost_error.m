function e = adaboost_error(X, y, j, a, d, c)
% adaboost_error: ����AdaBoost�������Ĵ�����
% 
% ����
%     X     : n * p ����,ÿһ����һ������
%     y     : n * 1 ������ÿһ����һ����ǩ
%     j     : M * 1 ����, ��ѡ������ά��
%     a     : M * 1 ����, ��ѡ����ֵ
%     d     : M * 1 ����, 1 �� -1
%     c     : M * 1 ����, ��������Ȩ��
%
% ���
%     e     : ������      

%%% �벹ȫ���� %%%
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


%%% �벹ȫ���� %%%
end