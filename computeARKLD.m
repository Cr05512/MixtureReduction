function ARKLD = computeARKLD(gm,i,j)

if i==j %Pruning case
    %Given I, we have to find the J ~= I for which the ARKLD for pruning is
    %minimum.

    ARKLD_temp = Inf(length(gm),1);
    for k=1:length(gm)
        if k~=i
        ARKLD_temp(k) = -log(1-gm(i).w) - gm(k).w/(1-gm(i).w)*log(1 + gm(i).w/gm(k).w * exp(-KLD(gm(k),gm(i))));
        end
    end
    
    ARKLD = min(ARKLD_temp);
    
else %Merging case
    
    w_IJ = gm(i).w + gm(j).w;
    q_IJ = mpMerge([gm(i);gm(j)]);
    V = VARKLD(q_IJ,gm(i),gm(j));
    ARKLD = w_IJ*log(w_IJ) - w_IJ*log(gm(i).w*exp(-V) + gm(j).w*exp(-V));
%    ARKLD = w_IJ*log(w_IJ) - w_IJ*log(gm(i).w*exp(-KLD(q_IJ,gm(i))) + gm(i).w*exp(-KLD(q_IJ,gm(j))));
    
end

end

