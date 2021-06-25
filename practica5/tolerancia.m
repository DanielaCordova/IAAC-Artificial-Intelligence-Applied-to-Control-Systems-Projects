function tolerancia
pos=get(gca,'UserData');
tol=pos.tolerancia;

respuesta = inputdlg({'Tolerancia'},'Introducir tolerancia',1,{num2str(tol)});
if ~isempty(respuesta)
pos.tolerancia=str2num(respuesta{1});
set(gca,'UserData',pos)
end