function [j, a, d] = decision_stump(X, y, w)
% �Ż�������׮�Ĳ���
% 
%
% ����
%     X : n * p ����, ÿһ����һ������
%     y : n * 1 ����, ÿһ����һ����ǩ
%     w : n * 1 ����, Ȩ��
%
% ���
%     j : ���ŵ�ά��
%     a : ���ŵ���ֵ
%     d : ���ŵ�d��-1����+1

% ��ע���Ż�����
%%% �벹ȫ���� %%%
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
%%% �벹ȫ���� %%%
end