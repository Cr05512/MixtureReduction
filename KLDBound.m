function B = KLDBound(pdf1, pdf2)
    pdf_merge = mpMerge([pdf1, pdf2]);
    
    B = 0.5*(pdf_merge.getWeight()*log(det(pdf_merge.getCovariance()))...
        - pdf1.getWeight()*log(det(pdf1.getCovariance()))...
        - pdf2.getWeight()*log(det(pdf2.getCovariance())));

end

