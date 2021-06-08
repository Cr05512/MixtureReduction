function gm = renormalizeWeights(gm)
w = [gm.w]';
w_bar = num2cell(w./sum(w));
[gm.w] = w_bar{:};
end

