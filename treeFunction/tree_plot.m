function tree_plot(tree)
% dataFile = importdata(dataSet);
% tree = dataFile.tree;
treeMod = tree(:,1)';
treeplot(treeMod);
len = size(treeMod,2);
[x,y] = treelayout(treeMod);
x = x';
y = y';
node = cellstr(num2str((1:len)'));
text(x(:,1), y(:,1), node, 'VerticalAlignment','bottom','HorizontalAlignment','right')
end