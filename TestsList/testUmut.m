function [gm,newParams] = testUmut(h)
% This function generates a user defined mixture by providing respectively
% the weights, the means and the covariance matrices.

if nargin < 1
    h = 0.25;
end

Nh = 20;
d = 1;

w = ones(Nh,1)/Nh;
   
mu = zeros(1,Nh);

for i=2:Nh
    mu(i) = mu(i-1)+h;
end
   
   
Sigma = ones(1,1,Nh);

gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d);

for i=1:length(w)
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end


end

