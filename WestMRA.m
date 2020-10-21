function gmr = WestMRA(gm,Nr,algo,gamma)
% gmr = WestMRA(gm, Nr, algo, gamma):
% INPUTS:
% - gm, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture,
% - algo, set it to 0 for West algorithm and to 1 for the Enhanced West,
% - gamma, the maximum dissimilarity threshold. If left empty or set to Inf
%   all the components will be merged according to the algorithm principle.
%   Setting it to a lower value will prevent to merge nearest neighbors
%   which are too far.
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements both the West and Enhanced West algorithms.
if nargin < 3
    algo = 0; %Classic West Algorithm
    gamma = Inf;
elseif nargin < 4 
    gamma = Inf;
end
assert(algo==0 || algo==1,'The algo parameter can take either 0 or 1 as value.');
assert(gamma>0,'gamma has to be greater than zero.');

%n = size(gm(1).mu,1);
gmr = gm;

detVec = zeros(length(gmr),1);
dist = Inf(length(gmr),1);

while length(gmr)-Nr>0
    
    for i=1:length(gmr)
        detVec(i) = det(gmr(i).Sigma);
    end
    
    w = [gmr.w]';

    if algo==1
        w = w./detVec;
    end

    %Jrr = 1/sqrt((2*pi)^n * detVec);
    
    
    [~,i] = min(w);
    
    for j=1:length(gmr)
        if j~=i
           % if algo==0
                pdf_merged = mpMerge([gmr(i);gmr(j)]);
                dist(j) = gmr(i).w*gmr(j).w/(gmr(i).w+gmr(j).w)*mahalSquaredDist(gmr(i).mu,gmr(j).mu,pdf_merged.Sigma);
            %else
                %dist(j) = -2*mvnpdf(gmr(j).mu,gmr(i).mu,gmr(j).Sigma+gmr(i).Sigma) + Jrr(i) + Jrr(j);
            %    dist(j) = ISE(gmr(i),gmr(j));
            %end
        else
            dist(j) = Inf;
        end
    end
    dist_bar = dist(dist<gamma);
    if ~isempty(dist_bar)
        j = find(dist == min(dist_bar),1);
        gmr(i) = mpMerge([gmr(i);gmr(j)]);
        gmr(j) = [];
    elseif isempty(dist_bar) && length(gmr)>Nr
        disp('Reduction terminated before reaching the desired value.');
        break;
    end
    
    detVec = detVec(1:end-1);
    dist = dist(1:end-1);
    
    
end

