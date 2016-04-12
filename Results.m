%% Carico l'ultimo salvataggio
function Results()
clc
clear all
close all
X=dir('.\Savings\*.mat');
     [~,d]=sort([X.datenum]);
     lf=X(d(end)).name
     load(['.\Savings\',lf]);
clear X d lf

%% Calcolo il modello di processo più frequente
bestPID=Series.ModeProcess(end);
bestP=str2num(Series.model_from_codeP(bestPID));
row=0;
for j=bestP
    row=row+1;
    CSV_MATRIX{row,1}=func2str(Sets.Process_all{j});
end
%% Calcolo i coefficienti
row=0;
for j=1:size(Series.Ak{bestPID},1)
    row=row+1;
    CSV_MATRIX{row,2}=maxhistplot(Series.Ak{bestPID}(row,:),0);
    CSV_MATRIX{row,3}=std(Series.Ak{bestPID}(row,:),0);
end

%% Calcolo il modello dirumore più frequente
bestNID=Series.ModeNoise(end);
if ~isempty(Series.Bq{bestNID})
bestN=str2num(Series.model_from_codeN(bestNID));
row=length(bestP);
for j=bestN
    row=row+1;
    CSV_MATRIX{row,1}=func2str(Sets.Noise_all{j});
end
%% Calcolo i coefficienti
row=+length(bestP);

for j=1:size(Series.Bq{bestNID},1)
    row=row+1;
    CSV_MATRIX{row,2}=maxhistplot(Series.Bq{bestNID}(row-length(bestP),:),0);
    CSV_MATRIX{row,3}=std(Series.Bq{bestNID}(row-length(bestP),:),0);
end
end
%%
filname='Risultato_identificazione.csv';
cell2csv(filname, CSV_MATRIX, ',', 2016, ',')
display(['Results_written in : ',filname]);
end
