function [gm,newParams] = fitgmdist2GaMARTdist(gmdist)

d = gmdist.NumVariables;
N = gmdist.NumComponents;
w = gmdist.ComponentProportion;
mu = gmdist.mu';
Sigma = gmdist.Sigma;

newParams = struct('Nh',N,'d',d);

gm = mixtureFromParams(w,mu,Sigma);

end

