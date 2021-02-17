function [gm,newParams] = userDefMixture2()
% This function generates a user defined mixture by providing respectively
% the weights, the means and the covariance matrices.

w = [0.3 0.7]';
   
mu = [-2 2];
   
   
Sigma = 0.15*[1 1];

Nh = numel(w);
d = size(mu,1);

Sigma = reshape(Sigma,d,d,Nh);

gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d);

for i=1:length(w)
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end


end

