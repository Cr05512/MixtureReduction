function [gm,d,alpha] = test2CompGen(numComp,r,beta)
% test2CompGen(numComp,r):
% INPUTS:
% - numComp, number of desired components for the full mixture,
% - r, distance from the origin of the component means,
% - beta, covariance tuning parameter.
% OUTPUTS:
% - gm, a Gaussian mixture.
% - d, new state dimension parameter; this is needed for the main loop computations
% - alpha, new alpha.
% This script generates numComp components on a 2D polygon vertices having
% symmetric covariances (pairwise) and the same weights.
% This script is meant to test algorithms in the particular case of symmetric
% Gaussian mixture

if nargin < 1
    numComp = 8;
    r = 10;
    beta = 0.09;
elseif nargin < 2
    r = 10;
    beta = 0.09;
elseif nargin < 3
    beta = 0.09;
end
assert(numComp>0,'The number of components in the full mixture has to be greater than zero.');
assert(r>=0,'The distance of the component means from the origin has to be non-negative.');

sweepAngle = 2*pi/numComp;
d = 2;
alpha = 2*r;

xcoords = zeros(numComp,1);
ycoords = zeros(numComp,1);
w = (1/numComp)*ones(numComp,1);
mu = zeros(numComp,2);
Sigma = zeros(2,2,numComp);
gm = struct('w',0,'mu',[],'Sigma',[]);

P = wishrnd(beta*eye(d),d+5);
covMatrixRotAngle = pi/(numComp/2);

syms phi;
Rz = [cos(phi) -sin(phi);sin(phi) cos(phi)];




for i=1:numComp
    xcoords(i) = r*cos((i-1)*sweepAngle);
    ycoords(i) = r*sin((i-1)*sweepAngle);
    mu(i,:) = [xcoords(i) ycoords(i)];
    phi = (i-1)*covMatrixRotAngle;
    R = double(subs(Rz));
    Sigma(:,:,i) = R*P*R';
    gm(i).w = w(i);
    gm(i).mu = mu(i,:)';
    gm(i).Sigma = Sigma(:,:,i);
end




end

