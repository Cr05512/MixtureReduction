function mKLD = matrixKLD(A,B)
assert(all(size(A)==size(B)),'The matrices have to be of the same size,');
[na,nb] = size(A);

mKLD = 0;
for i=1:na
    for j=1:nb
        if ~isnan(A(i,j)*log(A(i,j)/B(i,j)))
            mKLD = mKLD + A(i,j)*log(A(i,j)/B(i,j));
        end
    end
end

end

