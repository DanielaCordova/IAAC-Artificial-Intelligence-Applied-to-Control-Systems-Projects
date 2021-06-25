function resetea
respuesta= questdlg([' Se perderan los datos capturados, se tomara como posicion inicial la posicion de reposo, '...
 'se mantendra como posicion final la posicion actual '...
 'y si se ha cargado una red se conservara. ¿continuar?'],'al loro','Si','No','Si');
if strcmp(respuesta,'Si')
pos=get(gca,'UserData');
hold off
rob=bracito;
datos.efector=rob.munecar.centro-1.5*rob.munecar.eje;
texto=num2str(rob.munecar.centro-1.5*rob.munecar.eje);
plot3(datos.efector(1),datos.efector(2),datos.efector(3),'x')
datos.angulo=[];
pos.ini=datos.efector;
set(gcf,'UserData',{1,rob,datos})
set(gca,'Userdata',pos)
title(['Hombro Activo' '    efpos->    ' texto],'BackGroundColor',[1 1 1])
end