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

    expC = exp(-3*C);


    for i=1:Nh
        normFactor = [gmr.w]*expC(i,:)';
        for j=1:Nr
            W(i,j) = gmr(j).w*expC(i,j)/normFactor;
        end
    end

    pi_star = D*W;
    %pi_star = W.*log(W) + W.*C - W.*log([gmr.w]);
    pi_star(isnan(W)) = 0;
    
    wG = sum(pi_star,1)';

    w_temp = num2cell(pi_star);
    for j=1:Nr
        if wG(j)>0
            [gmh_temp.w] = w_temp{:,j};
            gmr(j) = KLDBarycenter(gmh_temp);
        end

    end
    
    gmr = gmr(wG>0);
    wG = wG(wG>0);
    w_norm = num2cell(wG./sum(wG));
    [gmr.w] = w_norm{:};
    Nr = length(gmr);
    
    
end



end

