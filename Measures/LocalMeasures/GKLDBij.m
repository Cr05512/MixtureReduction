function GB = GKLDBij(gm)
% GB = GKLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - GB, the Generalized Runnalls' upper bound on the divergence gain between the full and reduced mixture after the component 1
%   and 2 are merged (scalar).
% This function computes the upper bound proposed by A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007

N = numel(gm);
[w,~,Sigma] = paramsFromMixture(gm);
bar = KLDBarycenter(gm);
    
f = sum(w)*log(det(bar.Sigma));
for i=1:N
    f = f - w(i)*log(det(Sigma(:,:,i)));
end

GB = 0.5*f;
end

