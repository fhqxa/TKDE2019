clear;
clc;
close all;
fontsize = 18;
figure1 = figure('Color',[1 1 1]);
load 'ZH6BaselineHIFSRRSVMfam Protein194'
FHMean(2,6)=0;
FHMean(2,47)=0.7291;%赋值baseline的结果
% stem(FHMean(2,:));
 %stem(FHMean(2,[1,4,7,10,13,16,19,23]),'*--');
   stem(FHMean(2,[1:5,6,20,30,40,47]),'--','LineWidth',1.5);
%plot(FHMean(2,[1:5,20,30,40,47]),'*--','LineWidth',1.5);
line([0,15],[0.7291,0.7291],'LineWidth',1);
 axis([0.4,10.5,0.6,0.78]);
 legend('HiRR-FS ','Baseline',fontsize);
ylabel('Hierarchical \it F\rm_1-measure','FontSize',fontsize);
xlabel('Number of selected features');
annotation(figure1,'textbox',...
    [0.515285714285713 0.411904761904762 0.0615000000000001 0.0404761904761912],...
    'Color',[0 0.447058823529412 0.741176470588235],...
    'String',{'......'},...
    'FontSize',28,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
Xtick_pos=1:10
Xtick_label={'10','20','30','40','50','\cdot\cdot\cdot\cdot\cdot\cdot','200','300','400','All'}; 
set(gca,'XTickLabel',Xtick_label, 'XTick',Xtick_pos,'FontSize',fontsize,'FontName','times');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load 'ZH6BaselineHIFSRRSVMfam DD'
figure1 = figure('Color',[1 1 1]);
FHMean(2,6)=0;
stem(FHMean(2,[1:5,6,20,30,40,47]),'--','LineWidth',1.5);
%plot(FHMean(2,[1:5,20,30,40,47]),'*--','LineWidth',1.5);
line([0,15],[0.8601,0.8601],'LineWidth',1);
 axis([0.4,10.5,0.6,0.94]);
 legend('HiRR-FS ','Baseline',fontsize);
ylabel('Hierarchical \it F\rm_1-measure','FontSize',fontsize);
xlabel('Number of selected features');
annotation(figure1,'textbox',...
    [0.515285714285713 0.411904761904762 0.0615000000000001 0.0404761904761912],...
    'Color',[0 0.447058823529412 0.741176470588235],...
    'String',{'......'},...
    'FontSize',28,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
Xtick_pos=1:10
Xtick_label={'10','20','30','40','50','\cdot\cdot\cdot\cdot\cdot\cdot','200','300','400','All'}; 
set(gca,'XTickLabel',Xtick_label, 'XTick',Xtick_pos,'FontSize',fontsize,'FontName','times');
