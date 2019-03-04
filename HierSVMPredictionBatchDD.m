%% Date: 2018-2-8
% 修改说明：
% 1. 针对所有数据集只选10%20%30%40%50%的特征
% 2. 分类器用SVM参数c=1线性
function [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatchDD(data_array, tree, feature)
[m, numFeature] = size(data_array);
numFeature = numFeature - 1; 
numFolds  = 10;
k = 1;
baseline = 0;
% Test all features (baseline)
% Test 50% 40%	30%	20%	10% features.

% for j = 10:10:90
for j=10:10:473
    numSeleted = j;%round(numFeature * j * 0.01);
    accuracyMean(1, k) = numSeleted;
    accuracyStd(1, k) = numSeleted;
    F_LCAMean(1, k) = numSeleted;
    FHMean(1, k) = numSeleted;
    TIEmean(1, k) = numSeleted;
    TestTime(1, k) = numSeleted;
    rand('seed', 1);
    indices = crossvalind('Kfold', m, numFolds);
    tic;
    [accuracyMean(2, k), accuracyStd(2, k), F_LCAMean(2, k), FHMean(2, k), TIEmean(2, k)] = FS_Kflod_TopDownSVMClassifier(data_array, numFolds, tree, feature, numSeleted, indices);
    TestTime(2, k) = toc;
    k = k+1;
end
 if (baseline == 1)
    accuracyMean(1, k) = numFeature;
    accuracyStd(1, k) = numFeature;
    F_LCAMean(1, k) = numFeature;
    FHMean(1, k) = numFeature;
    TIEmean(1, k) = numFeature;
    TestTime(1, k) = numFeature;
    rand('seed', 1);
    indices = crossvalind('Kfold', m, numFolds);
    tic;
    [accuracyMean(2, k), accuracyStd(2, k), F_LCAMean(2, k), FHMean(2, k), TIEmean(2, k)] = FS_Kflod_TopDownSVMClassifier(data_array, numFolds, tree, feature, numFeature, indices);
    TestTime(2, k) = toc;
 end
end
