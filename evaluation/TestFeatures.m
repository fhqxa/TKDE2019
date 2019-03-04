%% Test the selected features of each node
clear;clc;close all;
load DDTrainfeature;%features
load DDTest; %dataset
[X, Y] = creatSubTablezh(data_array, tree);
internalNodes = tree_InternalNodes(tree);
indexRoot = tree_Root(tree);% The root of the tree
noLeafNode =[internalNodes;indexRoot];
numFolds =10;
begin1= 48;step1 = 8;end1 = 24;%Test 48, 40, 32, 24 features respectively.
k=1;
for j=begin1:-step1:end1
    accuracyMean_selected(k,1)= j;
    accuracyStd_selected(k,1)=j;
    ii=2;
    for i = 1:length(noLeafNode)
        x=X{noLeafNode(i)};
        feature_slct = feature{noLeafNode(i)};
        feature_slct = feature_slct(1:j);
        x = x(:,feature_slct);
        y = Y{noLeafNode(i)};
        indices = crossvalind('Kfold',length(y),numFolds);
        [accuracyMean_selected(k,ii),accuracyStd_selected(k,ii)] = Kflod_multclass_svm_testParameters([x,y],numFolds,1,indices,tree);
        fprintf(['A0.1--Accurate rate:',num2str(accuracyMean_selected(k,ii)),'¡À', num2str(accuracyStd_selected(k,ii)),'\n']);%12.5954£¬12.8267£¬12.2982£¬15.0538£¬11.5385
        ii=ii+1;
    end
    k=k+1;
end

