function Jhr = crossLikeness(gmh,gmr)

Jhr = 0;

for i=1:length(gmh)
    for j=1:length(gmr)
        prodPDFhr = struct('w',1, 'mu', gmr(j).mu, 'Sigma', gmh(i).Sigma + gmr(j).Sigma);
        Jhr = Jhr + gmh(i).w*gmr(j).w*mvnpdf(gmh(i).mu',prodPDFhr.mu',prodPDFhr.Sigma);
    end
end

end

