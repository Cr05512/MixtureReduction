function B = BurgMatrixDivergence(S1,S2)
% B = BurgMatrixDivergence(S1,S2):
% INPUTS:
% - S1, S2, respectively two square matrices.
% OUTPUTS:
% - B, the Burg matrix divergence (scalar).
% This function computes the Burg Matrix Divergence between two matrices.
if nargin < 2
    disp('Not enough input arguments');
end

assert(det(S2)~=0,'The second argument matrix has to be non-singular.');
d = size(S1,1);
B = trace(S2\S1)-log(det(S2\S1))-d;

end

