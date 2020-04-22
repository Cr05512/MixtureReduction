function DKI = KIDivergence(pdf1,pdf2)

pdf_merge = mpMerge([pdf1, pdf2]);
DKI = (pdf1.w+pdf2.w)/2 * (log(det(2*pi*pdf_merge.Sigma)) + 1);

end

