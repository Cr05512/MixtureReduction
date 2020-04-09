function gm = GMGen(w_bar,mu,Sigma)
gm(size(mu,2)) = wGaussPDF();
for i=1:size(mu,2)
    gm(i).setWeight(w_bar(i));
    gm(i).setMean(mu(:,i));
    gm(i).setCovariance(Sigma(:,:,i));
end

end

