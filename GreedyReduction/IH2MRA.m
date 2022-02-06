function gmr = IH2MRA(gmh, Nr, maxiter, tol)
% gmr = IH2MRA(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The number of reduced components has to be greater than zero.');

if nargin < 3
    maxiter = 500;
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
    gmr = H2Barycenter(gmh,maxiter,tol);
    return
end


H2Matrix = Inf(Nh,Nh);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            H2Matrix(i,j) = H2Bij(gmr(i),gmr(j),maxiter,tol);
        end
    end
end

while(numel(gmr)-Nr>0)


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(H2Matrix == min(H2Matrix(H2Matrix<Inf)),1);
    bar = H2Barycenter([gmr(i);gmr(j)],maxiter,tol);
    gmr(i) = bar;
    gmr(j) = [];
    H2Matrix(j,:) = [];
    H2Matrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=1:length(upd_ind)
        newBound = H2Bij(bar,gmr(upd_ind(j)),maxiter,tol);
        if i<(upd_ind(j))
            H2Matrix(i,upd_ind(j)) = newBound;
        else
            H2Matrix(upd_ind(j),i) = newBound;
        end
    end

end
    
    
    
end

