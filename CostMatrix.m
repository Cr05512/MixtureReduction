function C = CostMatrix(gmh,gmr,cost_meas)

Nh = length(gmh);
Nr = length(gmr);

C = zeros(Nh,Nr);


for i=1:length(gmh)
    for j=1:length(gmr)
        if strcmp(cost_meas,'KLD')
            C(i,j) = KLD(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'W2')
            C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'L2')
            C(i,j) = ISE(gmh(i),gmr(j));
        else
            C = Inf(Nh,Nr);
            return
        end
    end
end

end

