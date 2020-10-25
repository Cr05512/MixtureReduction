function gmr_init = GMRGen(gmh,Nr)

w = [gmh.w]';
gmr_ind = [];
cdf = cumsum(w);
while length(gmr_ind)<Nr
    r = rand();
    ind = find(r<cdf,1,'first');
    if ~ismember(ind,gmr_ind)
        gmr_ind = [gmr_ind ind];
    end
end
w = w(gmr_ind);
w = w./sum(w);

gmr_init(Nr) = struct('w',[],'mu',[],'Sigma',[]);

for i=1:Nr
    gmr_init(i).w = w(i);
    gmr_init(i).mu = gmh(gmr_ind(i)).mu;
    gmr_init(i).Sigma = gmh(gmr_ind(i)).Sigma;
end

end

