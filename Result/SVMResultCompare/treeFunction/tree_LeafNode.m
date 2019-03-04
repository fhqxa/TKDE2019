%% Return the index of the leaf node.
%% Author: Hong Zhao
%% Date: 2016-5-14
%% Example:
% load tree;
% leafNode = LeafNode( tree )
function [ leafNode ] = tree_LeafNode( tree )
treeParent=tree(:,1)';
lengthTree = length(treeParent);
middleNode = [];
while length(treeParent)~=0
    middleNode=[middleNode; treeParent(1)];
    label=find(treeParent==treeParent(1));
    treeParent(label)=[];
end
leafNode = 1:lengthTree;
leafNode = leafNode(ismember(leafNode,middleNode)==0);
end

