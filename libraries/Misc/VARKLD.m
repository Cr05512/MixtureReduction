function V = VARKLD(q_K,q_I,q_J)

d = size(q_I.mu,1);
mu_I = q_I.mu;
mu_J = q_J.mu;
mu_K = q_K.mu;
Sigma_I = q_I.Sigma;
Sigma_J = q_J.Sigma;
Sigma_K = q_K.Sigma;
Sigma_Jinv = inv(Sigma_J);
Sigma_Kinv = inv(Sigma_K);
Sigma_IKinv = inv(Sigma_I + Sigma_K);
mu_star = mu_I + Sigma_I*Sigma_IKinv*(mu_K-mu_I);
Sigma_star = Sigma_I - Sigma_I*Sigma_IKinv*Sigma_I;


V = 0.5*log(det(Sigma_K)/det(Sigma_J))...
    - 0.5*trace(Sigma_Jinv*(Sigma_J - Sigma_K - (mu_J - mu_K)*(mu_J - mu_K)')) ...
    - ((2*pi)^(d/2))*sqrt(det(Sigma_I))*mvnpdf(mu_I,mu_K,Sigma_K + Sigma_I)...
    * (-0.5*log(det(2*pi*Sigma_K)) - 0.5*trace(Sigma_Kinv*(Sigma_star + (mu_K - mu_star)*(mu_K - mu_star)'))...
    + 0.5*log(det(2*pi*Sigma_J)) + 0.5*trace(Sigma_Jinv*(Sigma_star + (mu_J - mu_star)*(mu_J - mu_star)')));
    

end

