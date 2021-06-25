function leyenda(d)
c=get(gcf,'Userdata');
rob=c{2};
a=rob.munecar.centro-1.5*rob.munecar.eje;
t=get(gca,'Children');
set(t(1),'XData',a(1),'YData',a(2),'Zdata',a(3))
texto=num2str(a);
mensaje={'hombro activo','Codo Activo','Muñeca vertical activo','Muñeca rotacion activo','pinza activa'};
colorin=[1 1 1;0 1 0;0 1 1;1 1 0];
title([mensaje{d},'    efpos->    ',texto],'Color',[0 0 0],'BackGroundColor',colorin(d,:))
   
