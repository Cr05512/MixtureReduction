function gmr = PCMRA(gmh,Nr,redAlgo,measFlag,costMeas,lambda,maxiter,p,h)
% gmr = PCMRA(gmh,Nr,redAlgo,measFlag,costMeas,lambda,maxiter,p,h):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture (scalar),
% - redAlgo, reduction algorithm used in the greedy reduction (char array),
% - measFlag, binary variable for choosing between NISE or CTD as eval metrics. 0 for NISE 1 for CTD (binary variable),
% - costMeas, cost measure used in the clustering (char array),
% - lambda, entropic regularization parameter (scalar),
% - maxiter, maximum number of iterations for the final refinement (scalar),
% - p, parameter used to split the reduction in p intermediate sub-reductions (scalar),
% - h, number of intermediate refinement iterations (scalar).
% OUTPUTS:
% - gmr, reduced Gaussian mixture.
% This function implements the Progressive-Clustering Mixture Reduction
% Algorithm (PCMRA). Note that the subreductions are logarithmic, that is
% the larger are the original mixture, the bigger will be the first
% subreductions.

if nargin < 3
    redAlgo = 'Runnalls';
    measFlag = 0;
    costMeas = 'KLD';
    lambda = 0.05;
    maxiter = 50;
    p = 5;
    h = 1;
elseif nargin < 4
    measFlag = 0;
    costMeas = 'KLD';
    lambda = 0.05;
    maxiter = 50;
    p = 5;
    h = 1;
elseif nargin < 5
    costMeas = 'KLD';
    lambda = 0.05;
    maxiter = 50;
    p = 5;
    h = 1;
elseif nargin < 6
    maxiter = 50;
    lambda = 0.05;
    p = 5;
    h = 1;
elseif nargin < 7
    maxiter = 50;
    p = 5;
    h = 1;
elseif nargin < 8
    p = 5;
    h = 1;
elseif nargin < 9
    h = 1;
end

assert(measFlag==0 || measFlag==1,'The measure flag can be either 0 or 1.');
assert(p>0 && p==floor(p),'The reduction step has to be an integer greater than zero.')
assert(h>=0,'The number of refinement iterations has to be greater than zero.');
assert(~isempty(gmh),'The mixture has to contain at least one element.');

gmr = gmh;
Nh = numel(gmh);

if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end
Jhh = selfLikeness(gmh);

if lambda == 0
    p = 1;
end

for k = 1:p
    gamma = (Nr/Nh)^(1/p);
    Nk = round(gamma^k * Nh);
    
    gmr1 = reduce(redAlgo,gmr,Nk);
    gmr1 = refine('CTDGMRA',gmr1,gmh,costMeas,lambda,h);
    
    
    if lambda>0 %Doing hard-clustering after pruning might yield bad perfomances
        
        gmr2 = pruning('kSmallestPruning',gmr,numel(gmr)-Nk);
        gmr2 = refine('CTDGMRA',gmr2,gmh,costMeas,lambda,h);
        if measFlag == 0
            Jhr1 = crossLikeness(gmh,gmr1);
            Jhr2 = crossLikeness(gmh,gmr2);
            Jrr1 = selfLikeness(gmr1);
            Jrr2 = selfLikeness(gmr2);
            c1 = (Jhh -2*Jhr1 + Jrr1)/(Jhh + Jrr1);
            c2 = (Jhh -2*Jhr2 + Jrr2)/(Jhh + Jrr2);
        else
            c1 = CTD(gmh,gmr1,costMeas);
            c2 = CTD(gmh,gmr2,costMeas);
        end

        if c1 < c2
            gmr = gmr1;
        else
            gmr = gmr2;
            %disp('Pruning!');
        end
    else
        gmr = gmr1;
    end
    
    
    
end

%gmr = refine('CTDGMRA',gmr,gmh,'KLD',0.0,maxiter);

gmr = refine('clusteringGMRC',gmr,gmh,1);


end

