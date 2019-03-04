% return the descendent of node i
% every entry in tree points to its parent
% e.g. tree(i) = p, means node i's parent is p
% root is node 1, and root points to 0
function [ D ] = tree_Descendant( varargin )
tree = varargin{1};
tree = tree(:,1);
i = varargin{2};
if(length(varargin)==3)
    self = varargin{3};
else
    self = 0;
end
D = [];
if (self)
    D(1) = i;
end

nodes = [];
nnodes = [];
nodes(1) = i;
while (nodes~=0)
    nnodes = [];
    for k = 1 : length(nodes)
        nnodes = [nnodes; find(tree==nodes(k))];
    end
    D = [D; nnodes];
    nodes = nnodes;
end

