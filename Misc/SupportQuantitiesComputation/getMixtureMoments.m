function [mu,Sigma] = getMixtureMoments(gm)
            
pdf = FKLDBarycenter(gm);
mu = pdf.mu;
Sigma = pdf.Sigma;
end

