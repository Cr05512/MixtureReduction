function pi_star = EffEROTP(gmh,Nr,C,gamma)
%EROTP efficient computation according to "A unified framework for GMR with
%composite transportation distance"
Nh = length(gmh);
pi_star = zeros(Nh,Nr);
for i=1:Nh
    if gamma==0
        [~,Ci] = min(C(i,:));
        pi_star(i,Ci) = gmh(i).w;
    else
        for j=1:Nr
            pi_star(i,j) = gmh(i).w*exp(-C(i,j)/gamma)./sum(exp(-C(i,:)./gamma));
        end
    end
end
        
    
end

