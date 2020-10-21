function pi_star = EffEROTP(gmh,C,lambda)
% pi_star = EffEROTP(gmh,C,lambda):
% INPUTS:
% - gmh, a Gaussian mixture,
% - C, Cost Matrix,
% - lambda, regularization parameter.
% OUTPUTS:
% - pi_star, the entropic regularized optimal transportation plan.
% This function computes the Entropic regularized Optimal Transportation Plan according to "A unified framework for GMR with
% composite transportation distance".
assert(size(C,1)==length(gmh),'Check input parameters, dimensions are inconsistent.');
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(lambda>=0,'The parameter lambda has to be non-negative.');
Nh = length(gmh);
Nr = size(C,2);
pi_star = zeros(Nh,Nr);
for i=1:Nh
    if lambda==0
        [~,Ci] = min(C(i,:));
        pi_star(i,Ci) = gmh(i).w;
    else
        normFactor = sum(exp(-C(i,:)./lambda));
        if normFactor>0
            pi_star(i,:) = gmh(i).w*exp(-C(i,:)./lambda)./normFactor;
        end

    end
end
        
    
end

