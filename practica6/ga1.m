function [x,fval,exitflag,output,population,score] = ga1(nvars)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'SelectionFcn', {  @selectiontournament [] });
options = optimoptions(options,'CrossoverFcn', @crossovertwopoint);
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'PlotFcn', { @gaplotbestf });
[x,fval,exitflag,output,population,score] = ...
ga(@fitnessFuction,nvars,[],[],[],[],[],[],[],[],options);
