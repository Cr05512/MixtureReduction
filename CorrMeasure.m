function C = CorrMeasure(gmh,gmr)
%This function computes the correlation measure between two gaussian
%mixtures.  D. J. Petrucci.  Gaussian mixture reduction for bayesian
%target tracking inclutter.Master’s thesis, Air Force Institute of Technology, 2005.

C = crossLikeness(gmh,gmr)/(selfLikeness(gmh)*selfLikeness(gmr));

end

