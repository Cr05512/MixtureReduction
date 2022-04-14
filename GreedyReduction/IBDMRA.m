function gmr = IBDMRA(gmh, Nr,maxiter,tol)
% gmr = IBDMRA(gmh, Nr):
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

% if numel(gmh)<Nr
%     gmr = gmh;
%     return
% end
gmr = gmh;
Nh = numel(gmh);
% if(Nh==Nr)
%     return
% elseif(Nr==1)
%     gmr = BDBarycenter_mex(gmh);
%     return
% end


BMatrix = Inf(Nh,Nh);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = BDBij(gmr(i),gmr(j));
        end
    end
end

while(numel(gmr)-Nr>0)


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
    bar = BDBarycenter(gmr([i,j]),maxiter,tol);
    diff = norm(CTD(gmr,[gmr(setdiff(1:numel(gmr),[i,j]));bar],'BDij')-BMatrix(i,j))
    if diff>1e-6
        diff
        disp('AAAAAA')
        pause
    end
    gmr(i) = bar;
    gmr(j) = [];
    BMatrix(j,:) = [];
    BMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = BDBij(bar,gmr(j));
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

