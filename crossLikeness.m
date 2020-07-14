function Jhr = crossLikeness(gmh,gmr)

Jhr = 0;

for i=1:length(gmh)
    for j=1:length(gmr)
        Jhr = Jhr + gmh(i).w*gmr(j).w*mvnpdf(gmh(i).mu,gmr(j).mu,gmh(i).Sigma + gmr(j).Sigma);
    end
end

end

