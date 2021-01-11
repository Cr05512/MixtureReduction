function [gm,newParams] = testWilliams()
% gm = testWilliams():
% OUTPUTS:
% - gm, a Gaussian mixture
% - Nh, new number of original components (scalar),
% - Nr, new number of reduced components (scalar),
% - d, new state dimension (scalar),
% - delta, new components center (scalar).
% This script generates a Gaussian mixture with parameters taken from
% Williams' Master thesis example at page 1 of section 4.
% Link to the Master thesis: http://ssg.mit.edu/group/jlwil/publications/Wil03.pdf

d = 1;
Nh = 5;
%w = [0.34 0.32 0.34]';
w = [0.083 0.167 0.25 0.333 0.167]';
mu = [1 2 3 4 10]';
Sigma = [0.1 20 2 2 2];

gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d);


for i=1:length(w)
    gm(i).w = w(i);
    gm(i).mu = mu(i);
    gm(i).Sigma = Sigma(i);
end


end

