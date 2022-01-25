function [gm,newParams] = userDefMixture4()
% This function generates a user defined mixture by providing respectively
% the weights, the means and the covariance matrices.

w = [0.5 0.5]';
   
mu = [-4 5];
   
   
Sigma = 1*[4 0.64];

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

