function [gm,newParams] = userDefMixture()
% This function generates a user defined mixture by providing respectively
% the weights, the means and the covariance matrices.

w = [0.0312 0.0613 0.0205 0.0641 0.0686 0.0295 0.0187 0.0294 0.0604...
       0.0168 0.0287 0.0308 0.0545 0.0653 0.0483 0.0763 0.1052 0.0347 0.1110 0.0448]';
   
mu = [0.9850 -1.4108 1.8039 3.5320 2.9284 1.2184 0.6558 -3.4733 3.1344...
       4.8346 1.3358 0.8144 -3.5141 -2.2333 -1.3948 -3.0829 4.9039 4.2327 -1.2792 -3.5484];
   
   
Sigma = [1.0079 0.0873 0.9974 0.4916 1.0064 0.3792 0.3618 0.4721 0.1318...
       0.4783 0.2194 1.2858 0.2177 0.6399 0.6016 1.3878 0.9608 1.7278 1.2280 0.1178];

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

