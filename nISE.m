function J = nISE(gmh,gmr)

Jhr = crossLikeness(gmh,gmr);
Jhh = selfLikeness(gmh);
Jrr = selfLikeness(gmr);


J = (Jhh -2*Jhr + Jrr)/(Jhh + Jrr);
    
    
end

