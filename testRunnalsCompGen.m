function gm = testRunnalsCompGen()
%This script generates a gaussian mixture with parameters taken from
%Williams' Master thesis example at page 1 of section 4. It has been
%reported in order to compare the computation of ISE and the action taken,
%which seem to match well 
global Nh Nr n
n = 12;
Nh = 4;
Nr = 3;
%w = [0.34 0.32 0.34]';
w = 0.25*ones(4,1);
mu1 = [-20;-0.5;zeros(10,1)];
mu2 = [-20;0.5;zeros(10,1)];
mu3 = [20;-10;zeros(10,1)];
mu4 = [20;10;zeros(10,1)];
mu = [mu1 mu2 mu3 mu4];
Sigma = zeros(n,n,4);
Sigma1 = eye(12);
Sigma(:,:,1) = Sigma1;
Sigma(:,:,2) = Sigma1;
Sigma(:,:,3) = 4*Sigma1;
Sigma(:,:,4) = 4*Sigma1;


gm = struct('w',[],'mu',[],'Sigma',[]);

for i=1:length(w)
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end


end

