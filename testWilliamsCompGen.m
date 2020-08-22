function gm = testWilliamsCompGen()
%This script generates a gaussian mixture with parameters taken from
%Williams' Master thesis example at page 1 of section 4. It has been
%reported in order to compare the computation of ISE and the action taken,
%which seem to match well 
global Nh Nr n delta
n = 1;
Nh = 5;
Nr = 2;
%w = [0.34 0.32 0.34]';
w = [0.083 0.167 0.25 0.333 0.167]';
mu = [1 2 3 4 10]';
Sigma = [0.1 20 2 2 2];
delta = (max(mu)-min(mu))/2;

gm = struct('w',[],'mu',[],'Sigma',[]);

for i=1:length(w)
    gm(i).w = w(i);
    gm(i).mu = mu(i);
    gm(i).Sigma = Sigma(i);
end


end

