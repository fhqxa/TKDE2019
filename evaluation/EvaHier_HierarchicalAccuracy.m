function hierAcc = EvaHier_HierarchicalAccuracy(realLabel, predLabel, tree)
num_examples = max(size(predLabel,1),size(predLabel,2));
num_classes = size(tree,1);
root = find(tree(:,1)==0);
num_rights = 0;
for i = 1:num_examples
    % construct extended label vector
    cur_node = realLabel(i);
    ind = 1;
    while (cur_node ~= root)
        label_vec(ind) = cur_node;
        ind = ind + 1;
        cur_par = tree(cur_node,1);
        cur_node = cur_par;
    end
    label_vec(ind) = root;
    % Find if the current prediction belongs to the extended label vector
    [isMem, ind_inters] = ismember(predLabel(i), label_vec);
    if (isMem)
        num_rights = num_rights + 1;
    end
end
hierAcc = num_rights / num_examples;
end