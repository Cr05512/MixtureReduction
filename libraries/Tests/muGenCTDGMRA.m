function mu = muGenCTDGMRA(r,theta)
% mu = muGenCTDGMRA(r,theta):
% INPUTS:
% - r, radial distance from the original for the component mean,
% - theta, angle for the component mean.
% OUTPUTS:
% - mu, the newly generated mean.
% This function generates the component means according to the paper:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.

assert(r>0,'The parameter r has to be greater than zero.');

mu = r*[cos(theta);sin(theta)];

end

