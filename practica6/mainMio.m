rng default % For reproducibility
FitnessFunction = @fitnessFuction;
numberOfVariables = 3;
lb = [0.1,0.1, 0.1];
ub = [0.5,7,2];
[x,fval] = ga(FitnessFunction,numberOfVariables,[],[],[],[],lb,ub)