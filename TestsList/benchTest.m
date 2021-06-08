function [gm,newParams] = benchTest()

w = [0.2 0.2 0.2 0.2 0.1 0.1]';
   
mu = [-5 5; 4 5; 4 -4; -4 -4; -7 0; 7 0]';
   
Sigma = zeros(2,2,6);
Sigma(:,:,1) = [1 0.5;0.5 0.5];
Sigma(:,:,2) = [1 0.2;0.2 0.5];
Sigma(:,:,3) = [2 0;0 1];
Sigma(:,:,4) = [2 -2;-2 3];
Sigma(:,:,5) = [0.1 0;0 3];
Sigma(:,:,6) = [0.1 0;0 3];

alpha = 7;

Nh = numel(w);
d = size(mu,1);


gm = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d,'alpha',alpha);
for i=1:Nh
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end
end

