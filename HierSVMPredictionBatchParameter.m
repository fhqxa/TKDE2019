%% Date: 2018-2-8
% 修改说明：
% 1. 针对所有数据集只选20%的特征
% 2. 分类器用SVM参数c=1线性
function [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean] = HierSVMPredictionBatchParameter(data_array, tree, feature)
[m, numFeature] = size(data_array);
numFeature = numFeature - 1; 
numFolds  = 10;
% Test all features (baseline)
% Test 50% 40%	30%	20%	10% features.
for j = 2%1:5
    numSeleted = round(numFeature * j * 0.1);
%     accuracyMean(1, k) = numSeleted;
%     accuracyStd(1, k) = numSeleted;
%     F_LCAMean(1, k) = numSeleted;
%     FHMean(1, k) = numSeleted;
%     TIEmean(1, k) = numSeleted;
%     TestTime(1, k) = numSeleted;
    rand('seed', 1);
    indices = crossvalind('Kfold', m, numFolds);
    tic;
    [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean] = FS_Kflod_TopDownSVMClassifier(data_array, numFolds, tree, feature, numSeleted, indices);
end
end
