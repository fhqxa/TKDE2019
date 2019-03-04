%% Date: 2018-2-8
% 修改说明：
% 1. 针对所有数据集只选20%的特征
% 2. 分类器用SVM参数c=1线性
%% Author: Hong Zhao
clc; clear;
str1={'DD'}%;'Protein194'}%;
% str1={ 'VOC'}%; 'Cifar100'; 'ilsvrc65';  'SUN'};
m = length(str1);
lambda = 10; alpha = 1; beta = 0;
for i =1:m
%     filename = [str1{i} 'TrainSubTable']
    filename = [str1{i} 'Train'];
    load (filename);
    [X,Y]=creatSubTablezh(data_array, tree);
    %Feature selection
    tic;
    [feature] = HiFSRR02(X, Y, tree, lambda, alpha, beta, 0);
    TrainTime =toc;
    %Test feature batch
   testFile = [str1{i}, 'Test.mat']
   load (testFile);
   [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatch(data_array, tree, feature);
%     [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatchDD(data_array, tree, feature);
  %  filename=['HIFSRRSVM ' str1{i}];
  %  save(filename, 'lambda','alpha','beta' , 'accuracyMean', 'accuracyStd', 'F_LCAMean', 'FHMean', 'TIEmean', 'TrainTime', 'feature', 'TestTime');
end

% clc; clear;
%
%str1={'DD'; 'Protein194'; 'VOC'; 'CLEF'; 'Cifar100'; 'ilsvrc65';  'SUN'};
% alpha = 1;
% beta = 0;
% m = length(str1); % You can test all Dataset by changing m=6.
% for i = 1:m
%     filename = [str1{i} 'TrainSubTable']
%     load (filename);
%     %Feature selection
%     tic;
%     [feature] = HiFSRR02(X, Y, tree, lambda, alpha, beta, 0);
%     %     [feature] = HiFSRR02(X, Y, tree, lambda, alpha, beta, 0);
%     TrainTime =toc;
%     %Test feature batch
%     testFile = [str1{i}, 'Test.mat']
%     load (testFile);
%         [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatch(data_array, tree, feature);
% %     [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatchDD(data_array, tree, feature);
%     filename=['HIFSRRSVMpar ' str1{i}];
%     save(filename, 'lambda','alpha','beta' , 'accuracyMean', 'accuracyStd', 'F_LCAMean', 'FHMean', 'TIEmean', 'TrainTime', 'feature', 'TestTime');
% end
% %
% %str1={'DD'; 'Protein194'; 'VOC'; 'CLEF'; 'Cifar100'; 'ilsvrc65'; 'SUN'};
% alpha = 0;
% beta = 1;
% m = length(str1); % You can test all Dataset by changing m=6.
% for i = 1:m
%     filename = [str1{i} 'TrainSubTable']
%     load (filename);
%     %Feature selection
%     tic;
%     [feature] = HiFSRR02(X, Y, tree, lambda, alpha, beta, 0);
%     TrainTime =toc;
%     %Test feature batch
%     testFile = [str1{i}, 'Test.mat']
%     load (testFile);
%         [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatch(data_array, tree, feature);
% %     [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatchDD(data_array, tree, feature);
%     filename=['HIFSRRSVMsib ' str1{i}];
%     save(filename, 'lambda','alpha','beta' , 'accuracyMean', 'accuracyStd', 'F_LCAMean', 'FHMean', 'TIEmean', 'TrainTime', 'feature', 'TestTime');
% end
% %
% %str1={'DD'; 'Protein194'; 'VOC'; 'CLEF'; 'Cifar100'; 'ilsvrc65';  'SUN'};
% alpha = 1;
% beta = 1;
% m = length(str1); % You can test all Dataset by changing m=6.
% for i = 1:m
%     filename = [str1{i} 'TrainSubTable']
%     load (filename);
%     %Feature selection
%     tic;
%     [feature] = HiFSRR02(X, Y, tree, lambda, alpha, beta, 0);
%     TrainTime =toc;
%     %Test feature batch
%     testFile = [str1{i}, 'Test.mat']
%     load (testFile);
%         [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatch(data_array, tree, feature);
% %     [accuracyMean, accuracyStd, F_LCAMean, FHMean, TIEmean, TestTime] = HierSVMPredictionBatchDD(data_array, tree, feature);
%     filename=['HIFSRRSVMfam ' str1{i}];
%     save(filename, 'lambda','alpha','beta' , 'accuracyMean', 'accuracyStd', 'F_LCAMean', 'FHMean', 'TIEmean', 'TrainTime', 'feature', 'TestTime');
% end