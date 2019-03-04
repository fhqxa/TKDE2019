% return the sibling of node i, (including i)
% every entry in tree points to its parent
% e.g. tree(i) = p, means node i's parent is p
% root is node 1, and root points to 0
function [ S ] = tree_Sibling( tree,i )
[r,c] = find(tree(:,1)==tree(i));
S = r;
%%
S(find(S==i)) = [];
%%
end

