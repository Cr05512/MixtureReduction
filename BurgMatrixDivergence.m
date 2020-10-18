function B = BurgMatrixDivergence(S1,S2)
%Burg Matrix Divergence
d = size(S1,1);
S2inv = inv(S2);
B = trace(S1*S2inv)-log(det(S1*S2inv))-d;

end

