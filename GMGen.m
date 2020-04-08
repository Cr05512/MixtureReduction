function gm = GMGen(w_bar,mu,Sigma)
gm(size(mu,1)) = GaussPDF();
for i=1:size(mu,1)
    gm(i).setWeight(w_bar(i));
    gm(i).setMean(mu(i,:));
    gm(i).setCovariance(Sigma(:,:,i));
end

end

