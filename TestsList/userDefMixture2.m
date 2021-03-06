function [gm,newParams] = userDefMixture2()
% This function generates a user defined mixture by providing respectively
% the weights, the means and the covariance matrices.

w = [0.45 0.55]';
   
mu = [-1 2];
   
   
Sigma = 1*[0.15 0.15];

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

