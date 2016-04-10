function Morte_rumore(y,Settings)
global mc
New.pos=randi(length(mc.Noise_choosen));
New.q=mc.q-1;
New.Eq=mc.Eq;
New.Eq(:,New.pos)=[];
[rb,New_bq]=Compute_RB(y,mc,New);
gamma=min(1,rb);

% if ~exist('plot_gamma')
%     plot_gamma=[];
% end
% plot_gamma=[plot_gamma,gamma];
% figure(2)
% plot(plot_gamma)
% pause(0.1)

z=rand();

if z<gamma
    % display('accettata')
    mc.Noise_avaiable=[mc.Noise_avaiable,mc.Noise_choosen(New.pos)];
    mc.Noise_choosen(New.pos)=[];
    mc.q=New.q;
    mc.bq=New_bq;
    if isnan(New_bq)
        error('E')
    end
    mc.Eq=New.Eq;
else
    
    %  display('rifiutata')
    for i=1:Settings.repeat
        SigmaB_update(Settings)
        Noise_update(y)
        
    end
end

end


