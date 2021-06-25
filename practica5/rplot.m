function rplot(src,evnt)
st=evnt;
c=get(gcf,'UserData');
d=c{1};
rob=c{2};
datos=c{3};
pos=get(gca,'UserData');
mascarilla=[0 1 0 0 ;0 0 0 0 ;0 0 1 0 ;0 0 0 0;0 0 0 1];
artic=fieldnames(rob);
if  strcmp(evnt.Key,'pageup')
    if d==1
        set(gcf,'UserData',{3,rob,datos})
        leyenda(2)
    elseif d==3
         set(gcf,'UserData',{5,rob,datos})
         leyenda(3)
    elseif d==5
         set(gcf,'UserData',{6,rob,datos})
         leyenda(4)
    elseif d==6
        set(gcf,'UserData',{1,rob,datos})
        leyenda(1)
    end
    
         
elseif  strcmp(evnt.Key,'pagedown')
    if d==6
        set(gcf,'UserData',{5,rob,datos})
        leyenda(3)    
    elseif d==5
         set(gcf,'UserData',{3,rob,datos})
         leyenda(2)
    elseif d==3
         set(gcf,'UserData',{1,rob,datos})
         leyenda(1)
     elseif d==1
         set(gcf,'UserData',{6,rob,datos})
         leyenda(4)
    end 
elseif strcmp(evnt.Key,'uparrow')
    rob=rotador(rob,artic{d},1);
    if d~=6
     nuevap=rob.munecar.centro-1.5*rob.munecar.eje;
    datos.efector=[datos.efector;nuevap];
    datos.angulo=[datos.angulo;mascarilla(d,:)];
    pos.fin=nuevap;
    set(gca,'UserData',pos)
    leyenda(find(mascarilla(d,:))-1)
    end
    set(gcf,'UserData',{d,rob,datos})
elseif strcmp(evnt.Key,'downarrow')
    rob=rotador(rob,artic{d},-1);
    if d~=6
    nuevap=rob.munecar.centro-1.5*rob.munecar.eje;
    datos.efector=[datos.efector;nuevap];
    datos.angulo=[datos.angulo;-mascarilla(d,:)];
    pos.fin=nuevap;
    set(gca,'UserData',pos)
    leyenda(find(mascarilla(d,:))-1)
    end
    set(gcf,'UserData',{d,rob,datos})
elseif strcmp(evnt.Key,'leftarrow')
    rob=rotador(rob,'base',1);
    nuevap=rob.munecar.centro-1.5*rob.munecar.eje;
    datos.efector=[datos.efector;nuevap];
    datos.angulo=[datos.angulo;[1 0 0 0]];
    pos.fin=nuevap;
    set(gca,'UserData',pos)
    set(gcf,'UserData',{d,rob,datos})
    leyenda(find(mascarilla(d,:))-1)
elseif strcmp(evnt.Key,'rightarrow')
    rob=rotador(rob,'base',-1);
    nuevap=rob.munecar.centro-1.5*rob.munecar.eje;
    datos.efector=[datos.efector;nuevap];
    datos.angulo=[datos.angulo;-[1 0 0 0]];
    pos.fin=nuevap;
    set(gca,'UserData',pos)
    set(gcf,'UserData',{d,rob,datos})
    leyenda(find(mascarilla(d,:))-1)
end
