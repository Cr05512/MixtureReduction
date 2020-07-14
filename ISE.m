function J = ISE(gmh,gmr)

J = selfLikeness(gmh) -2*crossLikeness(gmh,gmr) + selfLikeness(gmr);
    
    
end

