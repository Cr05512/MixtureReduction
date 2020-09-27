function matrixcl = matrixCrossLikeness(gmh,gmr)

N = length(gmh);
R = length(gmr);

matrixcl = Inf(N,R);

for i=1:N
    for j=1:R
         matrixcl(i,j) = gmh(i).w*gmr(j).w*mvnpdf(gmh(i).mu,gmr(j).mu,gmh(i).Sigma + gmr(j).Sigma);
    end
end

end

