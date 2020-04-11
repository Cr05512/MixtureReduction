function Jhr = crossLikeness(gmh,gmr)

Jhr = 0;

for i=1:length(gmh)
    for j=1:length(gmr)
        prodPDFhr = wGaussPDF(1, gmr(j).getMean(), gmh(i).getCovariance() + gmr(j).getCovariance());
        Jhr = Jhr + gmh(i).getWeight()*gmr(j).getWeight()*prodPDFhr.getPDFValues(gmh(i).getMean()');
    end
end

end

