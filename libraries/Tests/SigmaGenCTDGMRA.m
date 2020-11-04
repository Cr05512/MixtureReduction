function Sigma = SigmaGenCTDGMRA(lambda1,lambda2,theta)
% Sigma = SigmaGenCTDGMRA(lambda1,lambda2,theta):
% INPUTS:
% - lambda1, lambda2, eigenvalues for the the component covariance,
% - theta, rotation angle for the component covariance.
% OUTPUTS:
% - Sigma, the newly generated covariance matrix.
% This function generates the component covariances according to the paper:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.

assert(lambda1>0 && lambda2>0,'The eigenvalues have to be greater than zero.');

R = [cos(theta) -sin(theta);sin(theta) cos(theta)];

Sigma = R*[lambda1 0;0 lambda2]*R';

end