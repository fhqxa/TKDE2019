%% Find the leaf nodes of the current node (if has), and assign the labels of these leaf nodes 
%% to the label of the current class
function[label_mod] = label_modify_MLNP(labelSet, cur_node, tree)
label_mod = labelSet;
% Find the corresponding leaf nodes of every child node
children_set = get_children_set(tree, cur_node);   % Direct children nodes of the current node
for c =1:length(children_set)
    pos_label_set = get_pos_label_MLNP(tree, children_set(c));  % Relative leaf nodes of the children nodes
    for tl = 1:length(label_mod)
        if (ismember(label_mod(tl), pos_label_set) ~= 0)
            label_mod(tl) = children_set(c);
        end
    end
end
end