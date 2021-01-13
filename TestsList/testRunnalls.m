function [gm,newParams] = testRunnalls()
% gm = testRunnals():
% OUTPUTS:
% - gm, a Gaussian mixture,
% - Nh, new number of original components (scalar),
% - Nr, new number of desired components (scalar),
% - d, new state dimension (scalar).
% This script generates a one dimensional Gaussian mixture as shown in the
% paper of A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007
d = 12;
Nh = 4;
Nr = 3;
%w = [0.34 0.32 0.34]';
w = 0.25*ones(4,1);
mu1 = [-20;-0.5;zeros(10,1)];
mu2 = [-20;0.5;zeros(10,1)];
mu3 = [20;-10;zeros(10,1)];
mu4 = [20;10;zeros(10,1)];
mu = [mu1 mu2 mu3 mu4];
Sigma = zeros(d,d,4);
Sigma1 = eye(12);
Sigma(:,:,1) = Sigma1;
Sigma(:,:,2) = Sigma1;
Sigma(:,:,3) = 4*Sigma1;
Sigma(:,:,4) = 4*Sigma1;

gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d);


for i=1:length(w)
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end


end

