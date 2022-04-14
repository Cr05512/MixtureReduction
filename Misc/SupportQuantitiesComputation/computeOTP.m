function pi = computeOTP(C,wh,wr)
% pi = computeOTP(C,wF,wG):
% INPUTS:
% - C, cost matrix (Nh x Nr matrix),
% - wF, marginal over row elements sum, that is pi*ones(Nr,1) = wF (Nh x 1 vector),
% - wG, marginal over column elements sum, that is pi'*ones(Nh,1) = wG (Nr x 1 vector).
% OUTPUTS:
% - pi, the optimal transportation plan (Nh x Nr matrix).
% This function computes the optimal transportation plan for a two-way
% transportation polytope using linprog framework.
assert(size(C,1)==length(wh) && size(C,2)==length(wr) && ~isempty(C),'Check input parameters, dimensions are inconsistent or C is empty.');
assert(~isempty(C),'The cost matrix has to be non-empty.');
 
Nh = length(wh);
Nr = length(wr);
 
f = reshape(C,Nh*Nr,1);


Aeq = [kron(ones(1,Nr),eye(Nh));kron(eye(Nr),ones(1,Nh))];
beq = [wh;wr];
A = -eye(Nh*Nr);
b = zeros(Nh*Nr,1);

options = optimoptions('linprog','Algorithm','dual-simplex','OptimalityTolerance',1e-8,...
                        'ConstraintTolerance',1e-8,'MaxIterations',10000,'Display','none');

pi = linprog(f,A,b,Aeq,beq,[],[],options);
pi(pi<0)=0;
pi = reshape(pi,Nh,Nr);


end