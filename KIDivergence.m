function DKI = KIDivergence(pdf1,pdf2)

pdf_merge = mpMerge(pdf1, pdf2);
DKI = (pdf1.getWeight()+pdf2.getWeight())/2 * (log(det(2*pi*pdf_merge.getCovariance())) + 1);

end

