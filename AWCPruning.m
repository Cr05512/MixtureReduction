function gmr = AWCPruning(gm,rho)
if nargin < 2
    rho = 0.9544;
end
%Adaptive weight-censored pruning
N = length(gm);
[w_sort,perm] = sort([gm.w]');
gamma = zeros(N,1);

for i=1:N
    gamma(i) = sum(w_sort(i:end))/sum(w_sort);
end

nmax = max(find(gamma>=rho));
w_bar = w_sort(nmax+1:end);
w_bar = w_bar./sum(w_bar);
perm = perm(nmax+1:end);
gmr = gm(perm);
w = num2cell(w_bar);
[gmr.w] = w{:};

%disp(horzcat('Pruned : ',num2str(nmax),' components.'));

end

