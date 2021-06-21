function [] = plotResults(gmr_vector,gm_vector,time_vector,experiments,showPlot,globalMeas,nPoints)
% plotResults(gmr_vector,gm_vector,gmr_times,experiments,costMeas):
% INPUT:
% - gmr_vector, vector containing reduced mixtures (numExperiments x 1 vector),
% - gm_vector, vector containing original mixtures (numExperiments x 1 vector),
% - gmr_times, vector containing execution times (numExperiments x 1 vector),
% - experiments, vector containing the experiments (numExperiments x 1 vector),
% - showPlot, flag equal to 1 to show the plot (binary variable),
% - globalMeas, string cell array containing the global measures to evaluate the
%   final results,
% - nPoints, number of points for the 1D and 2D plots.
% This function plots the results of each experiment in different windows.
% Together with the plots, all the data used to generate such experiment
% and result are reported in the title bar.

if nargin < 6
    globalMeas = {struct('globMeas','ISE')};
    nPoints = 500;
elseif nargin < 7
    nPoints = 500;
end

numExperiments = numel(experiments);

%Check if the test is the same for different experiments

for i=1:numExperiments
    
    if ~isempty(experiments(i).getAlgo) && ~isempty(experiments(i).getTest)
        
        str = buildParamString(experiments(i),gm_vector{i},gmr_vector{i},time_vector(i),globalMeas);
        %str = {''};
        if experiments(i).getTestParams.d == 1 && showPlot==1
            figure(i)
            
            sgt = sgtitle(str,'interpreter','latex');
            set(sgt, 'horizontalAlignment', 'left')
       
            X = genAxisPoints(gm_vector{i},nPoints);
            subplot(1,1,1);
            plotGM1D(gm_vector{i},X,'k'); hold on
            plotGM1D(gmr_vector{i},X,'r'); hold on
            xlim([min(X) max(X)])

            grid minor
            
            legendStr = '';
            if ~isempty(experiments(i).getPrune)
                legendStr = strcat(experiments(i).getPrune,'+');
            end
            legendStr = strcat(legendStr,experiments(i).getAlgo);
            if ~isempty(experiments(i).getRef)
                legendStr = strcat(legendStr,'+',experiments(i).getRef);
            end
            
            legend('Original',legendStr,'FontSize',12,'interpreter','latex');
            
        elseif experiments(i).getTestParams.d == 2 && showPlot==1
            figure(i)

            sgt = sgtitle(str,'interpreter','latex');
            set(sgt, 'horizontalAlignment', 'left')
       
            [X,x1,x2] = genAxisPoints(gm_vector{i},nPoints);
            
            subplot(1,2,1)

            plotGM2D(gm_vector{i},X,x1,x2); hold on
            xlim([min(x1) max(x1)])
            ylim([min(x2) max(x2)])
            for k=1:numel(gm_vector{i})
                errEllVals = errorEllipses(gm_vector{i}(k).mu,gm_vector{i}(k).Sigma,0.95);
                plot(errEllVals(1,:),errEllVals(2,:)); hold on
            end
            set(gca,'YDir','normal');
            axis('square');
            grid minor
            title('Original Mixture','interpreter','latex','FontSize',14);
            subplot(1,2,2)
            plotGM2D(gmr_vector{i},X,x1,x2); hold on
            title('Reduced Mixture','interpreter','latex','FontSize',14);
            xlim([min(x1) max(x1)])
            ylim([min(x2) max(x2)])
            for k=1:numel(gmr_vector{i})
                errEllVals = errorEllipses(gmr_vector{i}(k).mu,gmr_vector{i}(k).Sigma,0.95);
                plot(errEllVals(1,:),errEllVals(2,:)); hold on
            end
            set(gca,'YDir','normal');
            axis('square');
            grid minor
        end
        if strcmpi(experiments(i).getTest,'random')
            str{end} = strcat([str{end},' Random seed:',' ',num2str(experiments(i).getTestParams.rngSeed)]);
        end
        disp(strcat(['Experiment: ',num2str(i),', ',str{end}]));
        
        
    end
        
end



end