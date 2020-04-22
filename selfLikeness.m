function Jhh = selfLikeness(gmh)

Jhh = 0;

for i=1:length(gmh)
    for j=1:length(gmh)
        prodPDFhh = struct('w',1,'mu',gmh(j).mu,'Sigma',gmh(i).Sigma + gmh(j).Sigma);
        Jhh = Jhh + gmh(i).w*gmh(j).w*mvnpdf(gmh(i).mu',prodPDFhh.mu',prodPDFhh.Sigma);
    end
end

end

