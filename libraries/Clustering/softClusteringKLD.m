function gmr = softClusteringKLD(gmh,gmr)
%gmr = RunnalsMRA(gmh,Nr);
Nr = length(gmr);
Nh = length(gmh);
respKLD = zeros(Nh,Nr);
wMatrix = respKLD;
for k=1:10
   
    for i=1:Nh
        for j=1:Nr
             respKLD(i,j) = gmr(j).w*exp(-Nh*KLD(gmh(i),gmr(j)));
        end
        normFactor = sum(respKLD(i,:));
        respKLD(i,:) = respKLD(i,:)/normFactor;
        
        for j=1:Nr
            wMatrix(i,j) = gmh(i).w*respKLD(i,j);
        end
        
    end
    
    gmh_temp = gmh;
    for j=1:Nr

        w_temp = num2cell(wMatrix(:,j));
        [gmh_temp.w] = w_temp{:};
        
        gmr(j) = mpMerge(gmh_temp);
        
    end
    
end
    



end

