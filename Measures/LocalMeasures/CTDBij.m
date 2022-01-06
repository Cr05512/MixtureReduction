function dCTDBij = CTDBij(pdfi,pdfj,costMeas,varargin)

w1 = pdfi.w;
w2 = pdfj.w;
bar = computeBarycenter([pdfi;pdfj],costMeas,varargin{:});

dCTDBij = w1*CostMatrix(pdfi,bar,costMeas,varargin{:}) + w2*CostMatrix(pdfj,bar,costMeas,varargin{:});
end

