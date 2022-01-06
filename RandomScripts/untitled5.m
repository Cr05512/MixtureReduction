clc
clear
close all
costMeas = 'KLDij';
N = 1000;
d = 1;
for i=1:N
   
    gm = GMGen(15,d);
    
    [gmr,pairs] = G2RA(gm,numel(gm)-1,costMeas);

    
    [d1,C1,pi1] = CTD(gm,gmr,costMeas);
    [deff,Ceff,pieff] = EffCTD(gm,gmr,costMeas);
%     [d2,~,pi2] = CTD(gm,gmr2,'W2ij');
%     [d2eff,~,pi2eff] = EffCTD(gm,gmr2,'W2ij');
    
    feta = evalBarycenterFun(gm(pairs),computeBarycenter(gm(pairs),costMeas),costMeas);
    
    norm(2*d1-deff-feta)
    norm(pi1-pieff)
%     norm(d2-d2eff)
%     norm(pi2-pi2eff)
%     
end