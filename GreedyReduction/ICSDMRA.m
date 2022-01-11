function gmr = ICSDMRA(gmh, Nr, maxiter, tol)
% gmr = CSDMRA(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the algorithm presented in
% Kullback-Leibler Approach to Gaussian Mixture Reduction, A.R. Runnals
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The number of reduced components has to be greater than zero.');



if nargin < 3
    maxiter = 200;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end

if numel(gmh)<Nr
    gmr = gmh;
    return
end
gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = CSDBarycenter(gmh,maxiter,tol);
    return
end


CSMatrix = Inf(Nh,Nh);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            CSMatrix(i,j) = CSDBij(gmr(i),gmr(j),maxiter,tol);
        end
    end
end

while(numel(gmr)-Nr>0)


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(CSMatrix == min(CSMatrix(CSMatrix<Inf)),1);
    pdf_merged = CSDBarycenter(gmr([i,j]),maxiter,tol);
    gmr(i) = pdf_merged;
    gmr(j) = [];
    CSMatrix(j,:) = [];
    CSMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = CSDBij(pdf_merged,gmr(j));
        if i<j
            CSMatrix(i,j) = newBound;
        else
            CSMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

