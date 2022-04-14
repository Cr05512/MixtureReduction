function dBDBij = BDBij(pdfi,pdfj,maxiter,tol)
if nargin < 3
    maxiter = 1000;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end

%bar = FKLDBarycenter([pdfi;pdfj]);
bar = BDBarycenter_mex([pdfi;pdfj],maxiter,tol);
%bar = alpha2DBarycenter([pdfi;pdfj],0.5,maxiter,tol);
dBDBij = pdfi.w*BDij(pdfi,bar) + pdfj.w*BDij(pdfj,bar);

end

