clc
clear
close all

availableAlgorithms = {'Williams','Runnals','Salmond','West','COWA','GMRC','GMRCMod','Wasserstein','GMRCWas','GMRCWasMod','EM','DPHEM','CTDGMRA','BF','Custom'}; %Check the corresponding documentation for further details

%Type in the following list the algorithms you want to compare. Check
%GaussianMixtureReduction documentation for available algorithms.
algorithms = {'Runnals','Custom','CTDGMRA'};
%algorithms = availableAlgorithms;

%Type it the test to use.  Check GaussianMixtureReduction documentation for available tests.
test = 'random';
%Check GaussianMixtureReduction documentation for parameter meaning

%params = initParams();

% For default params check initParams.m script. 

params = struct('Nh',40,'Nr',5,'d',1,'lambda',0.1,'showResults',1);

[fullMixture, gmr_vector, gmr_times] = GaussianMixtureReduction(algorithms,test,params);


