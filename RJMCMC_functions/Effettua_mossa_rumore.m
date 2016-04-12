function Effettua_mossa_rumore(y,u,Settings,Sets)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global mc
q=mc.q;
lambdaB=mc.lambdaB;
c=Settings.cc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=rand();
% Calcolo le probabilità di nascita e di morte
if q==0
    B=1;
elseif q==length(Sets.Noise_all)
    B=0;
else
num=(lambdaB^(q+1))/factorial(q+1);
den=(lambdaB^(q))/factorial(q);
B=c*min(1,(num/den)^1);
end

if q>0
num=(lambdaB^(q-1))/factorial(q-1);
den=(lambdaB^(q))/factorial(q);
D=c*min(1,(num/den)^1);
end

% Estraggo la  mossa e la effetttuo

if z<B
  %display('Nascita Processo')
    Nascita_rumore(y,u,Settings,Sets)
elseif z<(B+D)
   % %display('Morte Processo')
    Morte_rumore(y,Settings)
else 
   %  %display('Aggiornamrento Processo')
 for i=1:Settings.repeat
     % Aggiorno la varianza dei termini di processo
 SigmaB_update(Settings)
 % Aggiorno i coefficienti del processo
 Noise_update(y);
 end
   
end
end