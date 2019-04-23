% 
% Calcula estatisticas de dois vectores
%
% input:  
% output: 
% 
% 
% Vasco Conde, 2019
%

function s = f_stats (do, dm)

dif_mo = dm-do;

prange = iqr(dif_mo);

pdata = prctile(dif_mo, [25 50 75]);

media = mean(dif_mo);
despad = std(dif_mo);

dmax = max(dif_mo);
dmin = min(dif_mo);

disp('');
disp('STATS');

pp = 4;
disp(['media = ' num2str(media,pp)]);
disp(['des pad = ' num2str(despad,pp)]);
disp(' ');
disp(['p25, p50, p75 = ' num2str(pdata(1),pp) ', ' num2str(pdata(2),pp) ', ' num2str(pdata(3),pp)]);
disp(['perc. range = ' num2str(prange,pp)]);
disp(' ')
disp(['min, max = ' num2str(dmin,pp) ', ' num2str(dmax,pp)]);
disp('');
