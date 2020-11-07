function gmr = softClusteringKLD2(gmh,Nr,maxiter)
gmr = RunnalsMRA(gmh,Nr);

Nh = length(gmh);
respKLD = zeros(Nh,Nr);
M_bar = respKLD;
J = Inf;
JPrev = J;
for k=1:maxiter
   
    C = CostMatrix(gmh,gmr,'KLD');
    
    respKLD = 1./C;
    normFactor = sum(respKLD,2);
    
    for i=1:Nh
        for j=1:Nr
            M_bar(i,j) = gmh(i).w*respKLD(i,j)/normFactor(i);
        end
    end
    
    
    J = trace((M_bar.^2)'*C);
    
    if abs(J-JPrev)<1e-12
        k
        break;
    else
        JPrev = J;
    end
    
    wG = sum(M_bar,1);
    w_temp = num2cell(M_bar);
    gmh_temp = gmh;
    for j=1:Nr
        if wG(j)>0
            [gmh_temp.w] = w_temp{:,j};
            gmr(j) = mpMerge(gmh_temp);
        end
    end
    
end
    



end

