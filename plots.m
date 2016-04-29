% 
% figure(777)
% cor=xcorr(residual,residual,'biased',6);
% plot(cor/max(cor),'k')
% hold on
% plot(5/100*ones(size(cor)),'--r')
% hold on
% plot(-5/100*ones(size(cor)),'--r')
% hold off
figure(10)
subplot(3,4,1)
% hist(Series.Bq{Series.ModeNoise(end)}.',100);
hist(Series.sk,100);
title('N termini')
subplot(3,4,2)
 hist(Series.modelserie_process,150);
 title(' modello')
 subplot(3,4,3)
plot(mc.t_base:mc.t_end,y(mc.t_base:mc.t_end))
 subplot(3,4,4)
 title('y')
plot(mc.t_base:mc.t_end,u{1}(mc.t_base:mc.t_end))
 title(' u1')
for j=5:12
subplot(3,4,j)
try
    id=Series.ModeProcess(end);
    model=str2num(Series.model_from_codeP(id));
hist((Series.Ak{id}(j-4,:)),100)
title(func2str(Sets.Process_all{model(j-4)}))
catch
    plot(0,0);
end
drawnow
end


figure(895)
plot(mc.t_base:mc.t_end,y(mc.t_base:mc.t_end))
hold on
 title('y')
plot(mc.t_base:mc.t_end,u{1}(mc.t_base-1:mc.t_end-1),'r')
 title(' u1')
 hold off