function [New_Pk]=compute_Pk_New(y,u,Sets,New_pos)
global mc
aggiunta=[];
T=Sets.Process_all{mc.Process_avaiable(New_pos)};
t=mc.t_base:mc.t_end;
for i=1:length(t);
aggiunta(i,1)=T(t(i),u,y);
end
if ~isempty(mc.Pk) 
New_Pk=[mc.Pk,aggiunta];
else
    New_Pk=aggiunta;
end

end