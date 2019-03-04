%% Top-down prediction
% Written by Yu Wang 
% Modified by Hong Zhao
% 2017-4-11
%% Inputs:
% input_data: training data without labels
% model: 
% tree: the tree hierarchy
%% Output

function [predict_label] = FS_topDownSVMPrediction(input_data, model, tree, feature,numberSel)
    
    [m,~]=size(input_data);
    root = find(tree(:,1)==0);     
	for j=1:m%The number of samples
%% �ȴ�������ʼ
        selFeature = feature{root}(1:numberSel);
         [currentNode] = svmpredict(input_data(j,end),input_data(j,selFeature), model{root},'-q');
  
%         [~,~,d_v] = predict(1,sparse(input_data(j,selFeature)), model{root}, '-b 1 -q');%��һ������û�����á�
%         currentNode=model{root}.Label(currentNodeID) ;
    %% �ݹ�����м��ֱ��Ҷ�ӽ��
       while(~ismember(currentNode,tree_LeafNode(tree)))
          selFeature = feature{currentNode}(1:numberSel);
          [currentNode] = svmpredict(input_data(j,end),input_data(j,selFeature), model{currentNode},'-q');
%           [~,~,d_v] = predict(1,  sparse(input_data(j,selFeature)),  model{currentNode}, '-b 1 -q');
%           [~,currentNodeID] = max(d_v);
%           currentNode=model{currentNode}.Label(currentNodeID);
        end
        predict_label(j)=currentNode;        
    end %%endfor    
end
