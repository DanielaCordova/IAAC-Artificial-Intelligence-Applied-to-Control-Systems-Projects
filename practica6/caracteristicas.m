function [tr,tp,Mp,ts,ys]=caracteristicas(tout,yout)

% Valor en el estacionario
  ys=yout(end);
  
% Tiempo de subida
  ind=find(yout>0.9*ys);
  tr=tout(ind(1));
  
% Tiempo de pico
  yp=max(yout);
  ind=find(yout==yp);
  tp=tout(ind(1));
  
% Sobreelongacion
  Mp=100*(yp-ys)/ys;
  
% Tiempo de asentamiento
  ind1=find(yout<1.02*ys);
  ind2=find(yout>0.98*ys);
  ind=intersect(ind1,ind2);
  tam=length(ind);
  for i=tam:-1:1
      if ~ismember(i,ind)
          break
      end
  end
  ts=tout(i);