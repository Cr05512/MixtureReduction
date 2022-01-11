function gmr = IBDMRA(gmh, Nr)
% gmr = IBDMRA(gmh, Nr):
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
    gmr = BDBarycenter(gmh);
    return
end


BDMatrix = Inf(Nh,Nh);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BDMatrix(i,j) = BDBij(gmr(i),gmr(j));
        end
    end
end

while(numel(gmr)-Nr>0)


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BDMatrix == min(BDMatrix(BDMatrix<Inf)),1);
    pdf_merged = BDBarycenter(gmr([i,j]));
    gmr(i) = pdf_merged;
    gmr(j) = [];
    BDMatrix(j,:) = [];
    BDMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = BDBij(pdf_merged,gmr(j));
        if i<j
            BDMatrix(i,j) = newBound;
        else
            BDMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

