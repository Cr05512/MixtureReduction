function varargout = refine(ref,gmr,gmh,varargin)
            
    availableRefinements = getAvailableRefinements();
    assert(ismember(lower(ref),lower(availableRefinements)), strcat(['Unknown refinement algorithm. The available algorithms are:',' ',strjoin(availableRefinements,', '),'.']));

    varargout = cell(1,nargout(ref));
    [varargout{:}] = feval(ref,gmr,gmh,varargin{:});

end
