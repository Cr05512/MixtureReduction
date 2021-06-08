function vL = vecFromTril(L)
assert(istril(L),'The matrix has to be lower triangular.');

vL = nonzeros(L);


end

