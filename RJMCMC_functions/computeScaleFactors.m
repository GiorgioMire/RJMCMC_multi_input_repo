for j=1:length(Sets.Process_all)
    s=func2str(Sets.Process_all{j});
     reg= 'u{+[0-9]+}([^\*]+)';
termini=regexp(s,reg,'match')
uscita=regexp(s,'y([^\*\)]+)','match')
DU=1;
for m=1:length(termini)
    id=regexp(termini{m},'{[0-9]+}','match')
    id{1}=id{1}(2:end-1);
    rise=regexp(termini{m},'\^[0-9]+}','match')
    if isempty(rise)
            DU=DU*units(str2num(id{1}));
    else
    DU=DU*units(str2num(id{1}))^rise{1};
    end
    
end
DY=1;
for m=1:length(uscita)
    rise=regexp(uscita{m},'\^[0-9]+}','match')
    if isempty(rise)
        DY=DY*unitsy;
    else
    DY=DY*unitsy^(rise{1});
    end
end
SFP(j)=unitsy/DU/DY;
end
