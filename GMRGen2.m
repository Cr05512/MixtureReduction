function gmr = GMRGen2(gmh,Nr)

d = size(gmh(1).mu,1);
H = Inf(length(gmh),1);

for i=1:length(gmh)
   H(i) = 0.5*(d + log(2*pi)^d*det(gmh(i).Sigma));
end


[~,ind] = maxk(H,Nr);

gmr = gmh(ind);
w = num2cell([gmr.w]'./sum([gmr.w]));
[gmr.w] = w{:};

end

