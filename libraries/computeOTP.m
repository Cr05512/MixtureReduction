function pi = computeOTP(C,wF,wG)
% pi = computeOTP(C,wF,wG):
% INPUTS:
% - C, cost matrix,
% - wF, marginal over row elements sum, that is pi*ones(Nr,1) = wF,
% - wG, marginal over column elements sum, that is pi'*ones(Nh,1) = wG.
% OUTPUTS:
% - pi, the optimal transportation plan.
% This function computes the optimal transportation plan for a two-way
% transportation polytope using linprog framework.
assert(size(C,1)==length(wF) && size(C,2)==length(wG) && ~isempty(C),'Check input parameters, dimensions are inconsistent or C is empty.');
assert(~isempty(C),'The cost matrix has to be non-empty.');
 
Nh = length(wF);
Nr = length(wG);
 
f = reshape(C,Nh*Nr,1);


Aeq = [kron(ones(1,Nr),eye(Nh));kron(eye(Nr),ones(1,Nh))];
beq = [wF;wG];
A = -eye(Nh*Nr);
b = zeros(Nh*Nr,1);

options = optimoptions('linprog','Display','none');

pi = reshape(linprog(f,A,b,Aeq,beq,[],[],options),Nh,Nr);


end