function gmr = KMeansMod(gmh,gmr,cost_meas,NKMeansSteps)
% gmr = KMeans(gmh,gmr,cost_meas,NKMeansSteps):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - cost_meas, the cost functio used to compute the distance between components,
% - NKMeansSteps, maximum number of allowed iterations for the KMeans algorithm.
% OUTPUTS:
% - gmr, the refined mixture.
% This function operates a K-Means refinement over the reduced mixture in
% order to improve the corresponding parameters.
if nargin < 3
    cost_meas = 'KLD';
    NKMeansSteps = 100;
elseif nargin < 4
    NKMeansSteps = 100;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');
assert(strcmp(cost_meas,'KLD') || strcmp(cost_meas,'W2') || strcmp(cost_meas,'GJSD') || strcmp(cost_meas,'MKLD'),...
            'The allowed cost functions are (1) KLD, (2) MKLD, (3) W2 and (4) GJSD.');


C = Inf(length(gmh),length(gmr));
Rnk = zeros(size(C));
clusters = cell(length(gmr),1);
J = Inf;
JPrev = J;

for k=1:NKMeansSteps
   
    C = CostMatrix(gmh,gmr,cost_meas);

    [~,assignVector] = min(C,[],2);
    
    for i=1:length(gmh)
        Rnk(i,assignVector(i)) = 1;
    end
    
    J = trace(Rnk'*C);
    
    if abs(J-JPrev)<1e-12
        break;
    end

    
    ind = [];
    
    for l=1:length(gmr)
        clusters{l} = gmh(logical(Rnk(:,l)));
        if ~isempty(clusters{l})
            ind = [ind;l];
        end
    end
    
    clusters = clusters(ind);
    
    
    for l=1:length(clusters)
        w_tilde = num2cell(ones(length(clusters{l}),1)./length(clusters{l}));
        [clusters{l}.w] = w_tilde{:};
        if strcmp(cost_meas,'KLD') || strcmp(cost_meas,'MKLD') || strcmp(cost_meas,'GJSD') 
            clusters{l} = mpMerge(clusters{l});
        elseif strcmp(cost_meas,'W2')
            clusters{l} = WassersteinBarycenter(clusters{l},100);
        end
    end
    
    gmr = [clusters{:}]';
    JPrev = J;
    Rnk = zeros(size(C));
end

clusters = cell(length(gmr),1);
Rnk = zeros(size(C));

for i=1:length(gmh)
    Rnk(i,assignVector(i)) = 1;
end

ind = [];
for l=1:length(gmr)
    clusters{l} = gmh(logical(Rnk(:,l)));
    if ~isempty(clusters{l})
        ind = [ind;l];
    end
end

clusters = clusters(ind);

for l=1:length(clusters)
    if strcmp(cost_meas,'KLD') || strcmp(cost_meas,'MKLD') || strcmp(cost_meas,'GJSD') 
        clusters{l} = mpMerge(clusters{l});
    elseif strcmp(cost_meas,'W2')
        clusters{l} = WassersteinBarycenter(clusters{l},100);
    end
end

gmr = [clusters{:}]';


% if k<NKMeansSteps
%     disp(horzcat('KMeans converged after ',num2str(k),' steps'));
% else
%     disp('KMeans did not converge in the maximum given steps');
% end

end
