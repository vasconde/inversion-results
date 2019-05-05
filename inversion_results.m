%
% Compara resultados da inversao com medições in-situ
% Gera: series temporais, graficos de dispersão e boxplots
%
% Vasco Conde, 2019
% 

clear all;
close all;

%% opcoes

% sobre os graficos de dispersao invertido vs observado
equal_and_tight = true;

%% carrega dados

% o dados vem de:
% /media/vasconde/WD_4TB/Lx_SMModel/inversaoFinal/
% runall.m e runall_12d.m

% 6 dias
load('sm_estimado_06dias.mat');

day_06 = day2;
sm_is_06 = sm_is;
sm_m_v1_06 = sm_m;
sm_m_v2_06 = sm_m3;

% 6 dias
load('sm_estimado_12dias.mat');


day_12 = day2;
sm_is_12 = sm_is;
sm_m_v1_12 = sm_m;
sm_m_v2_12 = sm_m3;


%% GRAFICOS - definicoes

ifig = 1;

font_size = 7;
fig_pos_size = [0 0 8 5.5];
m_size = 3;

font_size = 6;
fig_pos_size = [0 0 5.33 3.66];
m_size = 2;
if (equal_and_tight)
    font_size = 6;
    fig_pos_size = [0 0 5.33 5.33];
    m_size = 2;
end

%font_size = 6;
%fig_pos_size = [0 0 5.33 3.66];
%m_size = 2;

d_min = datetime('11/10/2017','InputFormat','dd/MM/yyyy'); 
d_max = datetime('16/03/2018','InputFormat','dd/MM/yyyy');
tr = 12

y_min = 0
tr_y = 0.1
y_max = 0.75

boxplotlims = [-0.25 0.25];

%% V1 (6 dias) - tm, disp, boxplot

% v1 (6 dias), tm 

disp('Gera grafico: time series SM, SM v1 (6 dias)');

figure(ifig)
ifig = ifig + 1;

plot(day_06, sm_is_06, 'o-r', 'MarkerFaceColor', 'r', 'MarkerSize',m_size);
hold on;
plot(day_06, sm_m_v1_06, 's-b', 'MarkerSize',m_size);


xlabel('data de aquisicao (slave)');
ylabel('SM [m^3 m^{-3}]');
ylim([y_min y_max]);
xlim([d_min d_max]);

% %set(gca,'XTick',[x_min:res_x:x_max]);
%set(gca,'YTick',[y_min:y_res:y_max]);

set(gca,'YTick',y_min:tr_y:y_max);

ax = gca;
%ax.XAxis.TickLabelFormat = '%,.1f';
%ax.YAxis.TickLabelFormat = '%,.0f';

grid on;

L = get(gca,'XLim');
%vecTicks = linspace(L(1),L(2),NumTicks);
vecTicks = [L(1):tr:L(2)];
set(gca,'XTick',vecTicks)

datetick('x','ddmmmyy','keepticks');
set(gca,'XTickLabelRotation',45);

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('ts_inv_v1_06d.png','-dpng', '-r300');


% v1 (6 dias), disp


disp('Gera grafico: grafico dispersao SM vs SM v1 (6 dias)');

figure(ifig)
ifig = ifig + 1;
 
plot(sm_is_06, sm_m_v1_06, 'or', 'MarkerSize',m_size);
hold on;
plot([y_min y_max], [y_min y_max],'-k');
ylim([y_min y_max]);
xlim([y_min y_max]);

set(gca,'XTick',y_min:tr_y:y_max);
set(gca,'YTick',y_min:tr_y:y_max);

xlabel(['SM_{in-situ} [mm^3 mm^{-3}]' ]);
ylabel(['SM_{InSAR} [mm^3 mm^{-3}]']);

grid on;
if (equal_and_tight)
    axis equal;
    axis tight;
end

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('sm_insitu_vs_insar_v1_06d.png','-dpng', '-r300');



% v1 (6 dias), stats, boxplot 

disp(' ');
f_stats (sm_is_06, sm_m_v1_06);
disp(' ');

figure(ifig)
ifig = ifig + 1;


boxplot(sm_m_v1_06 - sm_is_06, 'Labels',{'Bt = 6 dias'})

ylabel('SM_{InSAR} - SM_{in-situ} [mm^3 mm^{-3}]');
%xlabel('resolução temporal')

xlim_boxplot=get(gca,'xlim');
hold on
plot(xlim_boxplot,[0 0], 'k:')

ylim(boxplotlims);

grid on;

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('boxplot_sm_insitu_vs_insar_v1_06d.png','-dpng', '-r300');



%% V1 (12 dias) - tm, disp, boxplot

% v1 (12 dias), tm 



disp('Gera grafico: time series SM, SM v1 (12 dias)');

figure(ifig)
ifig = ifig + 1;

plot(day_12, sm_is_12, 'o-r', 'MarkerFaceColor', 'r', 'MarkerSize',m_size);
hold on;
plot(day_12, sm_m_v1_12, 's-b', 'MarkerSize',m_size);


xlabel('data de aquisicao (slave)');
ylabel('SM [m^3 m^{-3}]');
ylim([y_min y_max]);
xlim([d_min d_max]);

% %set(gca,'XTick',[x_min:res_x:x_max]);
%set(gca,'YTick',[y_min:y_res:y_max]);

set(gca,'YTick',y_min:tr_y:y_max);

ax = gca;
%ax.XAxis.TickLabelFormat = '%,.1f';
%ax.YAxis.TickLabelFormat = '%,.0f';

grid on;

L = get(gca,'XLim');
%vecTicks = linspace(L(1),L(2),NumTicks);
vecTicks = [L(1):tr:L(2)];
set(gca,'XTick',vecTicks)

datetick('x','ddmmmyy','keepticks');
set(gca,'XTickLabelRotation',45);

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('ts_inv_v1_12d.png','-dpng', '-r300');



% v1 (12 dias), disp

disp('Gera grafico: grafico dispersao SM vs SM v1 (12 dias)');

figure(ifig)
ifig = ifig + 1;
 
plot(sm_is_12, sm_m_v1_12, 'or', 'MarkerSize',m_size);
hold on;
plot([y_min y_max], [y_min y_max],'-k');
ylim([y_min y_max]);
xlim([y_min y_max]);

set(gca,'XTick',y_min:tr_y:y_max);
set(gca,'YTick',y_min:tr_y:y_max);

xlabel(['SM_{in-situ} [mm^3 mm^{-3}]' ]);
ylabel(['SM_{InSAR} [mm^3 mm^{-3}]']);

grid on;
if (equal_and_tight)
    axis equal;
    axis tight;
end

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('sm_insitu_vs_insar_v1_12d.png','-dpng', '-r300');



% v1 (12 dias), stats, boxplot

disp(' ');
f_stats (sm_is_12, sm_m_v1_12);
disp(' ');

figure(ifig)
ifig = ifig + 1;


boxplot(sm_m_v1_12 - sm_is_12, 'Labels',{'Bt = 12 dias'})

ylabel('SM_{InSAR} - SM_{in-situ} [mm^3 mm^{-3}]');

xlim_boxplot=get(gca,'xlim');
hold on
plot(xlim_boxplot,[0 0], 'k:')

ylim(boxplotlims);

grid on;

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('boxplot_sm_insitu_vs_insar_v1_12d.png','-dpng', '-r300');



%% V2 (6 dias) - tm, disp, boxplot

% v2 (6 dias), tm 



disp('Gera grafico: time series SM, SM v2 (6 dias)');

figure(ifig)
ifig = ifig + 1;

plot(day_06, sm_is_06, 'o-r', 'MarkerFaceColor', 'r', 'MarkerSize',m_size);
hold on;
plot(day_06, sm_m_v2_06, 's-b', 'MarkerSize',m_size);


xlabel('data de aquisicao (slave)');
ylabel('SM [m^3 m^{-3}]');
ylim([y_min y_max]);
xlim([d_min d_max]);

% %set(gca,'XTick',[x_min:res_x:x_max]);
%set(gca,'YTick',[y_min:y_res:y_max]);

set(gca,'YTick',y_min:tr_y:y_max);

ax = gca;
%ax.XAxis.TickLabelFormat = '%,.1f';
%ax.YAxis.TickLabelFormat = '%,.0f';

grid on;

L = get(gca,'XLim');
%vecTicks = linspace(L(1),L(2),NumTicks);
vecTicks = [L(1):tr:L(2)];
set(gca,'XTick',vecTicks)

datetick('x','ddmmmyy','keepticks');
set(gca,'XTickLabelRotation',45);

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('ts_inv_v2_06d.png','-dpng', '-r300');



% v2 (6 dias), disp


disp('Gera grafico: grafico dispersao SM vs SM v2 (6 dias)');

figure(ifig)
ifig = ifig + 1;
 
plot(sm_is_06, sm_m_v2_06, 'or', 'MarkerSize',m_size);
hold on;
plot([y_min y_max], [y_min y_max],'-k');
ylim([y_min y_max]);
xlim([y_min y_max]);

set(gca,'XTick',y_min:tr_y:y_max);
set(gca,'YTick',y_min:tr_y:y_max);

xlabel(['SM_{in-situ} [mm^3 mm^{-3}]' ]);
ylabel(['SM_{InSAR} [mm^3 mm^{-3}]']);

grid on;
if (equal_and_tight)
    axis equal;
    axis tight;
end

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('sm_insitu_vs_insar_v2_06d.png','-dpng', '-r300');



% v2 (6 dias), stats and boxplot


disp(' ');
f_stats (sm_is_06, sm_m_v2_06);
disp(' ');

figure(ifig)
ifig = ifig + 1;


boxplot(sm_m_v2_06 - sm_is_06, 'Labels',{'Bt = 6 dias'})

ylabel('SM_{InSAR} - SM_{in-situ} [mm^3 mm^{-3}]');

xlim_boxplot=get(gca,'xlim');
hold on
plot(xlim_boxplot,[0 0], 'k:')

ylim(boxplotlims);

grid on;

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('boxplot_sm_insitu_vs_insar_v2_06d.png','-dpng', '-r300');

%% V2 (12 dias) - tm, disp, boxplot

% v2 (12 dias), tm 

disp('Gera grafico: time series SM, SM v2 (12 dias)');

figure(ifig)
ifig = ifig + 1;

plot(day_12, sm_is_12, 'o-r', 'MarkerFaceColor', 'r', 'MarkerSize',m_size);
hold on;
plot(day_12, sm_m_v2_12, 's-b', 'MarkerSize',m_size);


xlabel('data de aquisicao (slave)');
ylabel('SM [m^3 m^{-3}]');
ylim([y_min y_max]);
xlim([d_min d_max]);

% %set(gca,'XTick',[x_min:res_x:x_max]);
%set(gca,'YTick',[y_min:y_res:y_max]);

set(gca,'YTick',y_min:tr_y:y_max);

ax = gca;
%ax.XAxis.TickLabelFormat = '%,.1f';
%ax.YAxis.TickLabelFormat = '%,.0f';

grid on;

L = get(gca,'XLim');
%vecTicks = linspace(L(1),L(2),NumTicks);
vecTicks = [L(1):tr:L(2)];
set(gca,'XTick',vecTicks)

datetick('x','ddmmmyy','keepticks');
set(gca,'XTickLabelRotation',45);

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('ts_inv_v2_12d.png','-dpng', '-r300');


% v2 (12 dias), disp


disp('Gera grafico: grafico dispersao SM vs SM v2 (12 dias)');

figure(ifig)
ifig = ifig + 1;
 
plot(sm_is_12, sm_m_v2_12, 'or', 'MarkerSize',m_size);
hold on;
plot([y_min y_max], [y_min y_max],'-k');
ylim([y_min y_max]);
xlim([y_min y_max]);

set(gca,'XTick',y_min:tr_y:y_max);
set(gca,'YTick',y_min:tr_y:y_max);

xlabel(['SM_{in-situ} [mm^3 mm^{-3}]' ]);
ylabel(['SM_{InSAR} [mm^3 mm^{-3}]']);

grid on;
if (equal_and_tight)
    axis equal;
    axis tight;
end

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('sm_insitu_vs_insar_v2_12d.png','-dpng', '-r300');


% v2 (12 dias), stats, boxplot

disp(' ');
f_stats (sm_is_12, sm_m_v2_12);
disp(' ');

figure(ifig)
ifig = ifig + 1;


boxplot(sm_m_v2_12 - sm_is_12, 'Labels',{'Bt = 12 dias'})

ylabel('SM_{InSAR} - SM_{in-situ} [mm^3 mm^{-3}]');

xlim_boxplot=get(gca,'xlim');
hold on
plot(xlim_boxplot,[0 0], 'k:')

ylim(boxplotlims);

grid on;

set(gca,'fontsize', font_size)
fig = gcf;
fig.PaperUnits = 'centimeters';
fig.PaperPosition = fig_pos_size;

print('boxplot_sm_insitu_vs_insar_v2_12d.png','-dpng', '-r300');


