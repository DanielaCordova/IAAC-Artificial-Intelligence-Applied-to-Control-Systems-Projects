function [tout,yout]=simular(pid,num,den,tr,tp,Mp,ts,ys) 

% Extraemos los parámetros del controlador
  Kp=pid(1); 
  Ki=pid(2); 
  Kd=pid(3); 

% Si no hay especificaciones las dejamos a cero por defecto
  if nargin<4
      tr=0; tp=0; Mp=0; ts=0; ys=0;
  end
  
% Calculamos el verctor de errores
  options=simset('solver','ode5','SrcWorkspace','Current');
  [tout,xout,yout]=sim('modelo',[0 100],options); 