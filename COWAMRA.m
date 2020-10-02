function gmr = COWAMRA(gmh,Nr,algo,gamma)
if nargin < 3
    algo = 1;
    gamma = Inf;
elseif nargin < 4
    gamma = Inf;
end
Nh = length(gmh);
gmr = WestMRA(gmh,Nr,algo,gamma);
%gmr = SalmondMRA(gmh,Nr);
a = zeros(Nr,1);
for i=1:Nr
    for j=1:Nh
        a(i) = a(i) + gmh(j).w*mvnpdf(gmr(i).mu,gmh(j).mu,gmr(i).Sigma + gmh(j).Sigma);
    end
end
b = [gmr.w]';
c = ones(Nr,1);
H = Inf(Nr,Nr);
for i=1:Nr
    for j=1:Nr
        H(i,j) = mvnpdf(gmr(i).mu,gmr(j).mu,gmr(i).Sigma + gmr(j).Sigma);
    end
end
Hinv = inv(H);
b_star = Hinv*a - Hinv*c*(c'*Hinv*a-1)*inv(c'*Hinv*c);
w_star = num2cell(b_star);
[gmr.w] = w_star{:};
end

