function rednueva(a)

t=evalin('base','whos');
varn={t.name};
varc={t.class};
tredes=strcmp('network',varc);
if all(tredes==0)
    redes='no hay ninguna red en el workspace';
else
    redes={varn{tredes}};
end
    
[s,v] = listdlg('PromptString','Seleccionar una red',...
                'SelectionMode','single',...
                'ListString',redes);
if ~strcmp('no hay ninguna red en el workspace',redes);
  
pos=get(gca,'UserData');
switch(a)
    case('base')
        pos.red.base=evalin('base',redes{s});
    case('hombro')
         pos.red.hombro=evalin('base',redes{s});
    case('codo')
         pos.red.codo=evalin('base',redes{s});
    case('mver')
         pos.red.mver=evalin('base',redes{s});
end
set(gca,'UserData',pos)
end