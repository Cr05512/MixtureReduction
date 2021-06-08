function [gm,newParams] = testCrouse()
% gm = testCrouse():
% OUTPUTS:
% - gm, a Gaussian mixture,
% - Nh, new number of original components (scalar),
% - Nr, new number of reduced components (scalar),
% - d, new state dimension (scalar),
% - delta, new component center (scalar).
% This script generates a one dimensional Gaussian mixture as shown in the
% paper of D. F. Crouse et al. "A look at Gaussian Mixture Reduction
% Algorithms". Proc. 14th Int. Conf. Inf. Fusion, pages 1–8, 2011
Nh = 10;
d = 1;


w = [0.03, 0.18, 0.12, 0.19, 0.02, 0.16, 0.06, 0.1, 0.08, 0.06]';
mu = [1.45, 2.20, 0.67, 0.48, 1.49, 0.91, 1.01, 1.42, 2.77, 0.89]';
Sigma = [0.0487, 0.0305, 0.1171, 0.0174, 0.0295, 0.0102, 0.0323, 0.0380, 0.0115, 0.0679]';



gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d);

for i=1:Nh
    gm(i).w = w(i);
    gm(i).mu = mu(i);
    gm(i).Sigma = Sigma(i);
end


end

