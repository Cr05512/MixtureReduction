function alphas = alphaUTKLD(d,order)
if nargin < 2
    order = 2;
end


r2 = (2*order*d + 1)/2;

alphas = zeros(1,order);
for i=1:order
    alphas(i) = 0.1-log(i/order);
end

alphas = alphas.^2;
alphas = alphas./sum(alphas)*r2;
alphas = sqrt(alphas);



end

