function varargout = refine(ref,gmr,gmh,varargin)
            
    availableRefinements = Experiment.getAvailableRefinements();
    res = strcmpi(ref,availableRefinements);
    assert(any(res), strcat(['Unknown refinement algorithm. The available algorithms are:',' ',strjoin(availableRefinements,', '),'.']));

    varargout = cell(1,nargout(ref));
    [varargout{:}] = feval(availableRefinements{res},gmr,gmh,varargin{:});

end
