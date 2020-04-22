function gm_pruned = prune(gm, threshold)

w = [gm.w]';


indexes = find(w>=threshold);
gm_pruned = gm(indexes);
w_pruned = w(indexes);
w_pruned = num2cell(w_pruned./sum(w_pruned));
[gm_pruned.w] = w_pruned{:};


end

