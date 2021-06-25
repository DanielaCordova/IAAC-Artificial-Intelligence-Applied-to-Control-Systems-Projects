function reini
respuesta= questdlg(' Se perderan los datos capturados y se tomara como posicion inicial del efector la posicion actual. ¿continuar?','al loro','Si','No','Si');
if strcmp(respuesta,'Si')
machaca=get(gcf,'UserData');
machaca{3}.efector=machaca{2}.munecar.centro-1.5*machaca{2}.munecar.eje;
machaca{3}.angulo=[];
set(gcf,'UserData',machaca);
end