function data
c=get(gcf,'UserData');
rob=c{2};
posact=rob.munecar.centro-1.5*rob.munecar.eje;
pos=get(gca,'UserData');
respuesta = inputdlg({'Posicion inicial','Posicion final'},'Introducir posiciones',1,{num2str(posact),num2str(pos.fin)});
if ~isempty(respuesta)
pos.ini=str2num(respuesta{1});
pos.fin=str2num(respuesta{2});
set(gca,'UserData',pos)
end