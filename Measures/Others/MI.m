function dMI = MI(pXY,pX,pY)
% This function evaluates the discrete Mutual Information between two
% random variables X and Y

Nx = numel(pX);
Ny = numel(pY);
dMI = 0;

for i=1:Ny
    for j=1:Nx
        if ~isnan(pXY(j,i)*log(pXY(j,i)/(pX(j)*pY(i))))
            dMI = dMI + pXY(j,i)*log(pXY(j,i)/(pX(j)*pY(i)));
        end
    end
end

end

