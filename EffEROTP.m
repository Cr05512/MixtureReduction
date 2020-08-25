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
        normFactor = sum(exp(-C(i,:)./gamma));
        if normFactor>0
            pi_star(i,:) = gmh(i).w*exp(-C(i,:)/gamma)./normFactor;
        end

    end
end
        
    
end

