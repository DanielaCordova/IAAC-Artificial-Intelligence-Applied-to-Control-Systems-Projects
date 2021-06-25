function robot
h=figure('KeypressFcn',@rplot);
rob=bracito
set(h,'UserData',{1,rob,[0 90 -1 90 -1 90 90],rob.pinza.centro})
title('Hombro Activo','BackGroundColor',[1 1 1])

f = uimenu('Label','Workspace');
    uimenu(f,'Label','Save','Callback','rob=get(gcf,''UserData'');robs=rob{4};robe=rob{3};uisave({''robe'',''robs''})');
    uimenu(f,'Label','Quit','Callback','exit',... 
           'Separator','on','Accelerator','Q');