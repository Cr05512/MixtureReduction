function [mu,Sigma] = getMixtureMoments(gm)
            
pdf = KLDBarycenter(gm);
mu = pdf.mu;
Sigma = pdf.Sigma;
end

