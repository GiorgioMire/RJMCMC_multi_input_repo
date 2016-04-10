function [New_Eq]=compute_Eq_New(y,u,Sets,New_pos)
global mc
T=Sets.Noise_all{mc.Noise_avaiable(New_pos)};
t=mc.t_base:mc.t_end;
aggiunta=zeros(length(t),1);
for i=1:length(t);
aggiunta(i,1)=T(t(i),u,y,mc.eestim);
end
if isempty(mc.Eq)
    New_Eq=aggiunta;
else
New_Eq=[mc.Eq,aggiunta];
end
end