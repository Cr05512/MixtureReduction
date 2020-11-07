clc
clear
close all

%Type in the following list the algorithms you want to compare. Check
%GaussianMixtureReduction documentation for available algorithms.
algorithms = {'Runnals','CTDGMRA'};

%Type it the test to use.  Check GaussianMixtureReduction documentation for available tests.
test = 'random';
Nh = 20;
%Check GaussianMixtureReduction documentation for parameter meaning

params = initParams(Nh);

[fullMixture, gmr_vector, gmr_times] = GaussianMixtureReduction(algorithms,test,params);


