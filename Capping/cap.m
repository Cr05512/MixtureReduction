function gmr = cap(gmh,k)

[~,ind] = sort([gmh.w],'descend');
gmr = gmh(ind);
gmr = gmr(1:k);
gmr = renormalizeWeights(gmr);

end

