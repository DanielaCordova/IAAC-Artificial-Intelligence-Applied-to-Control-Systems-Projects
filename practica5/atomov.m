function atomov
masc=[0 1 2 3 4];
art=1;
c=get(gcf,'UserData');
rob=c{2};
datos=c{3};
pos=get(gca,'UserData');
tt=get(gcf,'UserData');
activo=tt{1};
if isempty(pos.fin)
    data
    pos=get(gca,'UserData');
    if isempty(pos.fin)
        return
    end
end
if (isa(pos.red.base,'network')&isa(pos.red.hombro,'network')&isa(pos.red.codo,'network')&isa(pos.red.mver,'network'))
ini=pos.ini;
artic={'base','hombro','codo','munecav','munecar'};
n=0;
while sqrt(sum((ini-pos.fin).^2))>pos.tolerancia
    angulos=[sim(pos.red.base,[ini';pos.fin']),sim(pos.red.hombro,[ini';pos.fin']),sim(pos.red.codo,[ini';pos.fin']),sim(pos.red.mver,[ini';pos.fin'])];
    angulos=round(angulos);
    d=find(angulos~=0);
    if isempty(d)|size(d,2)>1
        errordlg(['los valores suministrados por la(s) red(es) son incorrectos. Chequear el valor '...
        'selecionado para la posición final del efector o reentrenar las redes'],'Error');
        return
    end
    
    rob=rotador(rob,artic{d},angulos(d));
    drawnow 
    ini=rob.munecar.centro-1.5*rob.munecar.eje;
    datos.efector=[datos.efector;ini];
    datos.angulo=[datos.angulo;angulos];
    if masc(d)>0
        activo=masc(d);
    end
    set(gcf,'UserData',{art,rob,datos})
    leyenda(activo)    
end
else
    datosred=[isa(pos.red.base,'network') isa(pos.red.hombro,'network') isa(pos.red.codo,'network') isa(pos.red.mver,'network')];
    index=find(datosred==0);
    texto={'Falta una red para la base' 'Falta una red para el hombro' 'Falta una red para el codo' 'Falta una red para el hombro'}
    
    falta={texto{index}};
    errordlg(falta,'Error');
   
end