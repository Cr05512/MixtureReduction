function gm = GMGen1D(w_bar,mu,Sigma)

gm(length(mu)) = GaussPDF();
for i=1:length(mu)
    gm(i).setWeight(w_bar(i));
    gm(i).setMean(mu(i));
    gm(i).setCovariance(Sigma(i));
end

end

