function gmr = GMRGen2(gmh,Nr)

d = size(gmh(1).mu,1);
H = Inf(length(gmh),1);

for i=1:length(gmh)
    H(i) = (d/2)*log(2*pi*exp(1)*trace((1/gmh(i).w)*gmh(i).Sigma)^(1/d));
    %H(i) = log(gmh(i).w) + d/2 + d/2*log(2*pi) + 0.5*log(det(gmh(i).Sigma));
    %H(i) = (d/2) + log(det(gmh(i).Sigma)*(2*pi)^(1/d));
end

[~,ind] = mink(H,Nr);

gmr = gmh(ind);
w = num2cell([gmr.w]'./sum([gmr.w]));
[gmr.w] = w{:};

end

