% 10-fold cross for mult-class.
%% Parameters:
%  data - The matrix of input vectors, one per row.
%  numFolds - The number of Fold.
% Returns:
%   The accuracy.
% $Author: HongZhao $          $Date: 2015/12/17 11:29 $    $Revision: 2.0 $
% 2016-7-18
%% Exapmle:
% load data4_vocTest;
% [m,n]=size(data_array);
% X = data_array(:,1:n-1);
% y = data_array(:,n);
% numFolds = 10;
% parameter = 10;
% [predict_label,accuracyMean, accuracyStd] = Kflod_multclass_svm_testParameters(X, y, numFolds,parameter,indices);
%[predict_label,accuracyMean, accuracyStd] = Kflod_multclass_svm_testParameters(data_array, numFolds,parameter,indices)
%%
function [accuracyMean, accuracyStd,F_LCA] = Kflod_multclass_svm_testParameters(varargin)
if(length(varargin)==5)
    data = varargin{1};
    numFolds = varargin{2};
    parameter = varargin{3};
    indices = varargin{4};
    tree = varargin{5};
else
    if(length(varargin)==6)
        data = [varargin{1},varargin{2}];
        numFolds = varargin{3};
        parameter = varargin{4};
        indices = varargin{5};
        tree = varargin{6};
    end
end
[M,N]=size(data);
accuracy_k = zeros(1,numFolds);
for k = 1:numFolds
    test = (indices == k);
    train = ~test;
    test_data = data(test,1:N-1);
    test_label = data(test,N);
    train_data = data(train,1:N-1);
    train_label = data(train,N);
    
    str=['-c ' num2str(parameter) ' -t 0 -q'];
    model = svmtrain(train_label,train_data, str);
    [predict_label, accuracy, dec_values] = svmpredict(test_label,test_data, model);
    [P_LCA ,R_LCA ,F_LCA ] = EvaHier_HierarchicalLCAPrecisionAndRecall( test_label,predict_label,tree );
    accuracy_k(k) = accuracy(1);
    F_LCA_k(k)=F_LCA ;
end
accuracyMean = mean(accuracy_k);
accuracyStd = std(accuracy_k);
F_LCA = mean(F_LCA_k);
end
