%% Author: Hong Zhao
%% Date: 2016-5-16 20:58
% Lowest common ancestor precision (P_LCA), Recall(R_LCA), and F1(F_LCA)
% measures.
% These measures use the concept of the lowest comm ancestor(LCA) as
% defined in graph theory(Aho Et al.1973)
%% Example1:
% tree=[0,0;1,1;1,1;2,2;2,2;2,2];
% label_test = 4;
% label_predict = 6;
% [P_LCA,R_LCA,F_LCA]  = EvaHier_HierarchicalLCAPrecisionAndRecall(label_test,label_predict,tree); 
%% Example 2:
% clear;clc;
% tree=[0,0;1,1;1,1;2,2;2,2;2,2];
% label_test = [4 4];
% label_predict = [4 4];
% [P_LCA2,R_LCA2,F_LCA2]  = EvaHier_HierarchicalLCAPrecisionAndRecall(label_test,label_predict,tree);
%% Example 3:
% clear;clc;
% tree=[0,0;1,1;1,1;2,2;2,2;3,2;6,3;6,3];
% label_test = [4];
% label_predict = [8];
% [PH2, RH2, FH2] = EvaHier_HierarchicalLCAPrecisionAndRecall(label_test,label_predict,tree);

function [P_LCA,R_LCA,F_LCA] = EvaHier_HierarchicalLCAPrecisionAndRecall( label_test,label_predict,tree )
    sumP_LCA = 0; % precision
    sumR_LCA = 0; % Recall
    sumF_LCA = 0; % F1 measures.
    
    lengthTest = length(label_test);
    for i = 1:lengthTest
        yTest = tree_Ancestor(tree,label_test(i),1);
        yPredict = tree_Ancestor(tree,label_predict(i),1);
        temp = yTest(ismember(yTest,yPredict));
        P_LCA = 1 / (length(yPredict) - length(temp) + 1);        
        R_LCA = 1 / (length(yTest) - length(temp) + 1);        
        F_LCA = 2 * P_LCA * R_LCA / (P_LCA + R_LCA);        
        sumP_LCA = sumP_LCA + P_LCA;
        sumR_LCA = sumR_LCA + R_LCA;
        sumF_LCA = sumF_LCA + F_LCA;
    end
    P_LCA = sumP_LCA / lengthTest;
    R_LCA = sumR_LCA / lengthTest;
    F_LCA = sumF_LCA / lengthTest;
end

