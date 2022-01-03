function gmr = KRef(gmr,gmh,numIter)

if nargin < 3
    numIter = 50;
end

d = size(gmh(1).mu,1);
Nh = numel(gmh);
Nr = numel(gmr);

gmh_temp = gmh;

wh = [gmh.w]';

W = zeros(Nh,Nr);
D = diag(wh);
    
for k=1:numIter
    %Expectation
    C = CostMatrix(gmh,gmr,'KLDij');

    pi_star = computeOTP(C,wh,[gmr.w]');
    
    wG = sum(pi_star,1)';

    w_temp = num2cell(pi_star);
    for j=1:Nr
        if wG(j)>0
            [gmh_temp.w] = w_temp{:,j};
            bar = computeBarycenter(gmh_temp,'KLDij');
            gmr(j).mu = bar.mu;
            gmr(j).Sigma = bar.Sigma;
        end

    end
    
    %Optimal weight update
    C = CostMatrix(gmh,gmr,'KLDij');
    
    pi_star = EffEROTP(wh,C,0);
    wG = sum(pi_star,1)';
    gmr = gmr(wG>0);
    wG = wG(wG>0);
    w_norm = num2cell(wG./sum(wG));
    [gmr.w] = w_norm{:};
    Nr = length(gmr);
    
    
end



end

