clear;clc;close all;
% This function can compute four algorithms simultaneously.
% HiRRfam-FS: lambda=10, alpha=1, beta=1;
% HiRRpar-FS: lambda=10, alpha=1, beta=0;
% HiRRsib-FS: lambda=10, alpha=0, beta=1;
% HiRR-FS: lambda=10, alpha=0, beta=0;
% Update date: 2018/1/31
tic
% str1={'DD'; 'Protein194'; 'VOC'; 'CLEF'; 'Cifar100'; 'ilsvrc65';  'SUN'};
str1={'DD';'Protein194'; 'VOC'; 'CLEF';'ilsvrc65';'Cifar100';'SUN'};
m = length(str1);
for ii= 7:m
    filename = [str1{ii} 'TrainSubTable']
    load (filename);
    lambda = 10;
    i=1;
    step = 13;
    for aa = -2:1:6
        alpha = 10^aa
        j=1;
        for bb = -6:1:6
            beta = 10^bb
            tempid = (i-1)*step+j;
            accuracyMean(tempid,1)=alpha;
            accuracyMean(tempid,2)=beta;
            accuracyStd(tempid,1)=alpha;
            accuracyStd(tempid,2)=beta;
            F_LCAMean(tempid,1)=alpha;
            F_LCAMean(tempid,2)=beta;
            FHMean(tempid,1)=alpha;
            FHMean(tempid,2)=beta;
            TIEmean(tempid,1)=alpha;
            TIEmean(tempid,2)=beta;
            %% Feature selection
            [feature] = HiFSRR02(X, Y, tree, lambda, alpha, beta,0);
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %% Test feature
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            testFile = [str1{ii}, 'Test.mat']
            load (testFile);
            [accuracyMean(tempid,3), accuracyStd(tempid,3), F_LCAMean(tempid,3), FHMean(tempid,3), TIEmean(tempid,3)] = HierSVMPredictionBatchParameter(data_array, tree, feature);
            j=j+1;
        end
        i=i+1;
    end
    filename=['HIFSRRSVMparameter ' str1{ii}];
    save(filename, 'accuracyMean', 'accuracyStd', 'F_LCAMean', 'FHMean', 'TIEmean','feature');
end
