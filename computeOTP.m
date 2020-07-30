function pi = computeOTP(C,wF,wG)
%C is the cost matrix
%wF is the marginal over row elements sum, that is pi*ones(Nr,1) = wF
%wG is the marginal over column elements sum, that is pi'*ones(Nh,1) = wG

%This function computes the optimal transportation plan for a two-way
%transportation polytope
 
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