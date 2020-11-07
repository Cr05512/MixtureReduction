%This demo uses all the algorithms available (or almost) in the framework
%in order to reduced the Gaussian mixture proposed by Crouse et al. in "A
%look at Gaussian mixture reduction algorithms." This demo evaluates the
%performances by means of Normalized Integral Squared Error and through
%earth mover's distance (W2). The results are plotted in a 4x4 matrix
%containing all the corresponding subplots.


clc
clear
close all


%Type in the following list the algorithms you want to compare. Check
%GaussianMixtureReduction documentation for available algorithms.
algorithms = {'Williams','Runnals','Salmond','West','COWA','GMRC','Wasserstein','GMRCWas','EM','DPHEM','CTDGMRA','BF'};

%Type it the test to use.  Check GaussianMixtureReduction documentation for available tests.
test = 'Crouse';

%Check GaussianMixtureReduction documentation for parameter meaning


[fullMixture, gmr_vector, gmr_times] = GaussianMixtureReduction(algorithms,test);


