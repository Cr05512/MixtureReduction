function [res,meas] = evalGlobalMeas(gmh,gmr,varargin)

assert(isfield(varargin{:},'globMeas'),'The global measure has not been defined.');
assert(any(strcmpi(varargin{:}.globMeas,Experiment.getAvailableGlobalMeasures)),'The provided global measure is unknown.');
meas = varargin{:}.globMeas;
params = rmfield(varargin{:},'globMeas');
varargin = {};

%We retrieve the global measure input list
measInputList = getFunArgNames(meas);
%We strip the gmh and gmr inputs
measInputList(strcmp(measInputList,'gmh')) = [];
measInputList(strcmp(measInputList,'gmr')) = [];
%All the left fields will be eventually none or additional parameters
%required by the specific global measure
%We now iterate over all the passed parameters to associate the
%corresponding one to the specific global measure input
for i=1:length(measInputList)
    if isfield(params,measInputList{i})
        varargin{i} = params.(measInputList{i});
        params = rmfield(params,measInputList{i});
    end
end

if ~isempty(fieldnames(params)) && any(strcmpi(measInputList,'varargin'))
    %The left params list is not empty and one argument is varargin
    varargin{end+1} = params;
end

res = feval(meas,gmh,gmr,varargin{:});

%MISC

if strcmpi(meas,'CTD')
    meas = strcat([meas,'-',varargin{1}]);
elseif any(strcmpi({'BC12','BD12','CrossEntropy12','H112','H212','ISMCKLD','ISUTKLD','KLD12','MCKLD','RKLD12','VLBEL'},meas))
    meas = strcat([meas,'-',num2str(varargin{1})]);
end


% if strcmpi(meas,'CTD')
%     if isfield(params,'costMeas')
%         costMeas = params.costMeas;
%                 
%     else
%         costMeas = 'KLDij';
%         disp(strcat(['Cost measure not assigned for CTD, falling back to',' ',costMeas,'.']));
%     end
%     res = feval(meas,gmh,gmr,costMeas);
%     str = strcat(meas,'-',costMeas);
%         
% elseif any(strcmpi(meas,{'MCKLD','ISMCKLD'}))
%     if isfield(params,'nSamples')
%         nSamples = params.nSamples;
%     else
%         nSamples = 1000000;
%         disp(strcat(['Samples number not assigned for MCKLD, falling back to',' ',num2str(nSamples),'.']));
%     end
%     res = feval(meas,gmh,gmr,nSamples);
%     str = strcat(meas,'-',num2str(nSamples));
% 
% elseif any(strcmpi(meas,{'UTKLD','ISUTKLD'}))
%     if isfield(params,'nRings')
%         nRings = params.nRings;
%     else
%         nRings = 1;
%         disp(strcat(['Rings number not assigned for UTKLD, falling back to',' ',num2str(nRings),'.']));
%     end
%     res = feval(meas,gmh,gmr,nRings);
%     str = strcat(meas,'-',num2str(nRings));
% 
% elseif any(strcmpi(meas,{'KLD12','BD12','BC12','Hell112','Hell212','CrossEntropy12'}))
%     if isfield(params,'nPoints')
%         nPoints = params.nPoints;
%     else
%         nPoints = 1000/(d^2);
%         disp(strcat(['Points number not assigned for',' ',meas,', falling back to',' ',num2str(nPoints),' ','per dimension.']));
%     end
%     res = feval(meas,gmh,gmr,nPoints);
%     str = strcat(meas,'-',num2str(nPoints));
%     
% elseif strcmpi(meas,'VLBEL')
%     if isfield(params,'I')
%         I = params.I;
%     else
%         I = 1;
%     end
%     res = feval(meas,gmh,gmr,I);
%     str = strcat(meas,'-',num2str(I));
% 
% else
%     res = feval(meas,gmh,gmr);
%     str = meas;
% end

end

