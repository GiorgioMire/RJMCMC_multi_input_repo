function Nascita_rumore(y,u,Settings,Sets)
global mc
%__ Estraggo da quelli disponibili il termine che verrà proposto
New.pos=randi(length(mc.Noise_avaiable));
% Estraggo un nuovo termine da quelli disponibili
New.q=mc.q+1;

% Calcolo il regressore che si avrebbe se accettassi il nuovo termine
[New.Eq]=compute_Eq_New(y,u,Sets,New.pos);

% Calcolo il rapporto di accettazione della mossa
[rb,New.bq]=Compute_RB(y,mc,New);
gamma=min(1,rb);
z=rand();
% Decido se accettare o meno la modda
if z<gamma
    % Mossa accettata
%   display('accettata')
  % Aggiorno il vettore dei termini scelti
mc.Noise_choosen=[mc.Noise_choosen,mc.Noise_avaiable(New.pos)];
% Elimino il termine accettato dal vettore dei termini disponibili
mc.Noise_avaiable(New.pos)=[];
% Aggiorno il numero di termini del processo
mc.q=New.q;

% Aggiorno il vettore dei coeffcienti
mc.bq=New.bq;
% Aggiorno la matrice di regressione del processo
mc.Eq=New.Eq;
else
    
 % Mossa rifiutata, dunque effettuo l'aggiornamento dei coefficienti  
   %display('rifiutata')
 
 for i=1:Settings.repeat
     % Aggiorno la varianza dei coefficienti
 SigmaB_update(Settings)
 % Aggiorno i coefficienti
 Noise_update(y);
 end
    
end
end