function J = ISE(gmh,gmr)
Jhr = 0;
Jrr = 0;
Jhh = 0;

for i=1:length(gmh)
    for j=1:length(gmr)
        prodPDFhr = wGaussPDF(1, gmr(j).getMean(), gmh(i).getCovariance() + gmr(j).getCovariance());
        Jhr = Jhr + gmh(i).getWeight()*gmr(j).getWeight()*prodPDFhr.getPDFValues(gmh(i).getMean()');
    end
end

for i=1:length(gmr)
    for j=1:length(gmr)
        prodPDFrr = wGaussPDF(1, gmr(j).getMean(), gmr(i).getCovariance() + gmr(j).getCovariance());
        Jrr = Jrr + gmr(i).getWeight()*gmr(j).getWeight()*prodPDFrr.getPDFValues(gmr(i).getMean()');
    end
end

for i=1:length(gmh)
    for j=1:length(gmh)
        prodPDFhh = wGaussPDF(1, gmh(j).getMean(), gmh(i).getCovariance() + gmh(j).getCovariance());
        Jhh = Jhh + gmh(i).getWeight()*gmh(j).getWeight()*prodPDFhh.getPDFValues(gmh(i).getMean()');
    end
end


J = (Jhh -2*Jhr + Jrr)/(Jhh + Jrr);
    
    
end

