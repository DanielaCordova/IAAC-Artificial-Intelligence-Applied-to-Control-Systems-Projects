function rob=bracito
%base

theta=0:0.1.*pi:2*pi;
rbase=0:0.1:2;
[rbm,tm]=meshgrid(rbase,theta);
xbm=rbm.*cos(tm);
ybm=rbm.*sin(tm);
h1=surfl(xbm,ybm,0.5.*ones(size(xbm)));
hold on
r2=2.*ones(1,11);
[rpm,tpm]=meshgrid(r2,theta);
xpm=rpm.*cos(tpm);
ypm=rpm.*sin(tpm);
h2=surfl(xpm,ypm,ones(size(xpm))*diag(0:0.05:0.5));
rob.hombro=eje(0,0,1,[0 1 0],90);
rob.brazo=tramo(0,0,1,[0 1 0],90);
rob.codo=eje(0,2,1,[0 1 0],90);
rob.antebrazo=tramo(0,2,1,[0 1 0],90);
rob.munecav=eje(0,4,1,[0 1 0],90);
rob.munecar=eje(0,4.75,1,[1 0 0 ],90);
rob.pinza=efector(0,5,1,[1 0 0],-90);
axis 'equal'
set(gca,'Xlim',[-7 7],'Ylim',[-7 7],'Zlim',[0 7])

colormap([1 0.5 0.5]);
light 
%lighting gouraud
shading interp
material metal

end

function heje=eje(x,y,z,rot,omega)
theta=0:0.1.*pi:2*pi;
r2=0.5.*ones(1,11);
[rpm,tpm]=meshgrid(r2,theta);
xpm=rpm.*cos(tpm);
ypm=rpm.*sin(tpm);
h=surfl(x+xpm,y+ypm,z-0.25+ones(size(xpm))*diag(0:0.05:0.5));
rotate(h,rot,omega,[x,y,z]);
heje.h=h;
heje.centro=[x y z];
heje.eje=cross(rot,[0 0 1]);
end

function ht=tramo(x,y,z,rot,omega)
theta=0:0.1.*pi:pi;
rbase=0:0.1:0.5;
[rbm,tm]=meshgrid(rbase,theta);
xbm=rbm.*cos(tm);
ybm=rbm.*sin(tm)+2 ;%la longitud del tramo es 2
t(1)=surfl(xbm+x,ybm+y,z+0.25+zeros(size(xbm)));
t(2)=surfl(xbm+x,ybm+y,z-0.25+zeros(size(xbm)));
theta=pi:0.1.*pi:2*pi;
[rbm,tm]=meshgrid(rbase,theta);
xbm=rbm.*cos(tm);
ybm=rbm.*sin(tm);
t(3)=surfl(xbm+x,y+ybm,z+0.25+zeros(size(xbm)));
t(4)=surfl(xbm+x,y+ybm,z-0.25+zeros(size(xbm)));
yl=0:0.1:2;
xl=-0.5:0.1:0.5;
[xlm,ylm]=meshgrid(xl,yl);
t(5)=surfl(xlm+x,ylm+y,z+0.25+zeros(size(xlm)));
t(6)=surfl(xlm+x,ylm+y,z-0.25+zeros(size(xlm)));
[xlm,ylm]=meshgrid(xl,yl);
rotatetr(t,rot,omega,[x,y,z]);
ht.h=t;
ht.centro=[x y z];
end

function he=efector(x,y,z,rot,omega,apert)
theta=0:0.1.*pi:2*pi;
rbase=0:0.1:0.5;
[rbm,tm]=meshgrid(rbase,theta);
xbm=rbm.*cos(tm);
ybm=rbm.*sin(tm);
e(1)=surfl(xbm+x,ybm+y,z+zeros(size(xbm)));
e(2)=surfl(xbm+x,ybm+y,z-0.5+zeros(size(xbm)));
theta=0:0.1.*pi:pi;
rbase=0:0.05:0.25;
[rbm,tm]=meshgrid(rbase,theta);
xbm=rbm.*cos(tm);
ybm=rbm.*5.*sin(tm);
e(3)=surfl(xbm+x,ybm+y,z+0.25+zeros(size(xbm)));
e(4)=surfl(xbm+x,ybm+y,z-0.25+zeros(size(xbm)));
f=[e(3),e(4)];
rotate(f,[0,0],90,[x,y,z]);
rotatetr(e,rot,omega,[x,y,z]);
he.h=e;
he.centro=[x y z];
end

function rotatetr(t,eje,degrees,point)
for i=1:size(t,2)
    rotate(t(i),eje,degrees,point);
end
end