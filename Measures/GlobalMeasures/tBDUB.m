function dtBDUB = tBDUB(gmh,gmr)

wh = [gmh.w]';
wr = [gmr.w]';
C = CostMatrix(gmh,gmr,'BDij');
pi = abs(computeOTP(C,wh,wr));

dtBDUB = 0;

for i=1:numel(gmh)
    for j=1:numel(gmr)
        dtBDUB = dtBDUB + pi(i,j)*C(i,j);
        tmp = pi(i,j)*log(wh(i)*wr(j)/pi(i,j));
        if ~isnan(tmp)
            dtBDUB = dtBDUB + tmp;
        end
    end
end

end

