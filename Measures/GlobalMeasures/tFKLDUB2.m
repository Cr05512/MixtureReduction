function tB = tFKLDUB2(gmh,gmr)

CEUB = tCrossEntropyUB(gmh,gmr);
ELB = GMEntropyBound(gmh,'BDij');

tB = -ELB + CEUB;
end

