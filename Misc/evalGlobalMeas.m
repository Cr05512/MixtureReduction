function [res,str] = evalGlobalMeas(gmh,gmr,params)

assert(isfield(params,'globMeas'),'The global measure has not been defined.');
assert(any(strcmpi(params.globMeas,Experiment.getAvailableGlobalMeasures)),'The provided global measure is unknown.');
meas = params.globMeas;

if strcmpi(meas,'CTD')
    if isfield(params,'costMeas')
        costMeas = params.costMeas;
    else
        costMeas = 'KLDij';
        disp(strcat(['Cost measure not assigned for CTD, falling back to',' ',costMeas,'.']));
    end
    res = feval(meas,gmh,gmr,costMeas);
    str = strcat(meas,'-',costMeas);
        
elseif any(strcmpi(meas,{'MCKLD','ISMCKLD'}))
    if isfield(params,'nSamples')
        nSamples = params.nSamples;
    else
        nSamples = 1000000;
        disp(strcat(['Samples number not assigned for MCKLD, falling back to',' ',num2str(nSamples),'.']));
    end
    res = feval(meas,gmh,gmr,nSamples);
    str = strcat(meas,'-',num2str(nSamples));

elseif any(strcmpi(meas,{'UTKLD','ISUTKLD'}))
    if isfield(params,'nRings')
        nRings = params.nRings;
    else
        nRings = 1;
        disp(strcat(['Rings number not assigned for UTKLD, falling back to',' ',num2str(nRings),'.']));
    end
    res = feval(meas,gmh,gmr,nRings);
    str = strcat(meas,'-',num2str(nRings));

elseif any(strcmpi(meas,{'KLD12','BhattD12','BhattC12','Hell112','Hell212'}))
    if isfield(params,'nPoints')
        nPoints = params.nPoints;
    else
        nPoints = 1000;
        disp(strcat(['Points number not assigned for',' ',meas,', falling back to',' ',num2str(nPoints),' ','per dimension.']));
    end
    res = feval(meas,gmh,gmr,nPoints);
    str = strcat(meas,'-',num2str(nPoints));

else
    res = feval(meas,gmh,gmr);
    str = meas;
end

end

