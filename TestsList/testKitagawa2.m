function [gm,newParams] = testKitagawa2()

Nh = 10;
d = 2;


w = [0.30 0.20 0.16 0.11 0.08 0.06 0.04 0.03 0.01 0.01]';
mu = [0 2 3 -4 -1 2 0 -2 -2 1;0 0 3 -4 1 -4 2 4 0 -2];
Sigma = zeros(d,d,Nh);
Sigma(:,:,1) = [1 0;0 1];
Sigma(:,:,2) = [4 0;0 2];
Sigma(:,:,3) = [2 -0.5;-0.5 2];
Sigma(:,:,4) = [4 2;2 4];
Sigma(:,:,5) = [9 4;4 9];
Sigma(:,:,6) = [4 2;2 9];
Sigma(:,:,7) = [4 -0.5;-0.5 1];
Sigma(:,:,8) = [9 0;0 9];
Sigma(:,:,9) = [2 0;0 1];
Sigma(:,:,10) = [1 0;0 1];


gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d);

for i=1:Nh
    gm(i).w = w(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end


end

