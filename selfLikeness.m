function Jhh = selfLikeness(gmh)

Jhh = 0;

for i=1:length(gmh)
    for j=1:length(gmh)
        Jhh = Jhh + gmh(i).w*gmh(j).w*mvnpdf(gmh(i).mu,gmh(j).mu,gmh(i).Sigma + gmh(j).Sigma);
    end
end

end

