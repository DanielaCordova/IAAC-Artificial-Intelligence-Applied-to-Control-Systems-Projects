function [K,T]=ZN(num,den)

% Solo hacemos control proporcional
  Ki=0; 
  Kd=0; 
  
% Calculo de la ganancia proporcional K
  h=figure;
  set(h,'DoubleBuffer','on');
  K=0;
  new_ind=1e10;
  old_ind=new_ind+1;
  while new_ind<old_ind
      old_ind=new_ind;
      K=K+0.01;
      pid=[K 0 0];
      [tout,yout]=simular(pid,num,den);
      plot(tout,yout);
      title('SINTONIA MEDIANTE ZIEGLER-NICHOLS');
      xlabel('Tiempo (s)');
      ylabel('Salida');
      axis([0 100 0 1.3]);
      grid;
      new_ind=find(yout==max(yout));
  end
  close;

% Calculo del periodo T
  G=tf(num,den);
  Glc=feedback(K,G);
  [ignore,polos,ignore]=zpkdata(Glc);
  polos=cell2mat(polos);
  T=2*pi/abs(polos(2));