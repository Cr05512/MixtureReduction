function pi = computeOTP(gmh,gmr)

%This function computes the optimal transportation plan
 
Nh = length(gmh);
Nr = length(gmr);
 
% marginals
p = [gmh.w]'; %for colums sum
q = [gmr.w]'; % for row sum
 
M = zeros(Nh,Nr);
for i=1:length(gmh)
    for j=1:length(gmr)
        M(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
    end
end

f = reshape(M,Nh*Nr,1);


Aeq = [kron(ones(1,Nr),eye(Nh));kron(eye(Nr),ones(1,Nh))];
beq = [p;q];
A = -eye(Nh*Nr);
b = zeros(Nh*Nr,1);

options = optimoptions('linprog','Display','none');

pi = reshape(linprog(f,A,b,Aeq,beq,[],[],options),Nh,Nr);


end