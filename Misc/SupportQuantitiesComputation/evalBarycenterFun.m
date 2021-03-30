function f = evalBarycenterFun(gm, eta, costMeas)
%This function evaluates the barycenter function value for a given eta

w = [gm.w]';

f = w'*CostMatrix(gm,eta,costMeas);

end

