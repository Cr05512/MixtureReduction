function gmr = testAlgo(gmh,Nr)


gmr = gmh;
Nh = numel(gmh);
KBMatrix = Inf(Nh,Nh);

for k=1:Nh-Nr
    for i=1:numel(gmr)
        for j=1:numel(gmr)
            
            if i<j
                gmr_temp = gmr;

                gmr_temp(i) = KLDBarycenter(gmr([i;j]));
                gmr_temp(j) = [];
                
                KBMatrix(i,j) = VAKLD(gmh,gmr_temp);

                
            end
        end
    end
    
    [i,j] = find(KBMatrix == min(KBMatrix(KBMatrix<Inf)),1);
    bar = BDBarycenter(gmr([i,j]));
    gmr(i) = bar;
    gmr(j) = [];
    KBMatrix(j,:) = [];
    KBMatrix(:,j) = [];
    
end
end

