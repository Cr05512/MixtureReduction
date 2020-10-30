function values = evalGMM(gm,X)
% val = evalGMM(gm,xi):
% INPUTS: 
% - gm, a Gaussian mixture,
% - X, a sample set.
% OUTPUTS:
% - val, the value obtained by evaluating the Gaussian mixture in the
% sample set X.
% This function evaluates a Gaussian mixture on a sample set X.

values = zeros(1,size(X,2));
for i=1:length(gm)
    values = values + gm(i).w*mvnpdf(X',gm(i).mu',gm(i).Sigma)';
end

end

