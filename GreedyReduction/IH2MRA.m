function gmr = IH2MRA(gmh, Nr)
% gmr = IH2MRA(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The number of reduced components has to be greater than zero.');



if numel(gmh)<Nr
    gmr = gmh;
    return
end
gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = H2Barycenter(gmh);
    return
end


H2Matrix = Inf(Nh,Nh);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            H2Matrix(i,j) = H2Bij(gmr(i),gmr(j));
        end
    end
end

while(numel(gmr)-Nr>0)


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(H2Matrix == min(H2Matrix(H2Matrix<Inf)),1);
    pdf_merged = H2Barycenter(gmr([i,j]));
    gmr(i) = pdf_merged;
    gmr(j) = [];
    H2Matrix(j,:) = [];
    H2Matrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = H2Bij(pdf_merged,gmr(j));
        if i<j
            H2Matrix(i,j) = newBound;
        else
            H2Matrix(j,i) = newBound;
        end
    end

end
    
    
    
end

