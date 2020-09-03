function pi_star = EffEROTP(gmh,Nr,C,lambda)
%EROTP efficient computation according to "A unified framework for GMR with
%composite transportation distance"
Nh = length(gmh);
pi_star = zeros(Nh,Nr);
for i=1:Nh
    if lambda==0
        [~,Ci] = min(C(i,:));
        pi_star(i,Ci) = gmh(i).w;
    else
        normFactor = sum(exp(-C(i,:)./lambda));
        if normFactor>0
            pi_star(i,:) = gmh(i).w*exp(-C(i,:)./lambda)./normFactor;
        end

    end
end
        
    
end

