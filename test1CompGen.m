function gm = test1CompGen(numComp,r)
%UNTITLED
sweepAngle = 2*pi/numComp;

xcoords = zeros(numComp,1);
ycoords = zeros(numComp,1);
w = (1/numComp)*ones(numComp,1);
mu = zeros(numComp,2);
Sigma = zeros(2,2,numComp);
gm = struct('w',0,'mu',[],'Sigma',[]);

P = rand(2,2);
P = P*P' + 2*eye(2);

for i=1:numComp
    xcoords(i) = r*cos((i-1)*sweepAngle);
    ycoords(i) = r*sin((i-1)*sweepAngle);
    mu(i,:) = [xcoords(i) ycoords(i)];
    Sigma(:,:,i) = P;
    gm(i).w = w(i);
    gm(i).mu = mu(i,:)';
    gm(i).Sigma = Sigma(:,:,i);
end




end

