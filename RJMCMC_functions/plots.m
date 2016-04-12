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
subplot(2,2,1)
% hist(Series.Bq{Series.ModeNoise(end)}.',100);
hist(Series.sk,100);
subplot(2,2,2)
try
hist(1./(Series.Ak{Series.ModeProcess(end)}(1,:)/0.2),100)
end
subplot(2,2,3)
try
hist(Series.Ak{Series.ModeProcess(end)}(3,:)/0.2*288.5,100)
end
drawnow
subplot(2,2,4)
try
hist(Series.Ak{Series.ModeProcess(end)}(4,:)/0.2*288.5,100)
end
drawnow