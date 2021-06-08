function [vBar,nReps] = runLengthEncoding(v)
% runLengthEncoding(v):
% INPUTS:
% - v, a vector which may contain repeated elements (vector).
% OUTPUTS:
% - vBar, vector containing non-repeated elements (vector),
% - nReps, number of occurrences for each element in vBar (vector).
% This function implements the run length encoding.

assert(~isempty(v),'The vector has to contain at least one element.');

N = length(v);
vBar = Inf(N,1);
nReps = zeros(N,1);

idx = 1;

nReps(1) = 1;
vBar(1) = v(1);

for i=2:N
    if v(i)==v(i-1)
        nReps(idx) = nReps(idx) + 1;
    else
        idx = idx + 1;
        nReps(idx) = 1;
        vBar(i) = v(i);
    end
        
end

vBar = vBar(vBar<Inf);
nReps = nReps(nReps>0);
    


end

