%% Author: Hong Zhao
%% Date: 2016-5-16
%% Example 1:
% tree=[0,0;1,1;1,1;2,2;2,2;2,2];
% label_test = [4];
% label_predict = [3];
% [PH1, RH1, FH1] = EvaHier_HierarchicalPrecisionAndRecall(label_test,label_predict,tree); 
%% Example 2:
% clear;clc;
% tree=[0,0;1,1;1,1;2,2;2,2;2,2];
% label_test = [4 4];
% label_predict = [4 4];
% [PH2, RH2, FH2] = EvaHier_HierarchicalPrecisionAndRecall(label_test,label_predict,tree);
%% Example 3:
% clear;clc;
% tree=[0,0;1,1;1,1;2,2;2,2;3,2;6,3;6,3];
% label_test = [4];
% label_predict = [8];
% [PH2, RH2, FH2] = EvaHier_HierarchicalPrecisionAndRecall(label_test,label_predict,tree);
function [PH, RH, FH] = EvaHier_HierarchicalPrecisionAndRecall( label_test,label_predict,tree )
%% ����Ԥ������������еĽṹ�������С�
%% ��ȷ�� PH��
    sumPH = 0;
    sumRH = 0;
    sumFH = 0;
    lengthTest = length(label_test);
    for i = 1:lengthTest
        yTest = tree_Ancestor(tree,label_test(i),1);%���һ������1�Ǵ�������Լ��������0�򲻰����Լ� 
        yPredict = tree_Ancestor(tree,label_predict(i),1);
        temp = yTest(ismember(yTest,yPredict) == 1);
        PH = length(temp) / length(yPredict);
        RH = length(temp) / length(yTest);
        FH = 2 * PH * RH / (PH + RH);
        sumPH = sumPH + PH;
        sumRH = sumRH + RH;
        sumFH = sumFH + FH;
    end
    PH = sumPH / lengthTest;
    RH = sumRH / lengthTest;
    FH = sumFH / lengthTest;

end

