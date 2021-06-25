global time
den1=[1 6 5 0];
num1=[1];
sysrl=tf(num1,den1);
%____________________________________________________________________
%Initialising the genetic algorithm
populationSize=30;
variableBounds=[-100 100;-100 100;-100 100];
evalFN='PID_objfun_MSE';
%Change this to relevant object function
evalOps=[];
options=[1e-6 1];
initPop=initializeoga(populationSize,variableBounds,evalFN,evalOps,options);
%____________________________________________________________________
%Setting the parameters for the genetic algorithm
bounds=[-100 100;-100 100;-100 100];
evalFN='fitnessFuction';%change this to relevant object function
evalOps=[];
startPop=initPop;
opts=[1e-6 1 0];
termFN='maxGenTerm';
termOps=100;
selectFN='roulette';
selectOps=0.08;
xOverFNs='arithXover';
xOverOps=4;
mutFNs='unifMutation';
mutOps=8;
%____________________________________________________________________
%Iterating the genetic algorithm
 [x,endPop,bPop,traceInfo]=ga(bounds,evalFN,evalOps,startPop,termFN,...
     [50],[],[],[],[],mutFNs,mutOps);
 %[x,endPop,bPop,traceInfo]=ga(bounds,'GAeval',evalOps,startPop,'optMaxGenTerm',...
  %  [maxGen 0.0 1e-6],[],[],[],[],mutFNs,mutOps);
%____________________________________________________________________ 
%Plotting Genetic algorithm controller
den1=[1 6 5 0];
num1=[1];
sysrl=tf(num1,den1);
%Creating the optimal PID controller from GA results
ga_pid=tf([x(1) x(2) x(3)],[1 0]);
ga_sys=feedback(series(ga_pid,sysrl),1);
figure(1)
hold on;
step(ga_sys,time,'g');%Green-genetic algorithm 
%Plotting best population progress
figure(2)
subplot(3,1,1),plot(bPop(:,1),bPop(:,3)),...
title('Kp Value'),, ylabel('Gain');
subplot(3,1,2),plot(bPop(:,1),bPop(:,4)),...
title('Ki Value'),, ylabel('Gain');
subplot(3,1,3),plot(bPop(:,1),bPop(:,2)),...
title('Kd Value'),xlabel('Generations'), ylabel('Gain'); 