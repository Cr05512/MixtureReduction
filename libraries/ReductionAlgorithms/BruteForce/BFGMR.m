function gmr = BFGMR(gmh,Nr)
% gmr = BFGMR(gmh,Nr):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture.
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the Brute-force algorithm presented in:
% D. F. Crouse, P. Willett, K. Pattipati, and L. Svensson, "A look at Gaussian
% mixture reduction algorithms", in Proc. 14th Int. Conf. Inf. Fusion, Jul.
% 2011, pp. 1–8.


Nh = length([gmh.w]);

if(Nh==Nr)
    gmr = gmh;
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end

[curSetPart,recurSetData]=getNextSetMPartition(Nh,Nr);

ISEMin = Inf;

gmr(Nr,1) = struct('w',[],'mu',[],'Sigma',[]);
while(~isempty(curSetPart))
    for ind=1:Nr
        sel=(curSetPart==ind);
        w_sum = sum([gmh(sel).w]);
        
        gmr_temp = mpMerge(gmh(sel));
        
        gmr(ind).w = w_sum;
        gmr(ind).mu = gmr_temp.mu;
        gmr(ind).Sigma = gmr_temp.Sigma;
    end
    
    ISECurr = ISE(gmh,gmr);
    
    if(ISECurr<ISEMin)
        ISEMin=ISECurr;
        setParMin=curSetPart;
    end

    [curSetPart,recurSetData]=getNextSetMPartition(recurSetData);
end

%Return the best reduced distribution.
for ind=1:Nr
    sel=(setParMin==ind);
    w_sum = sum([gmh(sel).w]);
    
    gmr_temp = mpMerge(gmh(sel));

    gmr(ind).w = w_sum;
    gmr(ind).mu = gmr_temp.mu;
    gmr(ind).Sigma = gmr_temp.Sigma;
end


end



