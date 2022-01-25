function dH2Bij = H2Bij(pdfi,pdfj,maxiter,tol)

bar = H2Barycenter([pdfi;pdfj],maxiter,tol);
dH2Bij = pdfi.w*H2ij(pdfi,bar) + pdfj.w*H2ij(pdfj,bar);

end

