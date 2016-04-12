function [residual]=calculateResidual(y)
global mc
ycut=y(mc.t_base:mc.t_end);
residual=ycut-ezp(mc.Pk,mc.ak,ycut)-ezp(mc.Eq,mc.bq,ycut);
% figure(5)
% plot(residual)
% pause(0.01)
cutInterval=mc.t_base:mc.t_end;
mc.eestim(cutInterval)=residual;
% mc.eestim(abs(mc.eestim)>10000)=10000;

% mc.eestim(abs(mc.eestim)>100)=100;
end