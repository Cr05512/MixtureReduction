function [gm,testParamsBlock] = genGaussMixFromTest(test,testParams)
if nargin < 2
    disp('Assuming default parameters for the test.');
    testParams = {};
end

availableTests = Experiment.getAvailableTests(); %Check the corresponding documentation for further details
assert(ismember(lower(test),lower(availableTests)), strcat(['Unknown test. The available tests are:',' ',strjoin(availableTests,', '),'.']));

testParamsBlock = struct();
varargout = cell(1,nargout(test));
if strcmpi(test,'random')
    testParamsBlock.('Nh') = 20;
    testParamsBlock.('d') = 1;
    testParamsBlock.('alpha') = 5;
    testParamsBlock.('beta') = 0.09;
    testParamsBlock.('delta') = 0;
    testParamsBlock.('rngSeed') = randi(100000);

elseif ismember(lower(test),{'test2','test3','test4'})
    testParamsBlock.('Nh') = 20;
    testParamsBlock.('r') = 10;
    testParamsBlock.('beta') = 0.09;

end

if isstruct(testParams)
    userTestFields = fieldnames(testParams);
    for i=1:length(userTestFields)
        if isfield(testParamsBlock,userTestFields{i})
            testParamsBlock.(userTestFields{i}) = testParams.(userTestFields{i});
        else
            disp('The provided param is not a known param.');
        end
    end
end

testParamsVector = struct2cell(testParamsBlock);
[varargout{:}] = feval(test,testParamsVector{:});
gm = varargout{1};
if numel(varargout)>1
    newParams = varargout{2};
    if isstruct(newParams)
        customFields = fieldnames(newParams);
        for i=1:length(customFields)
             testParamsBlock.(customFields{i}) = newParams.(customFields{i});
        end
    end
end


end

