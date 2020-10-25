function [gm,d,alpha] = test4CompGen(numComp,r,beta)
% test4CompGen(numComp,r):
% INPUTS:
% - numComp, number of desired components for the full mixture,
% - r, distance from the origin of the component means,
% - beta, covariance tuning parameter.
% OUTPUTS:
% - gm, a Gaussian mixture.
% - d, new state dimension parameter; this is needed for the main loop computations
% - alpha, new alpha.
% This script generates numComp components on a 2D polygon vertices having
% symmetric covariances (pairwise) and one weight which is slightly bigger
% than the others.


if nargin < 1
    numComp = 8;
    r = 5;
    beta = 0.09;
elseif nargin < 2
    r = 5;
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
w = ones(numComp,1);
w(1) = w(1)+1e-3;
w = w./sum(w);
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

