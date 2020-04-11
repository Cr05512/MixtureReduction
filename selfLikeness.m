function Jhh = selfLikeness(gmh)

Jhh = 0;

for i=1:length(gmh)
    for j=1:length(gmh)
        prodPDFhh = wGaussPDF(1, gmh(j).getMean(), gmh(i).getCovariance() + gmh(j).getCovariance());
        Jhh = Jhh + gmh(i).getWeight()*gmh(j).getWeight()*prodPDFhh.getPDFValues(gmh(i).getMean()');
    end
end

end

