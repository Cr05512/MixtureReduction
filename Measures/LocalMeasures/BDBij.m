function dBDBij = BDBij(pdfi,pdfj,maxiter,tol)
if nargin < 3
    maxiter = 500;
    tol = 1e-9;
elseif nargin < 4
    tol = 1e-9;
end

%bar = FKLDBarycenter([pdfi;pdfj]);
bar = BDBarycenter_mex([pdfi;pdfj],maxiter,tol);
dBDBij = pdfi.w*BDij(pdfi,bar) + pdfj.w*BDij(pdfj,bar);

end

