function varargout = genAxisPoints(gm,nPoints)
% varargout = genAxisPoints(gm,params):
% INPUT:
% - gm, a Gaussian mixture,
% - params, a struct containing parameters (struct).
% OUTPUT:
% - varargout, variable number of outputs containing the axis points in the
% 1D and 2D case.
% This function generates the axis points in the 1D and 2D cases useful to
% plot the resulting mixtures.
assert(~isempty(gm),'The Gaussian Mixture has to be non-empty.');

%At first we get an estimate of the GM center offset
[offset,P] = getMixtureMoments(gm);
errorEll = errorEllipses(offset,P,0.9999);
alpha = max(max(abs(errorEll)));
d = size(gm(1).mu,1);
mult = 1.2;
if d==1
    X = linspace(-mult*alpha+offset, mult*alpha+offset,nPoints);
    varargout{1} = X;
    %X = linspace(-1.5*(alpha + center), 1.5*(center + alpha), params.nPoints);
elseif d==2
    x1 = linspace(-mult*alpha + offset(1), mult*alpha + offset(1),nPoints);
    x2 = linspace(-mult*alpha + offset(2), mult*alpha + offset(2),nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];
    varargout{1} = X;
    varargout{2} = x1;
    varargout{3} = x2;
end

end

