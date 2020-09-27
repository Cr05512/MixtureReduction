function matrixsl = matrixSelfLikeness(gmh)

N = length(gmh);

matrixsl = Inf(N,N);

for i=1:N
    for j=1:N
         matrixsl(i,j) = gmh(i).w*gmh(j).w*mvnpdf(gmh(i).mu,gmh(j).mu,gmh(i).Sigma + gmh(j).Sigma);
    end
end

end

