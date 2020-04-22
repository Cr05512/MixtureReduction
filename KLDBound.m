function B = KLDBound(pdf1, pdf2)
    pdf_merge = mpMerge([pdf1, pdf2]);
    
    B = 0.5*(pdf_merge.w*log(det(pdf_merge.Sigma))...
        - pdf1.w*log(det(pdf1.Sigma))...
        - pdf2.w*log(det(pdf2.Sigma)));

end

