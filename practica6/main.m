 %SintonizaciˆUn de un control PID
 %mediante un algoritmo gen`Etico
 clear all; clc; format long
 tic
 N = 200; %Numero de individuos
 V = 3; %Numero de variables independientes
 ITER_MAX = 20; %Maximo numero de iteraciones
 mut = 5; %Porcentaje de mutacion
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %Parametros del sistema din·mico
 tspan = 0:0.01:4; %Tiempo de simulaciˆUn
 w = 10; z = 0.5; %parametros del sistema de
 %segundo orden
 T1 = 0.2; % Tiempo de retardo del sistema
 % primer orden
 %Intervalo de busqueda
 %I = [0.4 0.55; 4 6;0 0.1];
 I = [0.4 0.6; 4 6;0 0.08];
 w1 = 1;
 z1 = 0.5;
 %Respuesta deseada
 Yd=1;
 t=100;
 %[t,Yd] = ode45(@Primer Orden,tspan,[0],[],T1);
 %[t,X] = ode45(@Segundo Orden,tspan,[0 0],[],w1,z1);
 %Yd = X(:,1)
 %plot(t,Yd);
 %Generamos la poblacion en el
 PobReal = [0.27639 6.6 1.65] %Poblacion(N,V,I);
 cont = 1;

 %while ((cont ≤ ITER MAX) && (ff aux > Epsilon))
 while (cont <= ITER_MAX)
     %Determinamos la funcion costo
     ff = fitnessFuction(PobReal); %costo(PobReal,Yd,w,z,tspan);
     ff_aux(cont) = min(ff);
     %Seleccionamos la poblacion
     PobSel = Seleccion(PobReal,ff);
     %Cruzamos la Pob seleccionada
     Pob_C = CruceR(PobSel,V);
     %Concatenamos PobSel + Pob C
     PobReal = [PobSel;Pob C];
     %Mutamos la nueva poblacion
     PobReal = Mutacion(PobReal,I,mut);
     cont = cont +1;
   end
     toc
     %Actualizamos la ff con la ultima PobReal
     ff = fcosto(PobReal,Yd,w,z,tspan);
     [val idx] = min(ff);
     semilogy(ff_aux);
     %Los mejores parametros.
     kp = PobReal(idx,1)
     ki = PobReal(idx,2)
     kd = PobReal(idx,3)
