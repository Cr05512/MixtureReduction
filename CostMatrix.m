function C = CostMatrix(gmh,gmr,cost_meas,lambda,I)
if nargin < 4
    lambda = 0.1;
    I = 10*length(gmh);
elseif nargin < 5
    I = 10*length(gmh);
end

Nh = length(gmh);
Nr = length(gmr);

C = zeros(Nh,Nr);


for i=1:length(gmh)
    for j=1:length(gmr)
        if strcmp(cost_meas,'KLD')
            C(i,j) = KLD(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'W2')
            C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'GJSD')
            C(i,j) = GJSD(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'MKLD')
            C(i,j) = MKLD(gmh(i),gmr(j),lambda,I);
        end
    end
end

end

