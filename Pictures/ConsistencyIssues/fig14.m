clc
clear
close all

test = 'userDefMixture2';
Nr = 1;

exp1 = Experiment('',           {struct()},...
                  'Runnalls',    struct('Nr',Nr),...
                  '',           {struct(),struct()},...
                  test,          struct());              

              
exp2 = Experiment('',           {struct()},...
                  'Runnalls',    struct('Nr',Nr),...
                  'ISEOptCon',           {struct(),struct()},...
                  test,          struct());      
              
exp3 = Experiment('',           {struct()},...
                  'Runnalls',    struct('Nr',Nr),...
                  'NISEOptCon',           {struct(),struct()},...
                  test,          struct());      
              
              
experiments = [exp1;exp2;exp3];
numTests = numel(experiments);

gm_vector = cell(numTests,1);
gmr_vector = cell(numTests,1);
time_vector = zeros(numTests,1);
for i=1:numTests
    [gmr_vector{i},gm_vector{i},time_vector(i)] = experiments(i).execute();
end


gmh = gm_vector{1};


% %In figure 2
% gmr_vector{3}.mu = 2;
% gmr_vector{3}.Sigma = 0.5;
% gmr_vector{3} = refine('NISEOptCon',gmr_vector{3},gmh);

% %In figure 3
% gmr_vector{2}.mu = 4;
% gmr_vector{2}.Sigma = 0.5;
% gmr_vector{2} = refine('ISEOptCon',gmr_vector{2},gmh);

%In figure 4
gmr_vector{2}.mu = 10;
gmr_vector{2}.Sigma = 0.5;
gmr_vector{2} = refine('ISEOptCon',gmr_vector{2},gmh);

X = genAxisPoints(gmh,1000);
h1 = plotGM1D(gmh,X,'k'); hold on
h2 = plotGM1D(gmr_vector{1},X,'r'); hold on
h3 = plotGM1D(gmr_vector{2},X,'g'); hold on
h4 = plotGM1D(gmr_vector{3},X,'b'); hold on
res1 = strcat('\mu:',' ',num2str(gmr_vector{1}.mu,'%2.4f'),', \Sigma:',' ',num2str(gmr_vector{1}.Sigma,'%2.4f'));
res2 = strcat('\mu:',' ',num2str(gmr_vector{2}.mu,'%2.4f'),', \Sigma:',' ',num2str(gmr_vector{2}.Sigma,'%2.4f'));
res3 = strcat('\mu:',' ',num2str(gmr_vector{3}.mu,'%2.4f'),', \Sigma:',' ',num2str(gmr_vector{3}.Sigma,'%2.4f'));

str1 = strcat(['KLD',' ',res1]);
str2 = strcat(['ISE',' ',res2]);
str3 = strcat(['NISE',' ',res3]);
set(h1,'LineWidth',4);
set(h2,'LineWidth',4);
set(h3,'LineWidth',4);
set(h4,'LineWidth',4);

grid minor
set(gca,'FontSize',34);
tPos = [0.710000637705608,1.01377633711507,0];
dim = [0.2 0.5 0.3 0.3];
textPos = [0.130529166666667,0.751855571542604,0.301041666666667,0.17231754781547];
%title({str1,str2,str3},'FontSize',34,'HorizontalAlignment','right','Units','normalized','Position',tPos);
annotation('textbox',dim,'String',{str1,str2,str3},'FitBoxToText','on',...
           'FontSize',34,'Position',textPos,'HorizontalAlignment','right',...
           'LineWidth',0.001,'BackgroundColor','w');
%set(gca,'OuterPosition',[0,0.000230515916575,1,0.875762628866544]);
%set(gca,'InnerPosition',[0.13,0.133092026878959,0.775,0.677218920739169]);
%set(gca,'Position',[0.13,0.133092026878959,0.775,0.677218920739169]);
%set(gca,'PlotBoxAspectRatio',[1,0.416666666666667,0.416666666666667]);

%legend('Original Mixture','ISE Barycenter','NISE Barycenter','FontSize',34)
legend('Original Mixture','KLD BSGA','ISE BSGA','NISE BSGA','FontSize',34,'Position',[0.686111116854267,0.702942198194097,0.219270827590177,0.222166493041824])
xlabel('x','FontSize',34)
ylabel('p(x)','FontSize',34)