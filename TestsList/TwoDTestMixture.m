function [gm,newParams] = TwoDTestMixture()
% gm = testCrouse():
% OUTPUTS:
% - gm, a Gaussian mixture,
% - Nh, new number of original components (scalar),
% - Nr, new number of reduced components (scalar),
% - d, new state dimension (scalar),
% - delta, new component center (scalar).
% This script generates a one dimensional Gaussian mixture as shown in the
% paper of D. F. Crouse et al. "A look at Gaussian Mixture Reduction
% Algorithms". Proc. 14th Int. Conf. Inf. Fusion, pages 1–8, 2011
Nh = 10;
d = 2;


w = [0.0908    0.1175    0.1263    0.1412    0.0492    0.1175    0.0874    0.1152    0.0664    0.0885]';
mu = [-6.4222   -3.7989   -2.6473   -2.9468    5.4339   -1.4264   -2.2787   -3.8219   -6.0227    0.3906;...
      6.0024    7.6506    1.6965   -6.3887    1.1112   -3.6245    5.5056   -3.2400   -3.3045   -3.0766];
  
  
Sigma = zeros(d,d,Nh);

Sigma(:,:,1) = [0.2339    0.1910;...
    0.1910    0.6312];

Sigma(:,:,2) = [0.9583    0.6307;...
    0.6307    1.6569];
      
Sigma(:,:,3) = [0.9689    0.0314;...
    0.0314    0.8828];
      
Sigma(:,:,4) = [0.4235   -0.2386;...
   -0.2386    0.6185];

Sigma(:,:,5) = [1.7122    0.2322;...
    0.2322    0.7742];
      
Sigma(:,:,6) = [0.4197    0.0059;...
    0.0059    0.8089];
      
Sigma(:,:,7) = [0.4412   -0.1326;...
   -0.1326    0.3771];
      
Sigma(:,:,8) = [0.6906    0.2550;...
    0.2550    1.3679];
      
Sigma(:,:,9) = [0.6056    0.0795;...
    0.0795    0.4694];
      
Sigma(:,:,10) = [0.2964    0.2399;...
    0.2399    0.5915];
       
      

gm = mixtureFromParams(w,mu,Sigma);
newParams = struct('Nh',Nh,'d',d);



end

