function brazo
h=figure('KeypressFcn',@rplot);
rob=bracito;
datos.efector=rob.munecar.centro-1.5*rob.munecar.eje;
texto=num2str(rob.munecar.centro-1.5*rob.munecar.eje);
plot3(datos.efector(1),datos.efector(2),datos.efector(3),'x')
datos.angulo=[];
pos.ini=datos.efector;
pos.fin=[];
pos.red.base=[];
pos.red.hombro=[];
pos.red.codo=[];
pos.red.mver=[];
pos.tolerancia=0.1;
set(h,'UserData',{1,rob,datos})
set(gca,'Userdata',pos)

f = uimenu('Label','datos');
    uimenu(f,'Label','reiniciar captura','Callback','reini');
    uimenu(f,'Label','exportar datos al workspace','Callback','exporta');
    uimenu(f,'Label','guardar datos','Callback','guardar');
g = uimenu('Label','red');
    uimenu(g,'Label','Marcar posiciones efector','Callback','data');
    l=uimenu(g,'Label','Importar  redes');
    uimenu(l,'label','base','Callback','rednueva(''base'')'); 
    uimenu(l,'label','hombro','Callback','rednueva(''hombro'')');
    uimenu(l,'label','codo','Callback','rednueva(''codo'')');
    uimenu(l,'label','muñeca ver.','Callback','rednueva(''mver'')'); 
    uimenu(g,'Label','Tolerancia','Callback','tolerancia');
    uimenu(g,'Label','Movimiento automatico','Callback','atomov');
j=  uimenu('Label','reset');
    uimenu(j,'Label','volver a la posicion de reposo','Callback','resetea');
title(['Hombro Activo' '    efpos->    ' texto],'BackGroundColor',[1 1 1])
