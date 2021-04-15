function res = evalGlobalMeas(gmh,gmr,params)

assert(isfield(params,'globMeas'),'The global measure has not been defined.');
assert(any(strcmpi(params.globMeas,Experiment.getAvailableGlobalMeasures)),'The provided global measure is unknown.');
meas = params.globMeas;

if strcmpi(meas,'CTD')
    if isfield(params,'costMeas')
        res = feval(meas,gmh,gmr,params.costMeas);
    else
        disp('Cost measure not assigned for CTD, falling back to KLD.');
        res = feval(meas,gmh,gmr,'KLDij');
    end
        
elseif any(strcmpi(meas,{'MCKLD','ISMCKLD'}))
    if isfield(params,'nSamples')
        res = feval(meas,gmh,gmr,params.nSamples);
    else
        disp('Samples number not assigned for MCKLD, falling back to 1000000.');
        res = feval(meas,gmh,gmr,1000000);
    end
elseif any(strcmpi(meas,{'UTKLD','ISUTKLD'}))
    if isfield(params,'nRings')
        res = feval(meas,gmh,gmr,params.nRings);
    else
        disp('Rings number not assigned for UTKLD, falling back to 1.');
        res = feval(meas,gmh,gmr,1);
    end
elseif strcmpi(meas,'KLD12')
    if isfield(params,'nPoints')
        res = feval(meas,gmh,gmr,params.nPoints);
    else
        disp('Points number not assigned for KLD12, falling back to 1000 per dimension.');
        res = feval(meas,gmh,gmr,1000);
    end
else
    res = feval(meas,gmh,gmr);
end

end

