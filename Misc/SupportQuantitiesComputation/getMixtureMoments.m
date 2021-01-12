function [mu,Sigma] = getMixtureMoments(gm)
            
pdf = mpMerge(gm);
mu = pdf.mu;
Sigma = pdf.Sigma;
end

