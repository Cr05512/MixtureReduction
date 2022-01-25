function dCTDBij = CTDBij(pdfi,pdfj,costMeas,varargin)

w1 = pdfi.w;
w2 = pdfj.w;
bar = computeBarycenter([pdfi;pdfj],costMeas,varargin{:});

dCTDBij = w1*feval(costMeas,pdfi,bar,varargin{:}) + w2*feval(costMeas,pdfi,bar,varargin{:});
end

