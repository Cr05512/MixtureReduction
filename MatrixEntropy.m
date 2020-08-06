function H = MatrixEntropy(Pi)

H = 0;
for i=1:size(Pi,1)
    for j=1:size(Pi,2)
        if Pi(i,j)~=0
            H = H - Pi(i,j)*(log(Pi(i,j)) - 1);
        end
    end
end
        
end

