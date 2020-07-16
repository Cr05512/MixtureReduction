function gm = test3CompGen(numComp,r)
%%This script generates numComp components on a polygon vertices having
%symmetric covariances (pairwise) and one weight which is slightly smaller
%than others
sweepAngle = 2*pi/numComp;

global Nh Nr n
Nh = numComp;
Nr = Nh-1;
n = 2;

xcoords = zeros(numComp,1);
ycoords = zeros(numComp,1);
w = ones(numComp,1);
w(1) = w(1)-1e-3;
w = w./sum(w);
mu = zeros(numComp,2);
Sigma = zeros(2,2,numComp);
gm = struct('w',0,'mu',[],'Sigma',[]);

P = rand(2,2);
P = P*P' + 2*eye(2);
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

