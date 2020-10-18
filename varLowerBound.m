function L = varLowerBound(gmh,gmr,E,Z,I)
%Variational Lower Bound for the DPHEM algorithm
L = 0;
for i=1:length(gmh)
    for j=1:length(gmr)
        if Z(i,j)>0
            L = L + gmh(i).w*Z(i,j)*(log(gmr(j).w/Z(i,j)) + E(i,j));
        end
    end
end
L = I*L;

end

