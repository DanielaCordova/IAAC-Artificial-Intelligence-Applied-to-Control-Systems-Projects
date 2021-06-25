function vecr=rotadorr(a,b,c,phi)
%rota un vector a en torno al eje marcado por la direcion b y con origen en c, el angulo alpha (en grados)
%primero pasamos las coordenadas al origen del eje
%comprobamos que los vectores nos los han dado como vectores columnas, si no es asi les damos la vuelta
if size(a,1)<size(a,2)
    a=a';
end
if size(b,1)<size(b,2)
    b=b';
end
if size(c,1)<size(c,2)
    c=c';
end
na=a-c;
%cambiamos las razones trigonometricas de phi
sph=sin(phi*pi/180);
cph=cos(phi*pi/180);
%calculo de seno y coseno de la orientacion del eje:
%normalizamos b
b=b/norm(b);
if b==[1 0 0]'
    %la rotacion es de eje x asiesque al grano
    vecr=[1 0 0; 0 cph -sph; 0 sph cph]*na;
elseif b==[0 1 0]'
    %rotacion en torno al eje y 
    vecr=[cph 0 sph; 0 1 0; -sph 0 cph]*na;
elseif b==[0 0 1]'
    %rotacion en torno al eje z
    vecr=[cph -sph 0; sph cph 0; 0 0 1]*na;
else
    
sal=b(2)/sqrt(b(2)^2+b(3)^2);
cal=b(3)/sqrt(b(2)^2+b(3)^2);
sbe=b(1);
cbe=sqrt(b(2)^2+b(3)^2);
%construimos la matriz del giro
R=[1 0 0;0 cal sal;0 -sal cal];
R=R*[cbe 0 sbe; 0 1 0; -sbe 0 cbe];
R=R*[cph -sph 0; sph cph 0; 0 0 1];
R=R*[cbe 0 -sbe; 0 1 0; sbe 0 cbe];
R=R*[1 0 0;0 cal -sal;0 sal cal];
%multiplicamos el vector que por la matriz de rotacion
vecr=R*na;
end
%dehacemos la el desplazamiento del origen del vector
vecr=[vecr+c]';
