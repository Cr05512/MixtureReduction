function f = evalBarycenterFun(gm, eta, costMeas, varargin)
%This function evaluates the barycenter function value for a given eta

if nargin < 3
    costMeas = 'FKLDij';
    disp('Using the default measure (FKLDij) for the f(\eta) function.');
end
w = [gm.w]';

f = w'*CostMatrix(gm,eta,costMeas,varargin{:});

end

